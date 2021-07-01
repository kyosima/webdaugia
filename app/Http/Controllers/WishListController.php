<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class WishListController extends Controller
{
    //
    public function index()
    {
        if (Cart::instance('wishlist')->count() > 0) {
            return view('public.cart.wishlist');
        }
        return redirect()->route('san-pham.index');
    }

    public function addToWishList(Request $request)
    {
        $product = Product::where('id', $request->id)->first();

        if($product->discount !=  0 ){
            if (Cart::instance('wishlist')->count() == 0) {
                Cart::instance('wishlist')->add([
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
                return response()->json([
                    Cart::instance('wishlist')->count(),
                    route('wishlist.index'),
                    $product,
                ],200);
            } else {
                $arr = Cart::instance('wishlist')->search(function ($cartItem) use ($product) {
                    return $cartItem->id == $product->id;
                })->toArray();
                if(!$arr) {
                    Cart::instance('wishlist')->add([
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
                    return response()->json([
                        Cart::instance('wishlist')->count(),
                        route('wishlist.index'),
                        $product,
                    ], 200);
                }
            }
        } else {
            if (Cart::instance('wishlist')->count() == 0) {
                Cart::instance('wishlist')->add([
                    'id' => $product->id,
                    'name' => $product->title,
                    'qty' => 1,
                    'price' => $product->price,
                    'options' => [
                        'feature_img' => $product->avatar,
                        'slug' => $product->slug,
                    ]
                ])->associate('App\Models\Product');
                return response()->json([
                    Cart::instance('wishlist')->count(),
                    route('wishlist.index'),
                    $product,
                ], 200);
            } else {
                $arr = Cart::instance('wishlist')->search(function ($cartItem) use ($product) {
                    return $cartItem->id == $product->id;
                })->toArray();
                if(!$arr) {
                    Cart::instance('wishlist')->add([
                        'id' => $product->id,
                        'name' => $product->title,
                        'qty' => 1,
                        'price' => $product->price,
                        'options' => [
                            'feature_img' => $product->avatar,
                            'slug' => $product->slug,
                        ]
                    ])->associate('App\Models\Product');
                    return response()->json([
                        Cart::instance('wishlist')->count(),
                        route('wishlist.index'),
                        $product,
                    ], 200);
                }
            }
        }
        
        return response()->json([
            $product,
            route('wishlist.index'),
        ], 201);
    }

    public function removeFromWishList(Request $request)
    {
        Cart::instance('wishlist')->remove($request->rowID);
        return redirect()->route('wishlist.index');
    }

    public function changeWishToCart(Request $request)
    {
        Cart::instance('wishlist')->remove($request->rowID);
        $product = Product::where('id', $request->id)->first();

        if ($product->discount !=  0) {
            Cart::instance('shopping')->add([
                'id' => $product->id,
                'name' => $product->title,
                'qty' => 1,
                'price' => ($product->price - round($product->price * $product->discount / 100)),
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

        return redirect()->route('wishlist.index');
    }
}
