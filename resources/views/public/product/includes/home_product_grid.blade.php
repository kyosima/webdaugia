<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
    <div class="featured__item product__discount__item" data-id="{{$item->id}}">
        <div class="featured__item__pic set-bg product__discount__item__pic "  data-setbg="{{getImage($item->avatar)}}">
            <div class="product__discount__percent">{{$item->discount}}%</div>
            <ul class="featured__item__pic__hover product__item__pic__hover">
                {{-- <li><a href="#"><i class="fa fa-heart"></i></a></li> --}}
                {{-- <li><a href="#"><i class="fa fa-retweet"></i></a></li> --}}
                {{-- <li class="quick-add"><button data-href="{{route('cart.fastAddToCart')}}"><i class="fa fa-shopping-cart"></i></button></li> --}}
            </ul>
        </div>
        <div class="featured__item__text product__discount__item__text">
            <h6><a href="{{route('san-pham.show',['san_pham'=>$item->slug])}}">{{$item->title}}</a></h6>
            @include('public.product.includes.price',['item'=>$item])
            {{-- <div class="star-rating" title="Rated 5.00 out of 5">
                <span style="width:{{rand(50,100)}}%"><strong class="rating">5.00</strong> out of 5</span>
            </div> --}}
        </div>
    </div>
</div>