<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryProductController;
use App\Http\Controllers\ProductDetailController;
use App\Http\Controllers\CampaignController;

use App\Http\Controllers\CampaignTypeController;
use App\Http\Controllers\BlogController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'home']);
Route::get('/lien-he', [HomeController::class, 'contact']);

Route::get('/cua-hang', [CategoryProductController::class, 'index']);

Route::get('/chi-tiet-san-pham', [ProductDetailController::class, 'index']);

Route::get('/dau-gia', [CampaignController::class, 'index']);

Route::get('/loai-dau-gia', [CampaignTypeController::class, 'index']);

Route::get('/blog', [BlogController::class, 'index']);

Route::get('/chi-tiet-bai-viet', [BlogController::class, 'detail']);

//start login, register

Route::get('/dang-nhap', [UserLoginController::class, 'index']);

//end login, register

