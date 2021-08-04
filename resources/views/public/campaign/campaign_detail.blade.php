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
    <div id="toast-detail-{{$detail->id}}" class="toast hide fade text-dark" style="position: fixed; top: 250px; right: 0; z-index:9  " data-delay="10000"> 
      <div class="toast-header">
        <strong class="mr-auto">Thông báo</strong>
        <small id=""></small>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="toast-body">
        @if($detail->status==1)
            <p class="text-dark">Giá đã thay đổi thành: <b class="text-danger" id="price-update">{{getCurrency($detail->price_end)}}</b></p>
        @elseif($detail->status == 0)
            <p class="text-dark">Sản phẩm chưa tới thời gian đấu giá</p>
        @else
            <p class="text-dark">Sản phẩm đã kết thúc đấu giá</p>
        @endif
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
                    <h3 class="product__detail__title">SP{{$order+1}}-{{$product->title}}</h3>
                    
                    @if($detail->status ==0)
                    <h4>Thời gian đấu giá còn lại</h4>

                        <div class="text-left my-1">
                            <button class="btn btn-danger btn-add-detail-wishlist" id="add-detail-wishlist-{{$detail->id}}" data-detailid="{{$detail->id}}" data-url="{{url('dau-gia/yeu-thich')}}" data-status="0" onclick="addCampaintoWishlist(this)">
                                @if($detail->wishlist()->first()==null)
                                <i class="material-icons">favorite_border</i>
                                    @else
                                <i class="material-icons">favorite</i>
                                    @endif
                            </button>
                        </div>
                        
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
                        <div class="text-left my-1">
                            <button class="btn btn-danger btn-add-detail-wishlist" id="add-detail-wishlist-{{$detail->id}}" data-detailid="{{$detail->id}}" data-url="{{url('dau-gia/yeu-thich')}}" data-status="0" onclick="addCampaintoWishlist(this)">
                                @if($detail->wishlist()->first()==null)
                                <i class="material-icons">favorite_border</i>
                                    @else
                                <i class="material-icons">favorite</i>
                                    @endif
                            </button>
                        </div>
                        <h4>Thời gian đấu giá còn lại</h4>
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
                   
                    @endif
                    @if($detail->status==2)
                        <div class="alert alert-info">
                            <h5 class="text-center text-dark">Người chiến thắng</h5>
                            <h3 class="text-center text-danger">
                                @if($detail->user_id == null)
                                    Chưa có
                                @else
                                    {{ App\Models\UserInfo::whereId($detail->user_id)->value('fullname')}}
                                @endif
                            </h3>
                        </div>
                    @endif
                    <div id="price-detail-{{$detail->id}}" class="current-price-area">
                        <div class="product__warraper">
                            <p class="product__details__price">
                                <span class="text-light">Giá khởi điểm: <span class="n__price text-danger">{{getCurrency($detail->detail_price_start)}}</span></span>
                            </p>
                            <p class="product__details__price">
                                <span class="text-light">Giá bước nhảy: <span class="n__price text-danger">{{getCurrency($detail->detail_price_step)}}</span></span>
                            </p>
                            <p class="product__details__price">
                                @if($detail->status!=2)
                                    <span class="text-light">Giá hiện tại:
                                @else
                                    <span class="text-light">Giá cuối cùng:
                                @endif
                                     <span class="n__price text-danger" id="current-price">{{getCurrency($detail->price_end)}}</span>
                                </span>
                            </p>
                        </div>
                    </div>
                    
                        <div class="auction-area" @if($detail->status !=1) style="display:none"@endif>
                            <h3 class="text-center">Đấu giá sản phẩm này</h3>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="auction_ip" pattern="[0-9]">
                                    <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">đ</span>
                                    </div>
                                </div>
                                <div class="notice-auction" style="display: none">
                                    <div class="alert alert-danger text-center">
                                        
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
                            <a class="nav-link active" data-toggle="tab" href="#tabs-0" role="tab"
                                aria-selected="true">Video</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " data-toggle="tab" href="#tabs-1" role="tab"
                                aria-selected="true">Mô tả</a>
                        </li>
                    
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-0" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Video</h6>
                                <iframe width="100%" height="600"src="{{$detail->video}}">
                                    </iframe>
                            </div>
                        </div>
                        <div class="tab-pane " id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả</h6>
                                <p>{!! $product->desc_long!!}</p>
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
    $( document ).ready(function() {
    document.getElementById("auction_ip").onkeyup =function (){    
        this.value = parseFloat(this.value.replace(/,/g, ""))
                        .toString()
                        .replace(/\B(?=(\d{3})+(?!\d))/g, ",");        
        document.getElementById("auction_cf").value = this.value.replace(/,/g, "")
        
    }
        var amount = document.querySelector('#auction_ip');
        amount.addEventListener('input', restrictNumber);
        function restrictNumber (e) {  
        var newValue = this.value.replace(new RegExp(/[^\d]/,'ig'), "");
        this.value = newValue;
    }

    $("#auction-form").submit(function(e) {
        e.preventDefault();
        var form = $(this);
        var url = form.attr('action');
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            data: form.serialize(),
            error: function(data){
                console.log(data);
            },
            success: function(response)
            {
                if (response == false) {
                    // data.redirect contains the string URL to redirect to
                    window.location.href = "{{url('/dang-nhap')}}";
                } else {
                    $('.notice-auction').css('display', 'block');
                    $('.notice-auction .alert').text(response); 
                }
             
            }
        });
    });
});


    </script>
@endsection