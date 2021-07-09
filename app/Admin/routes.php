<?php

use Illuminate\Routing\Router;

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

    $router->resource('posts', PostsController::class);

    $router->resource('categories', CategoryPostController::class);

    $router->resource('products', ProductController::class);

    $router->resource('product-categories', ProductCategoryController::class);
    
    $router->resource('campaigns', CampaignController::class);

    $router->put('/kiem-tra-duong-dan', 'PostsController@createSlug');

});
