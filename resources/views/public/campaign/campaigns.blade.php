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
            @foreach($campaigns_run as $item)
                @include('public.campaign.include.campaign_grid', ['item'=>$item])
            @endforeach
            </div>
            <div class="col-lg-12 text-center">
                <a href="{{URL::to('/loai-dau-gia')}}" class="btn btn-info mt-5">Xem thêm</a>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->
<section class="product spad">
    <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm Chuẩn bị đấu giá</h2>
                    </div>
                </div>
                <div class="categories__slider owl-carousel">
                @foreach($campaigns_coming as $item)
                    @include('public.campaign.include.campaign_grid', ['item'=>$item])
                @endforeach
                </div>
                <div class="col-lg-12 text-center">
                    <a href="{{URL::to('/loai-dau-gia')}}" class="btn btn-info mt-5">Xem thêm</a>
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
                @foreach($campaigns_end as $item)
                    @include('public.campaign.include.campaign_grid', ['item'=>$item])

                @endforeach
            </div>
            <div class="col-lg-12 text-center">
                <a href="{{URL::to('/loai-dau-gia')}}" target="_blank" class="btn btn-info mt-5">Xem thêm</a>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Product Section Begin -->




@endsection