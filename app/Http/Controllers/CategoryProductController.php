<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CategoryProductController extends Controller
{
    //

    public function index(){
        return view('public.product.shop');
    }
}
