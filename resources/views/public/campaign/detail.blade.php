@extends('public.layout')
@section('content')

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <div class="breadcrumb__option">
                        <a href="{{URL::to('/')}}">Trang chủ</a>
                        
                        {{-- <a href="{{URL::to('danh-muc/'.$product->category->slug)}}">{{$product->category->title}}</a> --}}
                        <span>Cá cảnh đẹp rực rỡ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="">
                        <img class="--large"
                            src="{{getImage($campaign->avatar)}}" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3 class="product__detail__title">{{$campaign->title}}</h3>
                    <div class="campaign-time-start">
                        <div id="clock-c" class=" text-white">Thời gian bắt đầu: {{date('d/m/Y H:i:s',strtotime($campaign->time_start))}}</div>
                    </div>
                    <div class="product__details__tab__desc">
                        {!!$campaign->description!!}
                    </div>
                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
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
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-12">
                <div id="campaign-counter-title" class="section-title">
                    <h2>Thời gian mở đấu giá</h2>
                </div>
                <div class="campaign__count_time_run">
                    <div id="campaign-counter" data-url="{{url('dau-gia/bat-dau/'.$campaign->id)}}">
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
                </div>
            </div>
        </div>
        @if($campaign->status == 0)
            <script>
                countStart('{{$campaign->time_start}}','{{$campaign->campaign_details()->get()}}', {{$campaign->time_range}});
            </script>
        @elseif($campaign->status == 1)
            <script>
                countRun('{{$campaign->time_start}}','{{$campaign->campaign_details()->get()}}');
            </script>
        @endif
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm đấu giá</h2>
                </div>
                @for($i=0; $i< count($details = $campaign->campaign_details()->get());$i++)
                    @include('public.campaign.include.campaign_detail_grid', ['duration'=>$campaign->time_range,'order'=>$i, 'total'=>count($details) ,'item'=>$details[$i], 'product'=>$details[$i]->product()->first()])
                @endfor
            </div>
        </div>
    </div>
</section>
<script>

    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;

    var pusher = new Pusher('68ef3c83b7b5c521c84a', {
      cluster: 'ap1'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
      alert('Đã bắt đầu đấu giá');
    });
  </script>


@endsection