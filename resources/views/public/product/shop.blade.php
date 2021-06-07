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
            <div class="col-lg-3 col-md-5 d-none d-md-block">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Danh mục</h4>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                        </ul>
                    </div>
                    
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Latest Products</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <a href="{{URL::to('/chi-tiet-san-pham')}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{asset('storage/app/public/images/6.jpg')}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>30.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="{{URL::to('/chi-tiet-san-pham')}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{asset('storage/app/public/images/5.jpg')}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>30.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="{{URL::to('/chi-tiet-san-pham')}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{asset('storage/app/public/images/4.jpg')}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>30.000 đ</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <a href="{{URL::to('/chi-tiet-san-pham')}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{asset('storage/app/public/images/3.jpg')}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>30.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="{{URL::to('/chi-tiet-san-pham')}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{asset('storage/app/public/images/2.jpg')}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>30.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="{{URL::to('/chi-tiet-san-pham')}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{asset('storage/app/public/images/1.jpg')}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>30.000 đ</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Đang giảm giá</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                        @for($i = 1; $i < 7; $i++)
                        @php 
                            $price = rand(100000, 1000000);
                            $discount = rand(10, 50);
                        @endphp
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                        data-setbg="{{asset('storage/app/public/images/'.$i.'.jpg')}}">
                                        <div class="product__discount__percent">{{$discount}}%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Dried Fruit</span>
                                        <h5><a href="{{URL::to('/chi-tiet-san-pham')}}">Raisin’n’nuts</a></h5>
                                        <div class="product__item__price">{{number_format($price)}} đ<span>{{number_format($price  - round($price*$discount/100))}} đ</span></div>
                                    </div>
                                </div>
                            </div>
                        @endfor      
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="filter__sort">
                                <span>Sắp xếp theo</span>
                                <select>
                                    <option value="0">Default</option>
                                    <option value="1">Giá giảm dần</option>
                                    <option value="2">Giá tăng dần</option>
                                    <option value="3">Mới nhất</option>
                                </select>
                            </div>
                        </div>
                        <!-- <div class="col-lg-4 col-md-3 opacity-0">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div> -->
                        <div class="col-lg-6 col-md-6">
                            <div class="filter__found">
                                <h6><span>16</span> Products found</h6>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="row">
                @for($i = 1; $i < 7; $i++)
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="{{asset('storage/app/public/images/'.$i.'.jpg')}}">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="{{URL::to('/chi-tiet-san-pham')}}">Crab Pool Security</a></h6>
                                <h5>{{number_format(rand(100000, 10000000))}} đ</h5>
                            </div>
                        </div>
                    </div>
                @endfor
                </div>
                <div class="product__pagination">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->



@endsection