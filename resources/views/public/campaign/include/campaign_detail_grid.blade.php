<section class="camapaign__product">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
            <div class="featured__item__pic__campaign__detail">
                <div class="featured__item__pic set-bg" data-setbg="{{getImage($product->avatar)}}">
                    <ul class="featured__item__pic__hover">
                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
            <h2 class="product__detail__title text-bold">SP{{$order+1}} - {{$product->title}}</h2>
            @if($item->status == 0)
            <h2>Thời gian đến khi mở đấu giá còn</h2>

                <div class="detail-counter" id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$item->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$item->id)}}">
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
                    countStartDetail('{{$campaign->time_start}}', '{{$order}}','{{$total}}', '{{$duration}}',{{$item->status}});
                </script>
            @elseif($item->status == 1)
            <h4>Thời gian đấu giá còn lại</h4>

                <div class="detail-counter" style="display: block" id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$item->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$item->id)}}">
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
                countRunDetail('{{$campaign->time_start}}', '{{$order}}','{{$total}}', '{{$duration}}','{{$item->status}}');
            </script>
            @else
                <div class="alert alert-warning text-center ">
                    <h5 class="text-dark">Sản phẩm đã kết thúc đấu giá</h5>
                </div>           
             @endif
            <div class="product__details__tab__desc">
                {!!$product->desc_short!!}
            </div>
            <div class="campaign_detai_price">
                <h4 class="price__start">Giá khởi điểm: {{getCurrency($item->detail_price_start)}}</h4>
            </div>
            <div class="text-right">
                @if($campaign->status != 2)
                <button class="btn btn-danger btn-add-detail-wishlist" id="add-detail-wishlist-{{$item->id}}" data-detailid="{{$item->id}}" data-url="{{url('dau-gia/yeu-thich')}}" data-status="0" onclick="addCampaintoWishlist(this)">
                    @if($item->wishlist()->first()==null)
                    <i class="material-icons">favorite_border</i>
                        @else
                    <i class="material-icons">favorite</i>
                        @endif
                </button>
                @endif
                <a class="btn btn-info" href="{{url('dau-gia/'.$campaign->slug.'/'.$product->slug)}}"  target="_blank">Xem chi tiết</a>
            </div>
        </div>
    </div>
</section>