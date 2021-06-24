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
    
}
