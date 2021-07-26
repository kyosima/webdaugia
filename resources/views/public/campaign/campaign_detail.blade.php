@extends('public.layout')
@section('content')
<script src="{{asset('public/mevivu/js/pusher.js')}}"></script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <div class="breadcrumb__option">
                        <a href="{{URL::to('/')}}">Trang chủ</a>
                        
                        <a href="{{URL::to('dau-gia/')}}">Đấu giá</a>
                        <a href="{{URL::to('dau-gia/'.$campaign->slug)}}">{{$campaign->title}}</a>
                        <span>{{$product->title}}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<div aria-live="polite" aria-atomic="true" style="position: fixed; min-height: 200px; width: 100%; height: 200px; z-index: 9">
    <div class="toast" style="position: absolute; top: 0; right: 0;" data-delay="10000"> 
      <div class="toast-header">
        <img src="..." class="rounded mr-2" alt="...">
        <strong class="mr-auto">Giá đã cập nhật</strong>
        <small id=""></small>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="toast-body">
        Hello, world! This is a toast message.
      </div>
    </div>
</div>
<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                            src="{{getImage($product->avatar)}}" alt="">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        @foreach (explode(',',$product->gallery) as $image)
                            <img data-imgbigurl="{{getImage($image)}}"
                            src="{{getImage($image)}}" alt="">
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3 class="product__detail__title">{{$product->title}}</h3>
                    @if($detail->status ==0)
                        <div class="detail-counter" style="display: block" id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$detail->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$detail->id)}}">
                            <div id="timer">
                                <div class="number-list">
                                <div class="item day">00</div>
                                <div class="item hour">00</div>
                                <div class="item minute">00</div>
                                <div class="item second">00</div>
                                </div>
                                <div class="unit-list">
                                <div class="item">Day</div>
                                <div class="item">Hour</div>
                                <div class="item">Minutes</div>
                                <div class="item">Seconds</div>
                                </div>
                            </div>
                        </div>
                        <script>
                            countStartDetail('{{$campaign->time_start}}',{{$order}}, {{count($details)}},{{$campaign->time_range}}, {{$detail->status}});
                        </script>
                    @elseif($detail->status ==1)
                        <div class="detail-counter" style="display: block" id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$detail->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$detail->id)}}">
                            <div id="timer">
                                <div class="number-list">
                                <div class="item day">00</div>
                                <div class="item hour">00</div>
                                <div class="item minute">00</div>
                                <div class="item second">00</div>
                                </div>
                                <div class="unit-list">
                                <div class="item">Day</div>
                                <div class="item">Hour</div>
                                <div class="item">Minutes</div>
                                <div class="item">Seconds</div>
                                </div>
                            </div>
                        </div>
                        <script>
                            countRunDetail('{{$campaign->time_start}}',{{$order}}, {{count($details)}},{{$campaign->time_range}}, {{$detail->status}});
                        </script>
                    @else
                        <div class="alert alert-warning text-center ">
                            <h5 class="text-dark">Sản phẩm đã kết thúc đấu giá</h5>
                        </div>         
                    @endif
                    <div class="current-price-area">
                        <div class="product__warraper">
                            <p class="product__details__price">
                                <span>Giá khởi điểm: <span class="n__price">{{getCurrency($detail->price_start)}}</span></span>
                            </p>
                            <p class="product__details__price">
                                <span>Giá hiện tại: <span class="n__price" id="current-price">{{getCurrency($detail->price_end)}}</span></span>
                            </p>
                        </div>
                    </div>
                    <div class="auction-area">
                        <h3 class="text-center">Đấu giá sản phẩm này</h3>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" id="auction_ip" pattern="[0-9]">
                                <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2">đ</span>
                                </div>
                            </div>
                        <form id="auction-form" class="form text-center" action="{{url('/dau-gia/gui-dau-gia')}}" method="POST">
                            <div class="input-group mb-3">
                                <input type="hidden" id="detail_id" value="{{$detail->id}}" name="detail_id">
                                <input type="hidden" id="auction_cf" name="amount">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-info" type="submit">Đấu giá</button>
                            </div>
                        </form>
                    </div>
                    <ul>
                        {{-- <li><b>Danh mục</b> <span>{{$product->category->title}}</span></li> --}}
                        <li><b>Chia sẻ</b>
                            <div class="share">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                aria-selected="true">Mô tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                aria-selected="false">Đánh giá <span>(1)</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả</h6>
                                <p>{!! $product->desc_long!!}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Đánh giá</h6>
                                <p>đánh giá</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
{{-- <section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Sản phẩm tương tự</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="product__related_carousel">
                    <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                @foreach(\App\Models\Product::where('category_id',$product->category_id)->take(8)->latest()->get() as $product)
                                    @include('public.product.includes.product_grid', ['item'=>$product])
                                @endforeach
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> --}}
<!-- Related Product Section End -->


  <script>
    $(document).ready(function(){
      $('.toast').toast('show');
    });
    </script>
@endsection