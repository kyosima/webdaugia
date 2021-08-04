@extends('public.layout')
@section('content')

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
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
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                            <tr>
                                <th class="shoping__product">Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @foreach (Cart::instance('shopping')->content() as $item)
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="{{$item->options->feature_img}}" alt="" width="100" height="100">
                                    <h5>{{$item->name}}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    @money($item->price)
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <span class="dec qtybtn">-</span>
                                            <input type="text" value="{{$item->qty}}" data-rowId="{{$item->rowId}}">
                                            <span class="inc qtybtn">+</span>
                                        </div>
                                    </div>
                                </td>
                                <td class="shoping__cart__total" data-rowId="{{$item->rowId}}">
                                    @money($item->price*$item->qty)
                                </td>
                                <td class="shoping__cart__item__close">
                                    <span class="icon_close remove" data-rowId="{{$item->rowId}}" data-href="{{route('cart.removeFromCart')}}"></span>
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
                    <a href="#" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                    {{-- <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                        Upadate Cart</a> --}}
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Mã giảm giá</h5>
                        <form action="{{route('coupon.useCoupon')}}" method="POST">
                            @csrf
                            <input type="text" name="couponCode" placeholder="Nhập mã giảm giá"
                            @if (session('coupon'))
                                value="{{session()->get('coupon')['name']}}" readonly
                            @endif
                            >
                            <button type="submit" class="site-btn">ÁP DỤNG</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Tổng tiền giỏ hàng</h5>
                    <ul>
                        <li class="shopping__subtotal">
                            <span>Tổng tạm tính</span>
                            <b class="float-right">{{Cart::instance('shopping')->subtotal()}}₫</b>
                        </li>

                        @if (session('coupon'))
                            <li class="shopping__discount">
                                <span class="float-left mr-1">Giảm giá từ coupon</span>
                                <p class="float-left mr-1" style="color:red; display:inline-block; margin:0;">{{session('coupon')['name']}}</p>
                                <form class="float-left" action="{{route('coupon.unUseCoupon')}}" method="post">
                                    @csrf
                                    @method('delete')
                                    <button type="submit">x</button>
                                </form>
                                <b class="float-right">-@money(session('coupon')['discount'])</b>
                            </li>

                            <li class="shopping__total">
                                <span>Tổng cộng</span>
                                <b class="float-right">@money(session('coupon')['newSubtotal'])</b>
                            </li>
                        @else
                            <li class="shopping__total">
                                <span>Tổng cộng</span>
                                <b class="float-right">{{Cart::instance('shopping')->total()}}₫</b>
                            </li>
                        @endif
                    </ul>
                    <a href="{{route('checkout.index')}}" class="primary-btn">THANH TOÁN</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

@endsection