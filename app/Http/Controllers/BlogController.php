<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Posts;
use App\Models\CategoryPost;
use Carbon\Carbon;

class BlogController extends Controller
{
    //
    public function index(){
        
        $posts = (new Posts)->getPostsPaginate(10);
        $title = 'Blog';
        return view('public.blog.blog', compact(['posts', 'title']));
    }

    public function category(CategoryPost $categoryPost){
        $posts = $categoryPost->getPostsPaginate(10);
        $title = $categoryPost->title;
        return view('public.blog.blog', compact(['posts', 'title']));
    }

    public function detail(Posts $post){
        $title = $post->title;
        $cat_id = $post->category()->orderBy('id', 'DESC')->first()->id;
        $related_posts = CategoryPost::find($cat_id)->getPostNotInHasTake([$post->id], 3);
        return view('public.blog.detail', compact(['post', 'related_posts', 'title']));
    }

    public function search(Request $request){
        if($key == '!@'){
            $product = Product::select('id', 'product_avatar', 'product_name')->orderby('id', 'DESC')->take(10)->get();
        }
        else{
            $product = Product::select('id', 'product_avatar', 'product_name')->where('product_name', 'like', '%'.$key.'%')->orderby('id', 'DESC')->take(10)->get();
        }
        $data ='';
        foreach ($product as $value) {

            $data .= '<li class="list-group-item list-group-item-action">
            <a href="'.url('/admin/product/editproduct/'.$value->id).'">
                <img class="mr-1" src="'.asset($value->product_avatar).'" alt=""><span>'.$value->product_name.'</span></a>
            </li>';
        }
        return $data;
    }
    
}
