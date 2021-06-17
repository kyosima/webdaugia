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
        $arr = CategoryPost::where('slug', 'kien-thuc')->first();
        $kienthuc1 = $arr ? $arr->posts()->orderBy('id', 'DESC')->first() : array();

        $arr = CategoryPost::where('slug', 'kien-thuc')->first();
        $kienthuc2 = $arr ? $arr->posts()->whereNotIn('id', [$kienthuc1->id])->orderBy('id', 'DESC')->get() : array();
        $arr = CategoryPost::where('slug', 'tin-tuc-dau-gia')->first();
        $tindaugia = $arr ? $arr->posts()->orderBy('id', 'DESC')->take(2)->get() : array();
        
        return view('public.home', compact(['kienthuc1', 'kienthuc2', 'tindaugia']));
    }
    public function contact(){
        return view('public.contact');
    }
    
}
