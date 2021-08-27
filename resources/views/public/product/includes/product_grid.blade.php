<div class="col-lg-4 col-md-6 col-sm-6" >
    <div class="product__discount__item featured__item" data-id="{{$item->id}}">
            <div class="product__discount__item__pic set-bg featured__item__pic"
                data-setbg="{{getImage($item->avatar)}}">
                <div class="product__discount__percent">{{$item->discount}}%</div>
                <ul class="product__item__pic__hover">
                    {{-- <li class="wishlist-add"><button href="#"><i class="fa fa-heart"></i></button></li> --}}
                    {{-- <li class=""><button href="#"><i class="fa fa-retweet"></i></button></li> --}}
                    <li class="quick-add"><button data-href="{{route('cart.fastAddToCart')}}"><i class="fa fa-shopping-cart"></i></button></li>
                </ul>
            </div>
            <div class="product__discount__item__text">
                {{-- <span class="product__brand_name"><a href="{{route('danh-muc.show',['danh_muc'=>$item->category->slug])}}">{{$item->category->title}}</a></span> --}}
                <h5 class=""><a href="{{route('san-pham.show',['san_pham'=>$item->slug])}}">{{$item->title}}</a></h5>
                @include('public.product.includes.price',['item'=>$item])
            </div>
    </div>
</div>