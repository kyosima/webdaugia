<?php

use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {
    $router->get('products/get/{id}/{campaign_id}', 'ProductController@getProduct');

    $router->get('campaigns/remove/{id}', 'CampaignController@removeCampaignDetail');

    $router->post('campaigns/postCampaign', 'CampaignController@postCampaign');

    $router->get('/', 'HomeController@index')->name('home');    

    $router->resource('users', UserController::class);

    $router->resource('users-member', UserMemberController::class);

    $router->resource('posts', PostsController::class);

    $router->resource('categories', CategoryPostController::class);

    $router->resource('products', ProductController::class);

    $router->resource('coupons', CouponController::class);

    $router->resource('orders', OrderController::class);

    $router->put('orders/orders-update/{id}', 'OrderController@updateOrder')->name('orders.updateOrder');

    $router->put('orders/update-qty-product/{id}', 'OrderController@updateQtyProduct')->name('orders.updateQtyProduct');

    $router->post('orders/add-new-product/{id}', 'OrderController@addProductToOrder')->name('orders.addProductToOrder');

    $router->delete('orders/delete-product/{id}', 'OrderController@deleteProduct')->name('orders.deleteProduct');
    
    $router->get('orders/createAuctionOrder/{id}', 'OrderController@createAuctionOrder')->name('orders.createAuctionOrder');

    $router->post('orders/addAutionOrder', 'OrderController@addAutionOrder')->name('orders.addAutionOrder');
    
    $router->resource('product-categories', ProductCategoryController::class);
    $router->resource('campaigns', CampaignController::class);
    $router->put('/kiem-tra-duong-dan', 'PostsController@createSlug');


});
