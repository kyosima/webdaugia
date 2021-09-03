@extends('public.layout')
@section('content')

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Checkout Auction</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Trang chủ</a><span>Checkout Auction</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">

        <div class="checkout__form">
            <h4>Chi tiết hóa đơn</h4>
            <form action="{{route('auctioncheckout.checkout')}}" method="POST" id="form-checkout">
                @csrf
                <div class="row">
                    @if (Auth::check())
                    @php
                        $user = App\Models\User::find(Auth::user()->id);
                    @endphp

                    <div class="col-lg-8 col-md-6">
                        <div class="checkout__input">
                            <p>Họ và Tên<span>*</span></p>
                            <input type="text" name="customer_Name" value="{{old('customer_Name', $user->user_info->fullname)}}" required>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Số điện thoại<span>*</span></p>
                                    <input type="tel" name="customer_Phone" value="{{old('customer_Phone', $user->user_info->phone)}}"  required>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input type="email" name="customer_Email" value="{{old('customer_Email', $user->email)}}" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Tỉnh/ Thành<span>*</span></p>
                                    <select class="js-location select-location" id="selectCity" data-type="city" name="customer_City">
                                        <option value="" selected>Mời bạn chọn Tỉnh/ Thành</option>
                                        @foreach ($cities as $item)
                                            <option value="{{$item->id}}">{{$item->_name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Quận/ Huyện<span>*</span></p>
                                    <select id="selectDistrict" class="js-location select-location" data-type="district" name="customer_District">
                                        <option value="" selected>Mời bạn chọn Quận/ Huyện</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Phường/ Xã<span>*</span></p>
                                    <select id="selectWard" class="select-location" data-type="ward" name="customer_Ward">
                                        <option value="" selected>Mời bạn chọn Phường/ Xã</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Địa chỉ nhận hàng<span>*</span></p>
                                    <input type="text" name="customer_Address" placeholder="Số nhà, tên đường,..." value="{{old('customer_Address', $user->user_info->address)}}" class="checkout__input__add" required>
                                </div>
                            </div>
                        </div>
                        {{-- <div class="checkout__input__checkbox">
                            <label for="diff-acc">
                                Ship to a different address?
                                <input type="checkbox" id="diff-acc">
                                <span class="checkmark"></span>
                            </label>
                        </div> --}}
                        <div class="checkout__input">
                            <p>Ghi chú đơn hàng<span></span></p>
                            <input type="text"
                                placeholder="Ghi chú cho đơn hàng của bạn tại đây" value="{{old('customer_Note')}}" name="customer_Note">
                        </div>
                    </div>

                    @endif
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn hàng của bạn</h4>
                            <div class="checkout__order__products">Sản phẩm <span>Tổng</span></div>
                            <ul>
                                @foreach (Cart::instance('auction')->content() as $item)
                                    <li>{{$item->name}} x {{$item->qty}} 
                                        <span>{{getCurrency($item->qty * $item->price)}}</span>
                                    </li>
                                @endforeach
                            </ul>
                            <div class="checkout__order__subtotal">
                                Tổng tạm tính 
                                <b>{{Cart::instance('auction')->subtotal()}}₫</b>
                            </div>

                            @if(session('coupon'))
                                <div class="checkout__order__total checkout__order__coupon">
                                    <span class="float-left mr-1">Mã giảm giá</span>
                                    <span class="float-left mr-1" style="color: #dd2222;">{{session('coupon')['name']}}</span>
                                    <span class="float-left remove coupon-remove" style="cursor: pointer">x</span>
                                    <b>-{{getCurrency(session('coupon')['discount'])}}</b>
                                </div>
                                                        
                            @endif

                            <div class="checkout__order__total">
                                Tổng cộng 
                                <b>{{Cart::instance('auction')->total()}}₫</b>
                            </div>
                            <div class="checkout__input__radio">
                                {{-- <label for="payment">
                                    COD
                                    <input type="radio" id="payment" name="cod">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="paypal">
                                    Chuyển khoản ngân hàng
                                    <input type="radio" id="paypal" name="banking">
                                    <span class="checkmark"></span>
                                </label> --}}
                                <div>
                                    <input type="radio" id="cod"
                                     name="payment_method" value="cod" checked>
                                    <label for="cod">COD</label>
                                </div>
                                
                                <div>
                                    <input type="radio" id="banking"
                                     name="payment_method" value="banking">
                                    <label for="banking">Chuyển khoản ngân hàng</label>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                
                            </div>
                                
                            <button type="submit" class="site-btn">ĐẶT HÀNG</button>
                        </div>
                    </div>
                </div>

                <!-- INPUT HIDDEN LOCATION -->
                <input type="hidden" name="bill_subtotal" value="{{intval(str_replace(".","",Cart::instance('auction')->subtotal()))}}">
                <input type="hidden" name="bill_promo" value="">
                <input type="hidden" name="bill_coupon" value="">
                <input type="hidden" name="bill_soluong" value="{{Cart::instance('auction')->count()}}">
                <input type="hidden" name="bill_total" value="{{intval(str_replace(".","",Cart::instance('auction')->total()))}}">


                <input type="hidden" id="thanhphohidden" name="thanhpho" value="">
                <input type="hidden" id="quanhidden" name="quan" value="">
                <input type="hidden" id="phuonghidden" name="phuong" value="">

            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

@endsection