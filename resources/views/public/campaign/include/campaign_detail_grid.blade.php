<section class="camapaign__product" id="detail-order-{{$order}}">
    <div class="row">
        <div class="col-4">
            <div class="featured__item__pic__campaign__detail">
                <div class="featured__item__pic set-bg" data-setbg="{{getImage($product->avatar)}}">
                    <ul class="featured__item__pic__hover">
                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-8">
            <h4 class="product__detail__title text-bold">SP{{$order+1}} - {{$product->title}}</h4>
            <ul class="text-light">
                <li><b>Giá khởi điểm: </b><span id="" class="text-danger">{{getCurrency($item->detail_price_start)}}</span></li>
                <li><b>Trạng thái: </b><span id="status" class="text-danger">
                    @if($item->status == 0)
                        Đang chờ
                    @elseif($item->status == 1)
                        Đang chạy
                    @else
                        Kết thúc
                    @endif
                </span></li>
             
                @if($item->status == 0)
                    <li><b>Bộ đếm: </b><span id="" class="text-danger"> 
                        <div class="detail-counter" id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$item->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$item->id)}}">
                            <div id="timer-detail">
                                <div class="number-list-detail">
                                <div class="item day">00</div>ngày : 
                                <div class="item hour">00</div>giờ : 
                                <div class="item minute">00</div>phút : 
                                <div class="item second">00</div>giây
                                </div>
                        
                            </div>
                        </div>
                        <script> 
                            countStartDetail('{{$campaign->time_start}}', '{{$order}}','{{$total}}', '{{$duration}}',{{$item->status}});
                        </script>
                        </span>
                    </li>
                @elseif($item->status == 1)
                    <li id="list-counter"><b>Bộ đếm: </b><span id="" class="text-danger"> 
                        <div class="detail-counter"  id="detail-counter-{{$order}}" data-url="{{url('dau-gia/bat-dau/detail/'.$item->id)}}"  data-urlcancel="{{url('dau-gia/ket-thuc/detail/'.$item->id)}}">
                            <div id="timer-detail">
                                <div class="number-list-detail">
                                <div class="item day">00</div>ngày : 
                                <div class="item hour">00</div>giờ : 
                                <div class="item minute">00</div>phút : 
                                <div class="item second">00</div>giây
                                </div>
                        
                            </div>
                        </div>
                        <script> 
                            countRunDetail('{{$campaign->time_start}}', '{{$order}}','{{$total}}', '{{$duration}}','{{$item->status}}');
                        </script>
                        </span>
                    </li>                             
                @endif
                 
                <li><b>Mô tả: </b><span id="detail-shot-desc" class="text-danger">{!!$product->desc_short!!}</span></li>

            </ul>
         
            <div class="row">
                <div class="col-6">
                    @if($campaign->status != 2)
                    <a class="text-danger btn-add-detail-wishlist" id="add-detail-wishlist-{{$item->id}}" data-detailid="{{$item->id}}" data-url="{{url('dau-gia/yeu-thich')}}" data-status="0" onclick="addCampaintoWishlist(this)">
                        @if($item->wishlist()->first()==null)
                            <i class="material-icons">favorite_border</i>
                                @else
                            <i class="material-icons">favorite</i>
                        @endif
                        <span>Yêu thích</span>
                    </a>
                    @endif
                </div>
                <div class="col-6 text-right">
                    <a class="text-info" href="{{url('dau-gia/'.$campaign->slug.'/'.$product->slug)}}"  target="_blank">Xem chi tiết</a>
                </div>
            </div>
        
        </div>
    </div>
</section>