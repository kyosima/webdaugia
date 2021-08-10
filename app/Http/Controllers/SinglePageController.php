<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SinglePageController extends Controller
{
    //

    public function breeders(){
        return view('public.page.breeders');
    }

    public function policyAgent(){
        return view('public.page.policyAgent');
    }

    public function auctionGuide(){
        return view('public.page.auctionGuide');
    }

    public function introduce(){
        return view('public.page.introduce');
    }
    
}
