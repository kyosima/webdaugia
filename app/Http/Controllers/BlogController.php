<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Posts;
use App\Models\CategoryPost;

class BlogController extends Controller
{
    //
    public function index(){
        $posts = Posts::paginate(10);
        $title = 'Blog';
        return view('public.blog.blog', compact(['posts', 'title']));
    }

    public function category(CategoryPost $categoryPost){
        $posts = $categoryPost->posts()->paginate(10);
        $title = $categoryPost->title;
        return view('public.blog.blog', compact(['posts', 'title']));
    }

    public function detail(Posts $post){
        $title = $post->title;
        $cat_id = $post->category()->orderBy('id', 'DESC')->first()->id;
        $related_posts = CategoryPost::find($cat_id)->posts()->whereNotIn('id', [$post->id])->orderBy('id', 'DESC')->take(3)->get();
        return view('public.blog.detail', compact(['post', 'related_posts', 'title']));
    }
    
}
