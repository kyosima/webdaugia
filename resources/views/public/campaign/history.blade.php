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
            @include('public.product.includes.sidebar')
            <div class="col-lg-9 col-md-7">
                
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <b class="text-light">Các sản phẩm bạn đã đấu giá được</b>

                            {{-- <div class="filter__sort">
                                <span>Sắp xếp theo</span>
                                <select>
                                    <option value="0">Default</option>
                                    <option value="1">Giá giảm dần</option>
                                    <option value="2">Giá tăng dần</option>
                                    <option value="3">Mới nhất</option>
                                </select>
                            </div> --}}
                        </div>
                        <!-- <div class="col-lg-4 col-md-3 opacity-0">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div> -->
                        <div class="col-lg-6 col-md-6">
                            <div class="filter__found">
                                <h6><span>{{count($campaign_detail_win)}}</span> sản phẩm</h6>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="row">
                    @foreach($campaign_detail_win as $item)
                            @include('public.campaign.include.history_grid',['item'=>$item->product()->first(), 'detail'=>$item,'campaign'=>$item->campaign()->first()])
                    @endforeach
                </div>
                <div class="product__pagination text-center">
                    {{ $campaign_detail_win->links() }}
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->



@endsection