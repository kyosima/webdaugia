<?php

namespace App\Http\Controllers;

use App\Models\Bill;
use App\Models\BillAddress;
use App\Models\BillDetail;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    //
    public function index(){
        if(Cart::instance('shopping')->count() == 0) {
            return redirect('/');
        }
        $cities = DB::table('province')->get();
        return view('public.cart.checkout', compact('cities'));
    }

    // thuc hien dua len db va send mail cho user + admin
    public function checkout(Request $request){
        $cart = Cart::instance('shopping')->content();

        $fullAddress = $request->customer_Address . ', ' . $request->phuong . ', ' . $request->quan . ', ' . $request->thanhpho;

        return DB::transaction(function() use ($request, $cart, $fullAddress){
            try {
                $bill = Bill::create([
                    'id_ofuser' => auth()->user() ? auth()->user()->id : null,
                    'note' => $request->customer_Note,
                    'payment_method' => 1,
                    'bill_total' => intval(str_replace(".","",$request->bill_total)),
                    'bill_promo' => intval(str_replace(".","",$request->bill_promo)),
                    'bill_coupon' => $request->bill_coupon,
                    'bill_soluong' => $request->bill_soluong,
                ]);
        
                $bill_address = new BillAddress();
                $bill_address->name = $request->customer_Name;
                $bill_address->email = $request->customer_Email;
                $bill_address->phone = $request->customer_Phone;
                $bill_address->address = $fullAddress;
               
                $bill->bill_address()->save($bill_address);
        
                foreach($cart as $item){
                    BillDetail::create([
                        'id_ofbill' => $bill->id,
                        'id_ofproduct' => $item->id,
                        'SL' => $item->qty,
                    ]);
                }
        
                session()->put('bill',[
                    'billId' => $bill->id,
                    'street' => $request->customer_Address,
                    'phuong' => $request->phuong,
                    'quan' => $request->quan,
                    'thanhpho' => $request->thanhpho,
                ]);

                Cart::instance('shopping')->destroy();
                $this->orderSuccess();

            } catch (\Throwable $th) {
                throw new \Exception('Đã có lỗi xảy ra vui lòng thử lại');
                return redirect()->back()->withErrors(['error' => $th->getMessage()]);
            }
        });

        
    }

    // show cho KH de ktra thong tin
    public function orderSuccess(){
        if(session('bill')){
            $bill = Bill::where('id', session('bill.billId'))->first();
            $info = $bill->bill_address;

            $products = $bill->bill_detail;
            $street = session('bill.street');
            $phuong = session('bill.phuong');
            $quan = session('bill.quan');
            $thanhpho = session('bill.thanhpho');

            // $this->sendMail(session('bill.billId'), $info, $products);

            session()->forget('bill');
            session()->forget('coupon');
            return view('public.cart.orderSuccess', compact('bill', 'info', 'products', 'street', 'quan', 'phuong', 'thanhpho'));
        } else {
            return redirect('/');
        }
    }

    public function sendMail($id, $info, $products)
    {
        $bill = Bill::where('id', $id)->first();
        $userEmail = $info->email;

        // send mail
        $content = [
            'name' => $info->name,
            'phone' => $info->phone,
            'email' => $userEmail,
            'address' => $info->address,
            'billID' => $bill->id,
            'items' => $products,
            'total' => $bill->bill_total,
            'promo' => $bill->bill_promo,
        ];
        Mail::send('emails.sendMailToUser', $content, function ($message) use ($userEmail) {
            $message->to($userEmail)->subject('MEVIVU');
        });
    }

    public function getLocation(Request $request)
    {
        $parentId = $request->parent;
        $type = $request->type;
        if($parentId && $type == 'city'){
            $location = DB::table('district')->where('_province_id', $parentId)->get();
            return response(['data' => $location]);
        } else {
            $location = DB::table('ward')->where('_district_id', $parentId)->get();
            return response(['data' => $location]);
        }
    }
}
