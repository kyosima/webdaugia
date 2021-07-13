<section class="camapaign__product">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
            <div class="product__details__pic">
                <div class="product__details__pic__item">
                    <img class="product__details__pic__item--larges"
                        src="{{getImage($product->avatar)}}" alt="">
                </div>
                {{-- <div class="product__details__pic__slider owl-carousel">
                    @foreach (explode(',',$product->gallery) as $image)
                        <img data-imgbigurl="{{getImage($image)}}"
                        src="{{getImage($image)}}" alt="">
                    @endforeach
                </div> --}}
            </div>
        </div>
        <div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
            <h3 class="product__detail__title">{{$product->title}}</h3>
            <div id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$item->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$item->id)}}">
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
            @if($item->status == 0)

                <h3>Đang chuẩn bị</h3>
            @elseif($item->status == 1)
            
            <script> 
                countRunDetail('{{$campaign->time_start}}', '{{$order}}',1, {{$total}}, {{$duration}},{{$item->status}});
            </script>
            @else
                <h3>Sản phẩm đã kết thúc</h3>
            @endif
            <div class="product__details__tab__desc">
                {!!$product->desc_short!!}
            </div>
            <div class="campaign_detai_price">
                <h4 class="price__start">Giá khởi điểm: {{getCurrency($item->detail_price_start)}}</h4>
            </div>
            <div class="text-right">
                <button class="btn btn-info">Xem chi tiết</button>
            </div>
        </div>
    </div>
</section>