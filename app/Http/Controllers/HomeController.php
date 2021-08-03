<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Posts;
use App\Models\CategoryPost;
use Illuminate\Support\Str;

class HomeController extends Controller
{
    //
    public function home(){
        // $cat = CategoryPost::where('slug', 'kien-thuc')->first();
        // $kienthuc1 = $cat ? $cat->getPostFirst() : array();

        // $kienthuc2 = $cat ? $cat->getPostNotInHasTake([$kienthuc1->id], 8) : array();

        // $cat = CategoryPost::where('slug', 'tin-tuc-dau-gia')->first();
       
        // $tindaugia = $cat ? $cat->getPostHasTake(2) : array();
        $kienthuc1 = [];
        $kienthuc2 = [];
        $tindaugia = [];
        return view('public.home', compact(['kienthuc1', 'kienthuc2', 'tindaugia']));
    }
    public function contact(){
        return view('public.contact');
    }
    
}
