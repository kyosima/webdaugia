@extends('public.layout')
@section('content')
    <script src="{{ asset('public/mevivu/js/pusher.js') }}"></script>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__option">
                            <a href="{{ URL::to('/') }}">Trang chủ</a>

                            <a href="{{ URL::to('dau-gia/') }}">Đấu giá</a>
                            <a href="{{ URL::to('dau-gia/' . $campaign->slug) }}">{{ $campaign->title }}</a>
                            <span>{{ $product->title }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <div id="toast-detail-{{ $detail->id }}" class="toast hide fade text-dark"
        style="position: fixed; top: 250px; right: 0; z-index:9  " data-delay="10000">
        <div class="toast-header">
            <strong class="mr-auto">Thông báo</strong>
            <small id=""></small>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            @if ($detail->status == 1)
                <p class="text-dark">Giá đã thay đổi thành: <b class="text-danger"
                        id="price-update">{{ getCurrency($detail->price_end) }}</b></p>
            @elseif($detail->status == 0)
                <p class="text-dark">Sản phẩm chưa tới thời gian đấu giá</p>
            @else
                <p class="text-dark">Sản phẩm đã kết thúc đấu giá</p>
            @endif
        </div>
    </div>
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row my-2">
                <div class="col-12">
                    <h3 class="product__detail__title">CK{{ $order + 1 }}-{{ $product->title }}</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-6 col-xs-12 col-sm-12">
                    <img class="my-1" src="{{ getImage($product->avatar) }}">


                    @if ($detail->status == 0)
                        <h5>Thời gian đấu đến khi đấu giá</h5>
                        <div class="detail-counter" style="display: block" id="detail-counter-{{ $order }}"
                            data-url="{{ url('dau-gia/bat-dau/detail/' . $detail->id) }}"
                            data-urlcancel="{{ url('dau-gia/ket-thuc/detail/' . $detail->id) }}"
                            data-urlot="{{ url('dau-gia/mo-rong/detail/' . $detail->id) }}">
                            <div id="timer">
                                <div class="number-list">
                                    <div class="item day">00</div>
                                    <div class="item hour">00</div>
                                    <div class="item minute">00</div>
                                    <div class="item second">00</div>
                                </div>
                                <div class="unit-list">
                                    <div class="item">Ngày</div>
                                    <div class="item">Giờ</div>
                                    <div class="item">Phút</div>
                                    <div class="item">Giây</div>
                                </div>
                            </div>
                        </div>
                        <script>
                            countStartDetail('{{ $campaign->time_start }}', {{ $order }}, {{ count($details) }},
                                {{ $campaign->time_range }}, {{ $detail->status }});
                        </script>
                    @elseif($detail->status ==1)

                        <h5>Thời gian đấu giá còn lại</h5>
                        <div class="detail-counter" style="display: block" id="detail-counter-{{ $order }}"
                            data-url="{{ url('dau-gia/bat-dau/detail/' . $detail->id) }}"
                            data-urlcancel="{{ url('dau-gia/ket-thuc/detail/' . $detail->id) }}"
                            data-urlot="{{ url('dau-gia/mo-rong/detail/' . $detail->id) }}">
                            <div id="timer">
                                <div class="number-list">
                                    <div class="item day">00</div>
                                    <div class="item hour">00</div>
                                    <div class="item minute">00</div>
                                    <div class="item second">00</div>
                                </div>
                                <div class="unit-list">
                                    <div class="item">Ngày</div>
                                    <div class="item">Giờ</div>
                                    <div class="item">Phút</div>
                                    <div class="item">Giây</div>
                                </div>
                            </div>
                        </div>
                        @if ($detail->ot_status == 1)
                            <script>
                                runOT('{{ $detail->ot_time }}', {{ $order }}, {{ count($details) }}, 5, {{ $detail->status }});
                            </script>
                        @else
                            <script>
                                countRunDetail('{{ $campaign->time_start }}', {{ $order }}, {{ count($details) }},
                                    {{ $campaign->time_range }}, {{ $detail->status }});
                            </script>
                        @endif
                    @endif
                    <h5>Thông tin sản phẩm</h5>
                    <div class="buttons-view">
                        <a class="btn-detail-view" data-url="{{ url('dau-gia/lay-hinh-anh/') }}"
                            data-id="{{ $detail->id }}" onclick="getImage(this)">Ảnh</a>
                        <a class="btn-detail-view" data-url="{{ url('dau-gia/lay-video/') }}"
                            data-id="{{ $detail->id }}" onclick="getVideo(this)">Video</a>
                        <a class="btn-detail-view" data-url="{{ url('dau-gia/lay-mo-ta/') }}"
                            data-id="{{ $detail->id }}" onclick="getDescription(this)">Mô tả</a>

                        @if ($campaign->status != 2)
                            <a class="btn-detail-view" id="add-detail-wishlist-{{ $detail->id }}"
                                data-detailid="{{ $detail->id }}" data-url="{{ url('dau-gia/yeu-thich') }}"
                                data-status="0" onclick="addCampaintoWishlist(this)">
                                @if ($detail->wishlist()->first() == null)
                                    <i class="material-icons">favorite_border</i>
                                @else
                                    <i class="material-icons">favorite</i>
                                @endif
                                <span>Thích</span>
                            </a>
                        @endif

                    </div>
                    <div class="product__details__text">

                        <ul>
                            <li><b>Chia sẻ</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xs-12 col-sm-12">

                    <div id="price-detail-{{ $detail->id }}" class="current-price-area">
                        <div class="alert alert-light text-center" id="user-detail-{{ $detail->id }}">
                            @if ($detail->status != 2)
                                <h5 class="text-center text-dark">Người ra giá cao nhất hiện tại</h5>
                            @else
                                <h5 class="text-center text-dark">Người chiến thắng</h5>
                            @endif
                            <b class=" text-danger">
                                @if ($detail->status == 0)
                                    <span id="user-top">Chưa có</span>
                                @elseif($detail->status==1)
                                    @if ($detail->user_id == null)
                                        <span id="user-top">Chưa có</span>
                                    @else
                                        <span id="user-top">{{ $detail->user_name }}</span>
                                    @endif
                                @elseif($detail->status==2)

                                    @if ($detail->user_id == null)
                                        <span id="user-top">Chưa có</span>
                                    @else
                                        <span id="user-top">{{ $detail->user_name }}</span>
                                    @endif

                                @endif
                            </b>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <span class="text-dark">Giá khởi điểm:</span><b
                                    class="text-light">{{ getCurrency($detail->detail_price_start) }}</b><br />
                                <span class="text-dark">Giá bước nhảy:</span><b
                                    class="text-light">{{ getCurrency($detail->detail_price_step) }}</b><br />
                                @if ($detail->status != 2)
                                    <span class="text-dark">Giá hiện tại:</span><b class="text-danger"
                                        id="current-price">{{ getCurrency($detail->price_end) }}</b><br />
                                @else
                                    <span class="text-dark">Giá cuối cùng:</span><b class="text-danger"
                                        id="current-price">{{ getCurrency($detail->price_end) }}</b><br />
                                @endif
                                <span class="text-dark">Giá tiếp theo:</span><b class="text-light"
                                    id="next-price">{{ getCurrency($detail->detail_price_step + $detail->price_end) }}</b><br />
                            </div>
                        </div>
                        <hr class="bg-light">
                        <div class="auction-area" @if ($detail->status != 1) style="display:none"@endif>
                            <h5 class="text-center">Đấu giá sản phẩm này</h5>
                            <form id="auction-form" class="form text-center" action="{{ url('/dau-gia/gui-dau-gia') }}"
                                method="POST">
                                <input type="hidden" id="detail_id" value="{{ $detail->id }}" name="detail_id">
                                <input type="hidden" id="auction-cf-{{ $detail->id }}"
                                    value="{{ $detail->price_end + $detail->detail_price_step }}" name="amount">
                                <div class="input-group mb-3">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-info" type="submit">Đấu giá</button>
                                </div>
                                <div class="notice-auction" style="display: none">
                                    <div class="alert alert-danger text-center p-0">
                                        <small></small>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="auction-area" @if ($detail->status != 1) style="display:none"@endif>

                            <h5 class="text-center">Tự động đấu giá sản phẩm này</h5>
                            <p class="text-center"><small>Đưa ra mức giá cao nhất bạn có thể đấu giá cho sản phẩm
                                    này</small></p>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" id="auction_ip" pattern="[0-9]">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">đ</span>
                                </div>
                            </div>
                            <form id="auto-form" class="form text-center" action="{{ url('/dau-gia/tu-dong-dau-gia') }}"
                                method="POST">
                                <input type="hidden" id="detail_id" value="{{ $detail->id }}" name="detail_id">
                                <input type="hidden" id="auto-price" value="" name="amount">
                                <div class="form-group">
                                    <button class="btn btn-info" type="submit">Cài đặt</button>
                                </div>
                                <div class="notice-auto" style="display: none">
                                    <div class="alert alert-danger text-center p-0">
                                        <small></small>
                                    </div>
                                </div>
                            </form>
                        </div>

                        {{-- nut mua ngay khi dau gia thanh cong --}}
                        <div class="text-center" @if ($detail->status == 2 && $detail->user_id == auth()->user()->id) style="display:block"@endif>
                            @if (count(Cart::instance('auction')->search(function ($cartItem) use ($detail) {
                                if($cartItem->id == $detail->product_id)
                                    return in_array($detail->campaign_id, $cartItem->options['campaign_ids']);
                            })) < 1 && $detail->user_id == auth()->user()->id && $detail->is_ordered != 1)
            
                                <button data-href="{{ route('auctioncart.addCart') }}" class="btn btn-warning btn-add-auction"
                                data-id="{{ $detail->product_id }}" data-userid="{{ auth()->user()->id }}"
                                data-camid="{{ $detail->campaign_id }}">Đặt hàng ngay</button>
                            @endif
                        </div>

                    </div>
                </div>
            </div>

            <div class="row justify-content-md-center my-4">
                <div class="col-md-8 col-lg-8 col-sm-12">
                    <h5>Sản phẩm gợi ý</h5>
                    <div id="campaign-detail">
                        @foreach ($related as $item)
                            @include('public.campaign.include.campaign_detail_grid', ['item'=>$item,
                            'product'=>$item->product()->first()])
                        @endforeach
                    </div>
                </div>
            </div>
            {{-- <div class="row">
            <div class="col-12">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                            src="{{getImage($product->avatar)}}" alt="">
                    </div>
                </div>
            </div>
        </div> --}}
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    {{-- <section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Sản phẩm tương tự</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="product__related_carousel">
                    <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                @foreach (\App\Models\Product::where('category_id', $product->category_id)->take(8)->latest()->get()
    as $product)
                                    @include('public.product.includes.product_grid', ['item'=>$product])
                                @endforeach
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> --}}
    <!-- Related Product Section End -->

    <div id="detail-media" class="modal fade  bd-example-modal-lg" id="exampleModalCenter" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered  modal-lg" role="document">
            <div class="modal-content ">
                {{-- <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div> --}}
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Đóng</button>
                    {{-- <button type="button" class="btn btn-primary">Save changes</button> --}}
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('.toast').toast('show');
        });
        $(document).ready(function() {
            document.getElementById("auction_ip").onkeyup = function() {
                this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                document.getElementById("auto-price").value = this.value.replace(/,/g, "")

            }
            var amount = document.querySelector('#auction_ip');
            amount.addEventListener('input', restrictNumber);

            function restrictNumber(e) {
                var newValue = this.value.replace(new RegExp(/[^\d]/, 'ig'), "");
                this.value = newValue;
            }

            $("#auction-form").submit(function(e) {
                var answer = window.confirm("Xác nhận đấu giá!");
                if (answer) {
                    e.preventDefault();
                    var form = $(this);
                    var url = form.attr('action');
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: form.serialize(),
                        error: function(data) {
                            console.log(data);
                        },
                        success: function(response) {
                            if (response == false) {
                                // data.redirect contains the string URL to redirect to
                                window.location.href = "{{ url('/dang-nhap') }}";
                            } else {
                                $('.notice-auction').css('display', 'block');
                                $('.notice-auction .alert small').text(response);
                                var notice = setInterval(function() {
                                    $('.notice-auction').css('display', 'none');
                                    clearInterval(notice);

                                }, 5000)
                            }

                        }
                    });
                }else{
                    e.preventDefault();
                }

            });
            $("#auto-form").submit(function(e) {
                var answer = window.confirm("Xác nhận tự động đấu giá!");
                if (answer) {
                    e.preventDefault();
                    var form = $(this);
                    var url = form.attr('action');
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: form.serialize(),
                        error: function(data) {
                            console.log(data);
                        },
                        success: function(response) {
                            if (response == false) {
                                // data.redirect contains the string URL to redirect to
                                window.location.href = "{{ url('/dang-nhap') }}";
                            } else {
                                $('.notice-auto').css('display', 'block');
                                $('.notice-auto .alert small').text(response);
                                var notice = setInterval(function() {
                                    $('.notice-auto').css('display', 'none');
                                    clearInterval(notice);

                                }, 5000)
                            }

                        }
                    });
                }
            });
        });
    </script>
@endsection
