<div class="col-lg-4 col-md-6 col-sm-6">
    <div class="product__discount__item">
            <div class="product__discount__item__pic set-bg"
                data-setbg="@getimage({{$item->product_feature_img}})">
                <div class="product__discount__percent">{{$item->product_discount}}%</div>
                <ul class="product__item__pic__hover">
                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                </ul>
            </div>
            <div class="product__discount__item__text">
                <span class="product__brand_name">{{$item->category->category_name}}</span>
                <h5><a href="{{route('san-pham.show',['san_pham'=>$item->product_slug])}}"><span class="product__name__item">{{$item->product_name}}</span></a></h5>
                @include('public.product.includes.price',['item'=>$item])
            </div>
    </div>
</div>