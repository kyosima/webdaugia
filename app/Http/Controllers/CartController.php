<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Product;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartController extends Controller
{
    //
    public function index(){
        if(Cart::instance('shopping')->count() > 0) {
            // return view('frontend.cart', compact('discount', 'newTotal'));
            return view('public.cart.shopcart');
        } else {
            return redirect()->route('san-pham.index');
        }
    }

    public function fastAddToCart(Request $request) {
        $product = Product::where('id', $request->id)->first();
        
        if($product->discount !=  0 ){
            Cart::instance('shopping')->add([
                'id' => $product->id,
                'name' => $product->title,
                'qty' => 1,
                'price' => ($product->price - round($product->price*$product->discount/100)),
                'options' => [
                    'feature_img' => $product->avatar,
                    'slug' => $product->slug,
                    'price_regular' => $product->price,
                ]
            ])->associate('App\Models\Product');
        } else {
            Cart::instance('shopping')->add([
                'id' => $product->id,
                'name' => $product->title,
                'qty' => 1,
                'price' => $product->price,
                'options' => [
                    'feature_img' => $product->avatar,
                    'slug' => $product->slug,
                ]
            ])->associate('App\Models\Product');
        }

        return response()->json([
            Cart::instance('shopping')->content(),
            Cart::instance('shopping')->subtotal(),
            Cart::instance('shopping')->count(),
        ],200);
    }

    public function addToCart(Request $request) {
        $product = Product::where('id', $request->id)->first();
        
        if($product->discount !=  0 ){
            Cart::instance('shopping')->add([
                'id' => $product->id,
                'name' => $product->title,
                'qty' => $request->qty,
                'price' => ($product->price - round($product->price*$product->discount/100)),
                'options' => [
                    'feature_img' => $product->avatar,
                    'slug' => $product->slug,
                    'price_regular' => $product->price,
                ]
            ])->associate('App\Models\Product');
        } else {
            Cart::instance('shopping')->add([
                'id' => $product->id,
                'name' => $product->title,
                'qty' => $request->qty,
                'price' => $product->price,
                'options' => [
                    'feature_img' => $product->avatar,
                    'slug' => $product->slug,
                ]
            ])->associate('App\Models\Product');
        }

        return response()->json([
            Cart::instance('shopping')->content(),
            Cart::instance('shopping')->subtotal(),
            Cart::instance('shopping')->count(),
        ],200);
    }

    public function updateCart(Request $request) {
        Cart::instance('shopping')->update($request->rowID, $request->qty);

        return response()->json([
            Cart::instance('shopping')->content(),
            Cart::instance('shopping')->subtotal(),
            Cart::instance('shopping')->count(),
        ],200);
    }

    public function removeFromCart(Request $request) {
        Cart::instance('shopping')->remove($request->rowID);
        return response()->json([
            Cart::instance('shopping')->content(),
            Cart::instance('shopping')->subtotal(),
            Cart::instance('shopping')->count(),
        ],200);
    }
    
}
