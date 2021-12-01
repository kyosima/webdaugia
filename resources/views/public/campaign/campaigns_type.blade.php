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
                    <h2>{{$title}}</h2>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach($campaigns as $item)
                @include('public.campaign.include.campaign_grid_type', ['item'=>$item])
            @endforeach
        </div>
    </div>
    </div>
</section>

<!-- Product Section End -->

<!-- Product Section Begin -->




@endsection