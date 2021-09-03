<?php

namespace App\Http\Controllers;

use App\Models\Bill;
use App\Models\BillAddress;
use App\Models\BillDetail;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class AuctionCheckoutController extends Controller
{
    public function index()
    {
        if (Cart::instance('auction')->count() == 0) {
            return redirect('/');
        }
        $cities = DB::table('province')->get();
        return view('public.cart.AuctionCheckout', compact('cities'));
    }

    // thuc hien dua len db va send mail cho user + admin
    public function checkout(Request $request)
    {
        $cart = Cart::instance('auction')->content();

        $validation = $request->validate([
            'payment_method' => 'required|in:cod,banking',
            'customer_Name' => 'required',
            'customer_Phone' => ['required', 'regex:/((09|03|07|08|05)+([0-9]{8})\b)|(84)\d{9}/'],
            'customer_Email' => 'required|email',
            'customer_City' => 'required',
            'customer_District' => 'required',
            'customer_Ward' => 'required',
            'customer_Address' => 'required',
            'bill_total' => 'required',
            'bill_subtotal' => 'required',
            'bill_soluong' => 'required',
        ]);

        $fullAddress = $request->customer_Address . ', ' . $request->phuong . ', ' . $request->quan . ', ' . $request->thanhpho;

        return DB::transaction(function () use ($request, $cart, $fullAddress) {
            try {
                $bill = Bill::create([
                    'id_ofuser' => auth()->user()->id,
                    'note' => $request->customer_Note,
                    'payment_method' => $request->payment_method == "cod" ? 1 : 0,
                    'bill_subtotal' => $request->bill_subtotal,
                    'bill_total' => $request->bill_total,
                    'bill_promo' => null,
                    'bill_coupon' => null,
                    'bill_soluong' => $request->bill_soluong,
                ]);

                $bill_address = new BillAddress();
                $bill_address->name = $request->customer_Name;
                $bill_address->email = $request->customer_Email;
                $bill_address->phone = $request->customer_Phone;
                $bill_address->address = $fullAddress;

                $bill->bill_address()->save($bill_address);

                foreach ($cart as $item) {
                    BillDetail::create([
                        'id_ofbill' => $bill->id,
                        'id_ofproduct' => $item->id,
                        'SL' => $item->qty,
                        'end_price' => $item->price
                    ]);
                    // update product to is_ordered
                    foreach ($item->options['campaign_ids'] as $cam_id) {
                        DB::table('campaign_details')->where('campaign_id', $cam_id)
                                                    ->where('product_id', $item->id)
                                                    ->where('user_id', auth()->user()->id)
                                                    ->where('status', 2)
                                                    ->update([
                                                        'is_ordered' => 1
                                                    ]);
                    }
                }

                session()->put('bill', [
                    'billId' => $bill->id,
                    'street' => $request->customer_Address,
                    'phuong' => $request->phuong,
                    'quan' => $request->quan,
                    'thanhpho' => $request->thanhpho,
                ]);

                Cart::instance('auction')->destroy();
                return redirect()->route('auctioncheckout.orderSuccess');
            } catch (\Throwable $th) {
                throw new \Exception('Đã có lỗi xảy ra vui lòng thử lại');
                return redirect()->back()->withErrors(['error' => $th->getMessage()]);
            }
        });
    }

    // show cho KH de ktra thong tin
    public function orderSuccess()
    {
        if (session('bill')) {
            $bill = Bill::where('id', session('bill.billId'))->first();
            $info = $bill->bill_address;

            $products = $bill->bill_detail;

            $street = session('bill.street');
            $phuong = session('bill.phuong');
            $quan = session('bill.quan');
            $thanhpho = session('bill.thanhpho');

            $this->sendMail($bill, $info, $products);

            session()->forget('bill');
            session()->forget('coupon');
            return view('public.cart.orderSuccess', compact('bill', 'info', 'products', 'street', 'quan', 'phuong', 'thanhpho'));
        } else {
            return redirect('/');
        }
    }

    public function sendMail($bill, $info, $products)
    {
        $userEmail = $info->email;
        // send mail
        $content = [
            'name' => $info->name,
            'phone' => $info->phone,
            'email' => $userEmail,
            'address' => $info->address,
            'billID' => $bill->id,
            'items' => $products,
            'subtotal' => $bill->bill_subtotal,
            'total' => $bill->bill_total,
            'promo' => $bill->bill_promo,
            'coupon' => $bill->bill_coupon,
            'payment' => $bill->payment_method,
        ];

        $message = view('emails.sendMailToUser');

        Mail::send('emails.sendMailToUser', $content, function ($message) use ($userEmail) {
            $message->to($userEmail)->subject('Đặt hàng thành công');
        });

        Mail::send('emails.sendMailToAdmin', $content, function ($message) {
            $message->to('quocminh.brave@gmail.com')->subject('Có đơn hàng mới');
        });
        
    }
}
