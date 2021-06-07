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

<!-- Product Section Begin -->
<section class="product spad">
<div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm đang đấu giá</h2>
                </div>
            </div>
            <div class="categories__slider owl-carousel">
            @for($i = 1; $i < 7; $i++)
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('storage/app/public/images/'.$i.'.jpg')}}">
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
            @endfor
            </div>
            <div class="col-lg-12 text-center">
                <a href="{{URL::to('/loai-dau-gia')}}" class="btn btn-info">Xem thêm</a>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->


<!-- Product Section Begin -->
<section class="product spad">
<div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm đấu giá gần đây</h2>
                </div>
            </div>
            <div class="categories__slider owl-carousel">
            @for($i = 1; $i < 7; $i++)
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('storage/app/public/images/'.$i.'.jpg')}}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <a href="#">Betta</a>
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>Giá chốt: 30.000 đ</h5>
                            <div class="d-flex justify-content-between mt-2">
                                <span><i class="fa fa-trophy"></i> Mevivu</span>
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> <span> Kết thúc</span>
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto"><i class="fa fa-phone"></i> Liên hệ</button>
                            </div>
                        </div>
                    </div>
                </div>
            @endfor
            </div>
            <div class="col-lg-12 text-center">
                <a href="{{URL::to('/loai-dau-gia')}}" class="btn btn-info">Xem thêm</a>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Product Section Begin -->
<section class="product spad">
<div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm Chuẩn bị đấu giá</h2>
                </div>
            </div>
            <div class="categories__slider owl-carousel">
            @for($i = 1; $i < 7; $i++)
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{asset('storage/app/public/images/'.$i.'.jpg')}}">
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
                            <div class="d-flex mt-2">
                                <span class="d-flex align-items-center">
                                    <i class="fa fa-clock-o"></i> 
                                    <div id="clock-c" class="countdown">14:23:58:31</div>
                                    
                                </span>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-danger mx-auto">Thông tin</button>
                            </div>
                        </div>
                    </div>
                </div>
            @endfor
            </div>
            <div class="col-lg-12 text-center">
                <a href="{{URL::to('/loai-dau-gia')}}" class="btn btn-info">Xem thêm</a>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->



@endsection