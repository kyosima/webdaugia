<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\DB;

class CouponController extends Controller
{

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

}
