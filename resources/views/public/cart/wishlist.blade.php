@extends('public.layout')
@section('content')

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Wish List</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Wish List</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table wishlist_table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach (Cart::instance('wishlist')->content() as $item)
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="{{$item->options->feature_img}}" alt="" width="100" height="100">
                                        <h5>{{$item->name}}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        @if ($item->options->price_regular)
                                            <span class="price-before-promo">{{getCurrency($item->options->price_regular)}}</span>
                                            <span class="price-promo">{{getCurrency($item->price)}}</span>
                                        @else
                                            {{getCurrency($item->price)}}
                                        @endif
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <form action="{{route('wishlist.changeWishToCart')}}" method="post">
                                            @csrf
                                            <input type="hidden" name="rowID" value="{{$item->rowId}}">
                                            <input type="hidden" name="id" value="{{$item->id}}">
                                            <button class="btn-success wishlist-change-cart">Thêm vào giỏ hàng <i class="icon_plus"></i></button>
                                        </form>
                                    </td>
                                    <td class="shoping__cart__item__plus">
                                        <form action="{{route('wishlist.removeFromWishList')}}" method="post">
                                            @csrf
                                            @method('delete')
                                            <input type="hidden" name="rowID" value="{{$item->rowId}}">
                                            <button class="btn-danger wishlist-remove">Xóa khỏi danh sách <i class="icon_close"></i></button>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="{{route('san-pham.index')}}" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                        {{-- <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                        Upadate Cart</a> --}}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Wishlist Section End -->


@endsection
