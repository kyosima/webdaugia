@extends('public.layout')
@section('content')

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart Auction</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart Auction</span>
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

                                @foreach (Cart::instance('auction')->content() as $item)
                                    {{-- @foreach ($item->options['campaign_ids'] as $a)
                                        @php
                                            dump($a);
                                        @endphp
                                    @endforeach --}}
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img src="{{ $item->options->feature_img }}" alt="" width="100" height="100">
                                            <h5>{{ $item->name }}</h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                            {{ getCurrency($item->price) }}
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <span>{{ $item->qty }}</span>
                                            </div>
                                        </td>
                                        <td class="shoping__cart__total" data-rowId="{{ $item->rowId }}">
                                            {{ getCurrency($item->price * $item->qty) }}
                                        </td>
                                        <td class="shoping__cart__item__close">
                                            <span class="icon_close remove remove_auction" data-rowId="{{ $item->rowId }}"
                                                data-href="{{ route('auctioncart.removeFromCart') }}"></span>
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
                </div>

                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Tổng tiền giỏ hàng</h5>
                        <ul>
                            <li class="auction__subtotal">
                                <span>Tổng tạm tính</span>
                                <b class="float-right">{{ Cart::instance('auction')->subtotal() }}₫</b>
                            </li>

                            <li class="auction__total">
                                <span>Tổng cộng</span>
                                <b class="float-right">{{ Cart::instance('auction')->total() }}₫</b>
                            </li>
                        </ul>
                        <a href="{{ route('auctioncheckout.index') }}" class="primary-btn">THANH TOÁN</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

@endsection
