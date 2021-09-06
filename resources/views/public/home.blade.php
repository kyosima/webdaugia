
@extends('public.layout')
@section('content')


<!-- banner Section start -->
<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 pr-md-1">
                <div class="fotorama" data-autoplay="true">
                    <img src="{{asset('public/mevivu/img/banner/banner-3.jpg')}}" alt="Los Angeles" width="100%">
                    <img src="{{asset('public/mevivu/img/banner/banner-3.jpg')}}" alt="Los Angeles" width="100%">
                    <img src="{{asset('public/mevivu/img/banner/banner-3.jpg')}}" alt="Los Angeles" width="100%">
                  </div>
               
            </div>
            <div class="col-lg-3 pl-md-1 banner-left d-none d-md-block">
                <div class="mb-2">
                    <div class="fotorama" data-autoplay="true"  data-arrows="false"   data-click="true" data-swipe="false"> 
                        <img src="{{asset('public/mevivu/img/banner/banner-4.jpg')}}" alt="Los Angeles" width="100%">
                        <img src="{{asset('public/mevivu/img/banner/banner-4.jpg')}}" alt="Los Angeles" width="100%">
                        <img src="{{asset('public/mevivu/img/banner/banner-4.jpg')}}" alt="Los Angeles" width="100%">
                      </div>
                </div>
                <div>
                    <div class="fotorama" data-autoplay="true"  data-arrows="false"   data-click="true" data-swipe="false">
                        <img src="{{asset('public/mevivu/img/banner/banner-5.jpg')}}" alt="Los Angeles" width="100%">
                        <img src="{{asset('public/mevivu/img/banner/banner-5.jpg')}}" alt="Los Angeles" width="100%">
                        <img src="{{asset('public/mevivu/img/banner/banner-5.jpg')}}" alt="Los Angeles" width="100%">
                      </div>
                </div>
            </div>
        </div>
    </div>
</section>    
<!-- banner Section end -->
<!-- Categories Section Begin -->
<section class="categories featured spad">
    <div class="container">
        <div class="row">
            <div class="col-12 section-title">
                <h2>Sản phẩm nổi bật</h2>
            </div>
            <div class="categories__slider owl-carousel">
                <?php $products = App\Models\Product::whereIsHighlight(1)->latest()->get();?>
                @foreach($products as $item)
                        @include('public.product.includes.home_product_grid',['item'=>$item])
                @endforeach
    
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
{{-- <section class="featured spad">
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
        </div>
    </div>
</section> --}}
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic pb-3">
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
                    <h4>Sản phẩm mới</h4>
                        <?php $products = App\Models\Product::latest()->paginate(10);?>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    @for($i=0; $i< count($products)/2; $i++)
                                    <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>{{$products[$i]->title}}</h6>
                                            <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                        </div>
                                    </a>
                                    @endfor
                                
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    @for($i=count($products)/2; $i< count($products); $i++)
                                        <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>{{$products[$i]->title}}</h6>
                                                <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                            </div>
                                        </a>
                                    @endfor
                                </div>
                            </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Sản phẩm gợi ý</h4>
                    <?php $products = App\Models\Product::latest()->paginate(10);?>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            @for($i=0; $i< count($products)/2; $i++)
                            <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>{{$products[$i]->title}}</h6>
                                    <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                </div>
                            </a>
                            @endfor
                        
                        </div>
                        <div class="latest-prdouct__slider__item">
                            @for($i=count($products)/2; $i< count($products); $i++)
                                <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{$products[$i]->title}}</h6>
                                        <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                    </div>
                                </a>
                            @endfor
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Sản phẩm tốt</h4>
                    <?php $products = App\Models\Product::latest()->paginate(10);?>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            @for($i=0; $i< count($products)/2; $i++)
                            <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>{{$products[$i]->title}}</h6>
                                    <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                </div>
                            </a>
                            @endfor
                        
                        </div>
                        <div class="latest-prdouct__slider__item">
                            @for($i=count($products)/2; $i< count($products); $i++)
                                <a href="{{route('san-pham.show',['san_pham'=>$products[$i]->slug])}}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="{{getImage($products[$i]->avatar)}}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{$products[$i]->title}}</h6>
                                        <span>@include('public.product.includes.price',['item'=>$products[$i]])</span>
                                    </div>
                                </a>
                            @endfor
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
{{-- <section class="from-blog spad">
    <div class="container">
        <div class="row">
            
            <div class="col-lg-9 col-md-9 col-sm-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title from-blog__title">
                            <h2>Kiến thức</h2>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 pr-md-1">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="{{asset($kienthuc1->avatar)}}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> {{date("d/m/Y",strtotime($kienthuc1->created_at))}}</li>
                                    <!-- <li><i class="fa fa-comment-o"></i> 5</li> -->
                                </ul>
                                <h5><a href="{{URL::to('/bai-viet/'.$kienthuc1->slug)}}">{{$kienthuc1->title}}</a></h5>
                                <p>{{Str::of($kienthuc1->desc_short)->limit(200, '...')}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 pl-md-1 pr-md-1 d-none d-md-block">
                        @foreach($kienthuc2 as $value)
                        <a href="{{URL::to('/bai-viet/'.$value->slug)}}" class="d-flex mb-2 align-items-center">
                            <div class="mr-1 blog-img-small"><img src="{{asset($value->avatar)}}" alt="" width="100%"></div>
                            <div class="flex-grow-1 text-13">
                                <span class="title_Blog_small">{{$value->title}}</span>
                            </div>
                        </a>
                        @endforeach
                    </div>
                </div>
                
            </div>
            <div class="col-lg-3 col-md-3 col-sm-12 pl-md-1">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title from-blog__title">
                            <h2>Tin tức đấu giá</h2>
                        </div>
                    </div>
                    @foreach($tindaugia as $value)
                    <div class="col-12 blog_right">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="{{asset($value->avatar)}}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> {{date("d/m/Y",strtotime($value->created_at))}}</li>
                                    <!-- <li><i class="fa fa-comment-o"></i> 5</li> -->
                                </ul>
                                <h5><a href="{{URL::to('/bai-viet/'.$value->slug)}}">{{$value->title}}</a></h5>
                            </div>
                        </div>
                    </div>
                    @endforeach 
                </div>
                
            </div>
            
        </div>
    </div>
</section> --}}
<!-- Blog Section End -->



@endsection