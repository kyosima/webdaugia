@extends('public.layout')
@section('content')


<!-- banner Section start -->
<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 pr-md-1">
                <div id="demo" class="carousel slide" data-ride="carousel">
                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="{{asset('public/mevivu/img/banner/banner-3.jpg')}}" alt="Los Angeles" width="100%">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>
            </div>
            <div class="col-lg-3 pl-md-1 banner-left d-none d-md-block">
                <div class="mb-2">
                    <img src="{{asset('public/mevivu/img/banner/banner-4.jpg')}}" alt="Los Angeles" width="100%">
                </div>
                <div>
                    <img src="{{asset('public/mevivu/img/banner/banner-5.jpg')}}" alt="Los Angeles" width="100%">
                </div>
            </div>
        </div>
    </div>
    
</section>
<!-- banner Section end -->
<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="col-12 section-title">
                <h2>Sản phẩm nổi bật</h2>
            </div>
            <div class="categories__slider owl-carousel">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-1.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-2.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-3.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-4.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-5.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-6.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-7.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-8.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <div class="star-rating" title="Rated 5.00 out of 5">
                                <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm đang đấu giá</h2>
                </div>
            </div>
            <div class="categories__slider owl-carousel">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-1.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: 30.000 đ</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                                                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-2.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-3.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-4.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-5.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-6.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-7.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('public/mevivu/img/featured/feature-8.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá hiện tại: $30.00</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-hourglass-half"></i> Đấu giá</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="{{asset('public/mevivu/img/banner/banner-1.jpg')}}" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="{{asset('public/mevivu/img/banner/banner-2.jpg')}}" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Latest Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-1.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                    <div class="star-rating" title="Rated 5.00 out of 5">
                                        <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                                    </div>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-2.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-3.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                        <!-- <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-1.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-2.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-3.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div> -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Top Rated Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-1.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                    <div class="star-rating" title="Rated 5.00 out of 5">
                                        <span style="width:75%"><strong class="rating">5.00</strong> out of 5</span>
                                    </div>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-2.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-3.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-1.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-2.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-3.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Review Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-1.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-2.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-3.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-1.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-2.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{asset('public/mevivu/img/latest-product/lp-3.jpg')}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Crab Pool Security</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
    <div class="container">
        <div class="row">
            
            <div class="col-lg-9 col-md-9 col-sm-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title from-blog__title">
                            <h2>Tư vấn mua</h2>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 pr-md-1">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="#">Cooking tips make cooking simple</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 pl-md-1 pr-md-1 d-none d-md-block">
                        <a href="#" class="d-flex mb-2 align-items-center">
                            <div class="w-80 h-61 mr-1"><img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat</div>
                        </a>
                        <a href="#" class="d-flex mb-2 align-items-center">
                            <div class="w-80 h-61 mr-1"><img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat</div>
                        </a>
                        <a href="#" class="d-flex mb-2 align-items-center">
                            <div class="w-80 h-61 mr-1"><img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat</div>
                        </a>
                        <a href="#" class="d-flex mb-2 align-items-center">
                            <div class="w-80 h-61 mr-1"><img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat</div>
                        </a>
                        <a href="#" class="d-flex mb-2 align-items-center">
                            <div class="w-80 h-61 mr-1"><img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat</div>
                        </a>
                        <a href="#" class="d-flex mb-2 align-items-center">
                            <div class="w-80 h-61 mr-1"><img src="{{asset('public/mevivu/img/blog/blog-1.jpg')}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat</div>
                        </a>

                    </div>
                </div>
                
            </div>
            <div class="col-lg-3 col-md-3 col-sm-12 pl-md-1">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title from-blog__title">
                            <h2>Tin đấu giá</h2>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="{{asset('public/mevivu/img/blog/blog-2.jpg')}}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="{{asset('public/mevivu/img/blog/blog-3.jpg')}}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="#">Visit the clean farm in the US</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>  
                </div>
                
            </div>
            
        </div>
    </div>
</section>
<!-- Blog Section End -->



@endsection