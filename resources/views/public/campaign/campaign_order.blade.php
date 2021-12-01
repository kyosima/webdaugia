@extends('public.layout')
@section('content')
<!-- banner Section start -->
<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 pr-md-1">
                <div id="demo" class="carousel slide" data-ride="carousel">
                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="{{asset('public/mevivu/img/banner/banner-3.jpg')}}" alt="Los Angeles" width="100%">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>
            </div>
            <div class="col-lg-3 pl-md-1 banner-left d-none d-md-block">
                <div class="mb-2">
                    <img src="{{asset('public/mevivu/img/banner/banner-4.jpg')}}" alt="Los Angeles" width="100%">
                </div>
                <div>
                    <img src="{{asset('public/mevivu/img/banner/banner-5.jpg')}}" alt="Los Angeles" width="100%">
                </div>
            </div>
        </div>
    </div>
    
</section>
<!-- banner Section end -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            @include('public.product.includes.sidebar')
            <div class="col-lg-9 col-md-7">
                
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <b class="text-light">Các sản phẩm bạn đã đấu giá được</b>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="filter__found">
                                <h6><span>{{count($campaign_detail_win)}}</span> sản phẩm</h6>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="row">
                    <table id="order_table" class="table-bordered responsive nowrap table-light" width="100%">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Ảnh sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá đấu giá</th>
                                <th>Ngày lên đơn</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $i = 1;
                            @endphp
                            @foreach($campaign_detail_win as $item)
                            <tr>
                                <td>{{$i++}}</td>
                                <td><img src="{{ getImage($item->product->avatar) }}" alt="" width="100px"></td>
                                <td>{{ $item->product->title }}</td>
                                <td>{{ getCurrency($item->price_end) }}</td>
                                <td>{{ date("d/m/Y", strtotime($item->updated_at)); }}</td>
                                <td>
                                    <a class="btn btn-info" href="{{ url('dau-gia/' . $item->campaign->slug . '/' . $item->product->slug) }}">Xem chi tiết</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->
@endsection

@push('scripts')
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/r-2.2.9/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.3/r-2.2.9/datatables.min.js"></script>

<script>

var table = $('#order_table').DataTable({
                lengthMenu: [
                    [25, 50, 100, -1],
                    [25, 50, 100, "All"]
                ],
            responsive: true,
            language: {
                    search: "Tìm kiếm:",
                    lengthMenu: "Hiển thị _MENU_ kết quả",
                    info: "Hiển thị _START_ đến _END_ trong _TOTAL_ kết quả",
                    infoEmpty: "Hiển thị 0 trên 0 trong 0 kết quả",
                    zeroRecords: "Không tìm thấy",
                    emptyTable: "Hiện tại chưa có dữ liệu",
                    paginate: {
                        first: ">>",
                        last: "<<",
                        next: ">",
                        previous: "<"
                    },
            },
            dom: '<"wrapper d-flex justify-content-between mb-3"lf>tip',
        });

</script>

<style>
    #order_table_wrapper {
        background: #fff;
        padding: 10px 5px;
        width: 100%;
    }

    
</style>

@endpush