<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryProductController;
use App\Http\Controllers\ProductDetailController;
use App\Http\Controllers\CampaignController;
use App\Http\Controllers\PusherController;

use App\Http\Controllers\CampaignTypeController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\ProductCategoryController;
use App\Http\Controllers\SearchProductController;
use App\Http\Controllers\UserLoginController;

use App\Http\Controllers\UserRegisterController;
use App\Http\Controllers\UserGetPassword;
use App\Http\Controllers\WishListController;
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

Route::get('/', [HomeController::class, 'home'])->name('trangchu');
Route::get('/lien-he', [HomeController::class, 'contact']);

    // Route::get('/cua-hang', [CategoryProductController::class, 'index']);

Route::get('/chi-tiet-san-pham', [ProductDetailController::class, 'index']);

Route::get('/blog', [BlogController::class, 'index']);

Route::get('/danh-muc-bai-viet/{categoryPost:slug}', [BlogController::class, 'category']);

Route::get('/bai-viet/{post:slug}', [BlogController::class, 'detail']);

Route::get('/blog/tim-kiem', [BlogController::class, 'search']);



//start login, register
Route::get('socket', 'SocketController@index');
Route::post('sendmessage', 'SocketController@sendMessage');
Route::get('writemessage', 'SocketController@writemessage');

Route::get('/dang-nhap', [UserLoginController::class, 'index'])->name('get.login');

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

Route::resources([
    'san-pham' => 'ProductController',
    'cua-hang' => 'ProductCategoryController',
]);



// QUOC MINH DEP TRAI
// Cart
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');

Route::post('/add-cart', [CartController::class, 'addToCart'])->name('cart.addCart');

Route::post('/fast-add-cart', [CartController::class, 'fastAddToCart'])->name('cart.fastAddToCart');

Route::put('/update-cart', [CartController::class, 'updateCart'])->name('cart.updateCart');

Route::delete('/delete-cart', [CartController::class, 'removeFromCart'])->name('cart.removeFromCart');

// coupon
Route::post('/use-coupon', [CouponController::class, 'useCoupon'])->name('coupon.useCoupon');

Route::delete('/unuse-coupon', [CouponController::class, 'unUseCoupon'])->name('coupon.unUseCoupon');

// checkout

Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');

Route::post('/checkout', [CheckoutController::class, 'checkout'])->name('checkout.checkout');

Route::get('/getLocation', [CheckoutController::class, 'getLocation'])->name('checkout.getLocation');

// ORDER SUCCESS

Route::get('/order-success', [CheckoutController::class, 'orderSuccess'])->name('checkout.orderSuccess');

// wishlist

Route::get('/wish-list', [WishListController::class, 'index'])->name('wishlist.index');

Route::post('/wish-list', [WishListController::class, 'addToWishList'])->name('wishlist.addToWishList');

Route::delete('/wishlist-remove', [WishListController::class, 'removeFromWishList'])->name('wishlist.removeFromWishList');

Route::post('/change-to-cart', [WishListController::class, 'changeWishToCart'])->name('wishlist.changeWishToCart');

// SEARCH PRODUCT
Route::get('/search', [SearchProductController::class, 'searchProduct'])->name('search.searchProduct');


Route::group(['prefix' => 'dau-gia', 'middleware' => 'auth'], function(){
    Route::get('/san-pham-dau-gia-yeu-thich', [CampaignController::class, 'getWishlist'])->name('campaign.getWishlist');

    Route::get('/lich-su-dau-gia', [CampaignController::class, 'getHistory'])->name('campaign.getHistory');
});

Route::group(['prefix' => 'dau-gia'], function(){
    Route::get('/lay-mo-ta/{id}', [CampaignController::class,'getDescription']);
    Route::get('/lay-hinh-anh/{id}', [CampaignController::class,'getImageDetail']);
    Route::get('/lay-video/{id}', [CampaignController::class,'getVideoDetail']);
    Route::post('/gui-dau-gia', [CampaignController::class, 'postAuction'])->name('campaign.postAuction');
    Route::post('/tu-dong-dau-gia', [CampaignController::class, 'postAutoAuction'])->name('campaign.postAutoAuction');
    Route::post('/cap-nhat-dau-gia/{id}', [CampaignController::class, 'getAuction'])->name('campaign.getAuction');
    Route::get('/yeu-thich/{id}', [CampaignController::class, 'addWishList'])->name('campaign.addWishList');
    Route::get('/bat-dau/{id}', [CampaignController::class,'startCampaign'])->name('campaign.start');
    Route::get('/bat-dau/detail/{id}', [CampaignController::class,'startDetail'])->name('campaign.startdetail');
    Route::get('/ket-thuc/detail/{id}', [CampaignController::class,'stopDetail'])->name('campaign.stopdetail');
    Route::get('/{slug1}/{slug2}', [CampaignController::class, 'getCampaignProductDetail'])->name('campaign.campaignproduct');

});



Route::group(['prefix' => 'pusher'], function(){

    Route::get('start-campaign/{id}', [PusherController::class, 'startCampaign']);
    


});
Route::resources([
    'dau-gia' => 'CampaignController',
]);
//get password



