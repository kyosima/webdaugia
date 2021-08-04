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
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h3>Có {{$count_product}} kết quả tìm kiếm cho "{{$keyword}}"</h3>
                    </div>
                    <div class="row">
                        @foreach($product_showonload as $item)
                                @include('public.product.includes.product_grid',['item'=>$item])
                        @endforeach
                    </div>
                </div>
                <div class="product__pagination text-center">
                    {{ $product_showonload->links() }}
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->



@endsection