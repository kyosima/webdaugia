<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryProductController;
use App\Http\Controllers\ProductDetailController;
use App\Http\Controllers\CampaignController;

use App\Http\Controllers\CampaignTypeController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\ProductCategoryController;


use App\Http\Controllers\UserLoginController;

use App\Http\Controllers\UserRegisterController;
use App\Http\Controllers\UserGetPassword;


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

    // Route::get('/cua-hang', [CategoryProductController::class, 'index']);

Route::get('/chi-tiet-san-pham', [ProductDetailController::class, 'index']);

Route::get('/dau-gia', [CampaignController::class, 'index']);

Route::get('/loai-dau-gia', [CampaignTypeController::class, 'index']);

Route::get('/blog', [BlogController::class, 'index']);

Route::get('/danh-muc-bai-viet/{categoryPost:slug}', [BlogController::class, 'category']);

Route::get('/bai-viet/{post:slug}', [BlogController::class, 'detail']);

//start login, register


Route::post('/dang-nhap', [UserLoginController::class, 'postLogin'])->name('post.login');

Route::group(['prefix' => '/', 'middleware' => 'auth'], function(){

    Route::get('thoat-tai-khoan', [UserLoginController::class, 'getLogout']);

});



Route::get('/dang-ky', [UserRegisterController::class, 'index']);

Route::post('/dang-ky', [UserRegisterController::class, 'postRegister'])->name('post.register');

//end login, register
//get password
Route::get('gui-yeu-cau-lay-mat-khau', [UserGetPassword::class, 'getPassword'])->name('getpassword');

Route::post('gui-yeu-cau-lay-mat-khau', [UserGetPassword::class, 'postSendRequireGetPassword'])->name('post.sendRequireGetPassword');

Route::get('xac-nhan-lay-lai-mat-khau', [UserGetPassword::class, 'getAcceptPassword'])->name('getAcceptPassword');

Route::put('xac-nhan-lay-lai-mat-khau', [UserGetPassword::class, 'postAcceptGetPassword'])->name('put.getAcceptPassword');

Route::resources([
    'san-pham' => 'ProductController',
    'cua-hang' => 'ProductCategoryController',
]);
Route::fallback(function() {
    return view('404');
});
//get password
