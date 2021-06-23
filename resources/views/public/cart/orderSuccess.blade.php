@extends('public.layout')
@section('content')

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Order Success</h2>
                        <div class="breadcrumb__option">
                            <a href="{{URL::to('/')}}">Trang chủ</a><span>Order Success</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="order-success spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="order-details">
                        <h2 class="order-details-title">Chi tiết đơn hàng</h2>
                        <table class="shop_table">
                            <thead>
                                <tr>
                                    <th class="table__product-name product-name">Sản phẩm</th>
                                    <th class="table__product-total product-total">Tổng</th>
                                </tr>
                            </thead>

                            <tbody>
                                @foreach ($products as $item)
                                    <tr class="order-item">
                                        <td class="table__product-name product-name">
                                            <a href="{{ route('san-pham.index') . '/'.$item->slug }}">{{ $item->title }}</a>
                                            <strong class="product-quantity">x &nbsp;{{ $item->quantity }}</strong>
                                        </td>
                                        <td class="table__product-total product-total">
                                            <span
                                                class="price-amount">{{ number_format($item->quantity * $item->price, 0, ',', '.') }}₫</span>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>

                            <tfoot>
                                <tr>
                                    <th scope="row">Tổng số phụ:</th>
                                    <td>
                                        <span
                                            class="price-amount">{{ number_format($bill->bill_total, 0, ',', '.') }}₫</span>
                                    </td>
                                </tr>
                                @if ($order->bill_promo > 0)
                                    <tr>
                                        <th scope="row">Giảm giá:</th>
                                        <td>
                                            <span
                                                class="price-amount">{{ number_format($bill->bill_promo, 0, ',', '.') }}₫</span>
                                        </td>
                                    </tr>
                                @endif
                                <tr>
                                    <th scope="row">Phương thức thanh toán:</th>
                                    <td>{{ $bill->payment_method == 1 ? 'COD' : 'Chuyển khoản ngân hàng' }}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Tổng cộng:</th>
                                    <td>
                                        @if ($bill->bill_promo > 0)
                                            <span
                                                class="price-amount">{{ number_format($bill->bill_total - $bill->bill_promo, 0, ',', '.') }}₫</span>
                                        @else
                                            <span
                                                class="price-amount">{{ number_format($bill->bill_total, 0, ',', '.') }}₫</span>
                                        @endif
                                    </td>
                                </tr>
                            </tfoot>

                        </table>
                    </div>

                    <div class="customer-details">
                        <h2 class="customer-details-title">Địa chỉ thanh toán</h2>
                        <address>
                            {{ $info->name }}<br>{{ $street }}<br>{{ $phuong }}<br>{{ $quan }}<br>{{ $thanhpho }}
                            <p class="customer-details--phone">{{ $info->phone }}</p>
                            <p class="customer-details--email">{{ $info->email }}</p>
                        </address>
                    </div>

                </div>
                <div class="col-lg-5">
                    <div class="is-well col-inner entry-content">
                        <p
                            class="success-color thankyou-order-received">
                            <strong>Cảm ơn {{$info->name}}. Đơn hàng của bạn đã được nhận.</strong></p>

                        <ul class="order-overview">
                            <li class="order-overview__order order">
                                Mã đơn hàng: <strong>{{$bill->id}}</strong>
                            </li>
                            <li class="order-overview__date date">
                                Ngày: <strong>22 Tháng Sáu, 2021</strong>
                            </li>
                            <li class="order-overview__email email">
                                Số điện thoại: <strong>{{$info->phone}}</strong>
                            </li>
                            <li class="order-overview__total total">
                                Tổng cộng: <strong>
                                    @if ($bill->bill_promo > 0)
                                    <span
                                        class="price-amount">{{ number_format($bill->bill_total - $bill->bill_promo, 0, ',', '.') }}₫</span>
                                    @else
                                        <span
                                            class="price-amount">{{ number_format($bill->bill_total, 0, ',', '.') }}₫</span>
                                    @endif
                                </strong>
                            </li>
                            <li class="order-overview__payment-method method">
                                Phương thức thanh toán: <strong>{{ $bill->payment_method == 1 ? 'COD' : 'Chuyển khoản ngân hàng' }}</strong>
                            </li>

                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- Checkout Section End -->

@endsection
