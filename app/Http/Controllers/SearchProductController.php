<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SearchProductController extends Controller
{
    //
    public function searchProduct(Request $request){
        $url = $request->fullUrl();
        $url = explode('?keyword=',$url);
        $keyword = $_GET['keyword'];

        $product_showonload = DB::table('product')->where('title', 'LIKE', '%' . $keyword . '%')->paginate('8');

        $count_product = DB::table('product')->where('title', 'LIKE', '%' . $keyword . '%')->count();

        return view('public.product.searchProduct',['product_showonload'=>$product_showonload, 'count_product'=>$count_product,'keyword'=>$keyword]);
    }


}
