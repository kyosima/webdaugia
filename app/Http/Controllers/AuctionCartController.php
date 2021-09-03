<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AuctionCartController extends Controller
{
    public function index()
    {
        if (Cart::instance('auction')->count() > 0) {
            return view('public.cart.shopAuctionCart');
        } else {
            return redirect()->route('san-pham.index');
        }
    }

    public function addToCart(Request $request)
    {
        $product = Product::where('id', $request->id)->first();
        $price = DB::table('campaign_details')->where('status', 2)
            ->where('is_ordered', 0)
            ->where('user_id', $request->userId)
            ->where('campaign_id', $request->camId)
            ->where('product_id', $product->id)->first();

        // lay rowId de update ne 
        $rowId = array_keys(Cart::instance('auction')->search(function ($cartItem) use ($request) {
            return $cartItem->id == $request->id;
        })->toArray());

        if(count(Cart::content()->where('id', $product->id)) < 1) {
            Cart::instance('auction')->add([
                'id' => $product->id,
                'name' => $product->title,
                'qty' => 1,
                'price' => $price->price_end,
                'options' => [
                    'feature_img' => $product->avatar,
                    'slug' => $product->slug,
                    'campaign_ids' => [$request->camId]
                ]
            ])->associate('App\Models\Product');
        } else {
            $priceCart = Cart::instance('auction')->get($rowId[0])->price;
            $qty = Cart::instance('auction')->get($rowId[0])->qty;
            $campaign_ids = Cart::instance('auction')->get($rowId[0])->options['campaign_ids'];
            array_push($campaign_ids, $request->camId);
            $qty += 1;
            // update
            $priceCart += $price->price_end;
            $priceCart /= $qty;
            Cart::instance('auction')->update($rowId[0], [
                'price' => $priceCart,
                'qty' => $qty,
                'options' => [
                    'feature_img' => $product->avatar,
                    'slug' => $product->slug,
                    'campaign_ids' => $campaign_ids
                ]
            ]);
        }

        return response()->json([
            Cart::instance('auction')->count(),
            $product->title
        ], 200);
    }

    public function removeFromCart(Request $request)
    {
        Cart::instance('auction')->remove($request->rowID);
        return response()->json([
            Cart::instance('auction')->content(),
            Cart::instance('auction')->subtotal(),
            Cart::instance('auction')->count(),
            route('san-pham.index'),
            route('trangchu'),
        ], 200);
    }
}
