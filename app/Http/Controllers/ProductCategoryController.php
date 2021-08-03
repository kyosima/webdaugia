<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductCategory;

class ProductCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $products_onsale = Product::latest()->with('category')->where('discount','<>',0)->orderBy('discount','desc')->paginate(6);
        $products = Product::latest()->with('category')->latest()->paginate(6);
        return view('public.product.shop', ['products'=>$products,'products_onsale'=>$products_onsale]);
    }

    public function getIds($category): array
    {
        $ids = $category->categories()->pluck('id')->toArray();
        $ids[] = $category->id;
        return $ids;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {        
        $category = ProductCategory::whereSlug($slug)->firstOrFail();
        $products_onsale = Product::latest()->whereIn('category_id',$this->getIds($category))->with('category')->where('discount','<>',0)->orderBy('discount','desc')->get();
        $products = Product::whereIn('category_id', $this->getIds($category))->with('category')->latest()->paginate(16);
        return view('public.product.shop', ['products'=>$products,'products_onsale'=>$products_onsale]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
