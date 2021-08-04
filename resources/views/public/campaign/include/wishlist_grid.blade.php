<div class="col-lg-12 col-md-12 col-sm-12" >
    <div class="product__discount__item" data-id="{{$item->id}}">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4" >
                <div class="product__discount__item__pic set-bg"
                    data-setbg="{{getImage($item->avatar)}}">
                    {{-- <div class="product__discount__percent">{{$item->discount}}%</div>
                    <ul class="product__item__pic__hover">
                        <li class="wishlist-add"><button href="#"><i class="fa fa-heart"></i></button></li>
                        <li class=""><button href="#"><i class="fa fa-retweet"></i></button></li>
                        <li class="quick-add"><button data-href="{{route('cart.fastAddToCart')}}"><i class="fa fa-shopping-cart"></i></button></li>
                    </ul> --}}
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-8" >
                <div class="product__discount__item__text text-left">
                    {{-- <span class="product__brand_name"><a href="{{route('danh-muc.show',['danh_muc'=>$item->category->slug])}}">{{$item->category->title}}</a></span> --}}
                    <h4>Tên chiến dịch: {{$campaign->title}}</h4>
                    <h5 class="">Tên sản phẩm: {{$item->title}}</h5>
                    <h5> Giá hiện tại: <b>{{getCurrency($detail->price_end)}}</b></h5>
                    <h5>Trạng thái: @if($detail->status==0)<b>Chưa diễn ra</b>@else <b>Đang diễn ra</b>@endif</h5>
                    <div class="text-right">
                    <a class="btn btn-info" href="{{url('dau-gia/'.$campaign->slug.'/'.$item->slug)}}">Đấu giá</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>