<div class="col-lg-4 col-md-6 col-sm-6">
    <div class="product__discount__item">
            <div class="product__discount__item__pic set-bg"
                data-setbg="@getimage({{$item->avatar}})">
                <div class="product__discount__percent">{{$item->discount}}%</div>
                <ul class="product__item__pic__hover">
                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                </ul>
            </div>
            <div class="product__discount__item__text">
                <span class="product__brand_name"><a href="{{route('danh-muc.show',['danh_muc'=>$item->category->slug])}}">{{$item->category->title}}</a></span>
                <h5 class=""><a href="{{route('san-pham.show',['san_pham'=>$item->slug])}}">{{$item->title}}</a></h5>
                @include('public.product.includes.price',['item'=>$item])
            </div>
    </div>
</div>