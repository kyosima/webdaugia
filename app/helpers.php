<?php

use Illuminate\Support\Facades\Storage;
use App\Models\CampaignDetail;
if (!function_exists('getImage')) {
    function getImage($path)
    {
        return asset($path);
    }
}
if (!function_exists('getProductByCategory')) {
    function getProductByCategory($category)
    {
        $ids = $category->categories->pluck('id')->toArray();
        array_push($ids, $category->id);
        return \App\Models\Product::whereIn('product_category_id', $ids)->with('brand')->take(5)->latest()->get();
    }
}
if (!function_exists('getCurrency')) {
    function getCurrency($price)
    {
        return number_format($price, 0, '.', ',') . 'đ';
    }
}

if (!function_exists('countProductCampaign')) {
    function countProductCampaign($id)
    {
           
        return CampaignDetail::whereCampaignId($id)->count(); 
    }
}
if (!function_exists('sale')) {
    function sale($product)
    {
        if ($product->s_price > 0) {
            return '<label class="sale">-' . number_format(100 - (($product->s_price / $product->price) * 100), 0, '', '') . '%</label>';
        }
    }
}
