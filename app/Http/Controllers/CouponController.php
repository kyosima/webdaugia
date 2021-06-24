<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\DB;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $coupons = Coupon::all();
    }

    public function useCoupon(Request $request)
    {
        $coupon = Coupon::findByCode($request->couponCode);

        foreach (Cart::instance('shopping')->content() as $item) {
            if ($coupon->coupon_product != '') {
                $couponProduct = explode(",", $coupon->coupon_product);
            } else {
                $couponProduct = array('rong');
            }

            if ($coupon->coupon_category != '') {
                $couponCategory = explode(",", $coupon->coupon_category);
            } else {
                $couponCategory = array('rong');
            }

            // Tính tổng giá tiền các sản phẩm ĐƯỢC giảm 
            $priceDiscount = 0;

            foreach (Cart::instance('shopping')->content() as $item) {
                if (in_array($item->id, $couponProduct) && in_array($item->model->getArrCategory(), $couponCategory)) {
                    $priceDiscount += $item->price * $item->qty;
                } else {
                    if (in_array($item->id, $couponProduct)) {
                        $priceDiscount += $item->price * $item->qty;
                    }
                    elseif (in_array($item->model->getArrCategory(), $couponCategory)) {
                        $priceDiscount += $item->price * $item->qty;
                    }
                    elseif($coupon->coupon_product == "" && $coupon->coupon_category == ""){
                        $priceDiscount = Cart::instance('shopping')->subtotal();
                    }
                }
            }

            if ($priceDiscount <= 0) {
                return redirect()->route('public.cart.shopcart')->withErrors('Coupon không áp dụng các sản phẩm này');
            }

            $discount = $coupon->discount($priceDiscount);
            $subtotal = intval(str_replace(".","",Cart::instance('shopping')->subtotal()));
            $newSubtotal = $subtotal - $discount;

            session()->put('coupon', [
                'name' => $coupon->coupon_code,
                'discount' => $discount,
                'newSubtotal' => $newSubtotal,
            ]);

            return redirect()->back();
        }
    }

    public function unUseCoupon(){
        session()->forget('coupon');

        return redirect()->back();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $pro = implode(',', $request->coupon_product);
        $cat = implode(',', $request->coupon_category);
        Coupon::insert([
            'coupon_type' => $request->coupon_type,
            'coupon_code' => $request->coupon_code,
            'coupon_desc' => $request->coupon_desc,
            'coupon_value' => $request->value,
            'coupon_product' => $pro,
            'coupon_category' => $cat,
            'coupon_exp' => $request->coupon_exp,
        ]);
        return redirect()->route('coupon.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Coupon $coupon)
    {
        $pro = implode(',', $request->coupon_product);
        $cat = implode(',', $request->coupon_category);
        $coupon->update([
            'coupon_type' => $request->coupon_type,
            'coupon_code' => $request->coupon_code,
            'coupon_desc' => $request->coupon_desc,
            'coupon_value' => $request->value,
            'coupon_product' => $pro,
            'coupon_category' => $cat,
            'coupon_exp' => $request->coupon_exp,
        ]);
        return redirect()->route('coupon.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Coupon $coupon)
    {
        $coupon->delete();
        return redirect()->route('coupon.index');
    }
}
