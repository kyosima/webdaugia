<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryProductController;
use App\Http\Controllers\ProductDetailController;
use App\Http\Controllers\CampaignController;

use App\Http\Controllers\CampaignTypeController;
use App\Http\Controllers\BlogController;

use App\Http\Controllers\UserLoginController;

use App\Http\Controllers\UserRegisterController;
use App\Http\Controllers\UserGetPassword;
use App\Http\Controllers\UserProfileController;
use App\Http\Controllers\AgentController;
use App\Http\Controllers\SinglePageController;




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

Route::get('/danh-muc-bai-viet/{categoryPost:slug}', [BlogController::class, 'category']);

Route::get('/bai-viet/{post:slug}', [BlogController::class, 'detail']);

Route::get('/blog/tim-kiem', [BlogController::class, 'search']);



//start login, register

Route::get('/dang-nhap', [UserLoginController::class, 'index']);

Route::post('/dang-nhap', [UserLoginController::class, 'postLogin'])->name('post.login');

Route::group(['prefix' => '/', 'middleware' => 'auth'], function(){

    Route::get('thoat-tai-khoan', [UserLoginController::class, 'getLogout']);
    //profile user

    Route::get('/trang-ca-nhan', [UserProfileController::class, 'index']);

    Route::put('/thay-doi-thong-tin-ca-nhan', [UserProfileController::class, 'putChangeProfile'])->name('put.changeprofile');

    Route::get('/doi-mat-khau', [UserProfileController::class, 'getChangePassword']);

    Route::put('/doi-mat-khau', [UserProfileController::class, 'putChangePassword'])->name('put.changepassword');
    //profile user
});

//danh sách đại lý

Route::get('/danh-sach-dai-ly', [AgentController::class, 'index']);


Route::get('/dang-ky', [UserRegisterController::class, 'index']);

Route::post('/dang-ky', [UserRegisterController::class, 'postRegister'])->name('post.register');

//các trang đơn

Route::get('/nha-lai-tao', [SinglePageController::class, 'breeders']);

Route::get('/chinh-sach-dai-ly', [SinglePageController::class, 'policyAgent']);

Route::get('/huong-dan-dau-gia', [SinglePageController::class, 'auctionGuide']);

Route::get('/gioi-thieu', [SinglePageController::class, 'introduce']);

//end login, register

//get password
Route::get('gui-yeu-cau-lay-mat-khau', [UserGetPassword::class, 'getPassword'])->name('getpassword');

Route::post('gui-yeu-cau-lay-mat-khau', [UserGetPassword::class, 'postSendRequireGetPassword'])->name('post.sendRequireGetPassword');

Route::get('xac-nhan-lay-lai-mat-khau', [UserGetPassword::class, 'getAcceptPassword'])->name('getAcceptPassword');

Route::put('xac-nhan-lay-lai-mat-khau', [UserGetPassword::class, 'postAcceptGetPassword'])->name('put.getAcceptPassword');

//get password



