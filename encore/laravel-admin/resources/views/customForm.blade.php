<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">Edit</h3>

        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="javascript:void(0);" class="btn btn-sm btn-danger 60d9722d0d1f4-delete" title="Delete">
                    <i class="fa fa-trash"></i><span class="hidden-xs"> Delete</span>
                </a>
            </div>
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="{{ route('admin.orders.index') }}" class="btn btn-sm btn-default" title="List"><i
                        class="fa fa-list"></i><span class="hidden-xs">&nbsp;List</span></a>
            </div>
        </div>
    </div>
    <!-- /.box-header -->
    <style>
        tbody#order_line_items tr.order-item:not(:last-child) {
            border-bottom: 2px solid #ddd;
        }

        tbody#order_line_items tr .order-edit-line-item-actions {
            visibility: hidden;
        }

        tbody#order_line_items tr:hover .order-edit-line-item-actions {
            visibility: visible;
        }

        .order-edit-line-item-actions {
            width: 44px;
            text-align: right;
            padding-left: 0;
            vertical-align: middle;
            display: flex;
        }

        .order-edit-line-item-actions a:first-child {
            margin-left: 0;
        }

        .order-edit-line-item-actions a {
            color: #ccc;
            display: inline-block;
            cursor: pointer;
            padding: 0 0 .5em;
            margin: 0 0 0 12px;
            vertical-align: middle;
            text-decoration: none;
            line-height: 16px;
            width: 16px;
            overflow: hidden;
        }

        .order-edit-line-item-actions a::before {
            margin: 0;
            padding: 0;
            font-size: 16px;
            width: 16px;
            height: 16px;
        }

        .order-edit-line-item-actions .edit-order-item::before {
            font: normal normal normal 14px/1 FontAwesome;
            speak: none;
            font-weight: 400;
            font-variant: normal;
            text-transform: none;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            margin: 0;
            text-indent: 0;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            content: "\f040";
            position: relative;
        }

        .order-edit-line-item-actions .delete-order-item::before {
            font: normal normal normal 14px/1 FontAwesome;
            speak: none;
            font-weight: 400;
            font-variant: normal;
            text-transform: none;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            margin: 0;
            text-indent: 0;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            content: "\f00d";
            position: relative;
        }

        /*  */

        .order-data-row {
            border-bottom: 1px solid #dfdfdf;
            padding: 1.5em 2em;
            background: #f8f8f8;
            line-height: 2em;
            margin-bottom: 10px;
        }

        ul.coupon-list {
            margin: 0;
            padding: 0;
            overflow: hidden;
            zoom: 1;
        }

        ul.coupon-list li {
            margin: 0;
        }

        ul.coupon-list li.code {
            display: inline-block;
            position: relative;
            padding: 0 .5em;
            background-color: #fff;
            border: 1px solid #aaa;
            box-shadow: 0 1px 0 #dfdfdf;
            border-radius: 4px;
            margin-right: 5px;
            margin-top: 5px;
        }

        .code,
        code {
            font-family: Consolas, Monaco, monospace;
            direction: ltr;
            unicode-bidi: embed;
        }

        /*  */
        td.bill-total,
        td.bill-subtotal {
            font-weight: bold;
        }

        td.bill-promo {
            color: red;
        }

        /* MODEL POPUP */
        .wc-order-add-item {
            text-align: right;
            margin-bottom: 10px;
        }

        .wc-backbone-modal * {
            box-sizing: border-box;
        }

        .wc-backbone-modal .wc-backbone-modal-content {
            position: fixed;
            background: #fff;
            z-index: 100000;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            max-width: 100%;
            min-width: 500px;
        }

        .wc-backbone-modal-main article,
        .wc-backbone-modal-main header {
            display: block;
            position: relative;
        }

        .wc-backbone-modal-main .wc-backbone-modal-header {
            height: auto;
            background: #fcfcfc;
            padding: 1em 1.5em;
            border-bottom: 1px solid #ddd;
        }

        .wc-backbone-modal-main .wc-backbone-modal-header h1 {
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            line-height: 1.5em;
        }

        .wc-backbone-modal-main .wc-backbone-modal-header .modal-close-link {
            cursor: pointer;
            color: #777;
            height: 54px;
            width: 54px;
            padding: 0;
            position: absolute;
            top: 0;
            right: 0;
            text-align: center;
            border: 0;
            border-left: 1px solid #ddd;
            background-color: transparent;
            -webkit-transition: color .1s ease-in-out, background .1s ease-in-out;
            transition: color .1s ease-in-out, background .1s ease-in-out;
        }

        .screen-reader-text,
        .screen-reader-text span,
        .ui-helper-hidden-accessible {
            border: 0;
            clip: rect(1px, 1px, 1px, 1px);
            -webkit-clip-path: inset(50%);
            clip-path: inset(50%);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
            word-wrap: normal !important;
        }

        .wc-backbone-modal .wc-backbone-modal-content article {
            overflow: auto;
        }

        .wc-backbone-modal-main article {
            padding: 1.5em;
        }

        .widefat * {
            word-wrap: break-word;
        }

        .widefat {
            border-spacing: 0;
            width: 100%;
            clear: both;
            margin: 0;
        }

        .wc-backbone-modal-main article table.widefat {
            margin: 0;
            width: 100%;
            border: 0;
            box-shadow: none;
        }

        .comment-ays,
        .feature-filter,
        .imgedit-group,
        .popular-tags,
        .stuffbox,
        .widgets-holder-wrap,
        .wp-editor-container,
        p.popular-tags,
        table.widefat {
            background: #fff;
        }

        .wc-backbone-modal-main article table.widefat thead th:first-child {
            padding-left: 0;
        }

        .wc-backbone-modal-main article table.widefat thead th {
            padding: 0 1em 1em 1em;
            text-align: left;
        }

        .widefat tfoot tr td,
        .widefat tfoot tr th,
        .widefat thead tr td,
        .widefat thead tr th {
            color: #2c3338;
        }

        .widefat td,
        .widefat th {
            color: #50575e;
        }

        .widefat td,
        .widefat td ol,
        .widefat td p,
        .widefat td ul {
            font-size: 13px;
            line-height: 1.5em;
        }

        .widefat thead td,
        .widefat thead th {
            border-bottom: 1px solid #c3c4c7;
        }

        .widefat tfoot td,
        .widefat th,
        .widefat thead td {
            font-weight: 400;
        }

        /* .wc-backbone-modal-main article table.widefat tbody td:first-child,
        .wc-backbone-modal-main article table.widefat tbody th:first-child {
            padding-left: 0;
        }

        .wc-backbone-modal-main article table.widefat tbody td:last-child, .wc-backbone-modal-main article table.widefat tbody th:last-child, .wc-backbone-modal-main article table.widefat thead th:last-child {
            padding-right: 0;
            text-align: right;
        } */

        .wc-backbone-modal-main article table.widefat tbody td,
        .wc-backbone-modal-main article table.widefat tbody th {
            padding: 1em;
            text-align: left;
            vertical-align: middle;
        }

        .wc-backbone-modal-main footer {
            /* position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 100; */
            padding: 1em 1.5em;
            background: #fcfcfc;
            border-top: 1px solid #dfdfdf;
            box-shadow: 0 -4px 4px -4px rgb(0 0 0 / 10%);
        }

        .wc-backbone-modal .select2-container {
            width: 100% !important;
        }

        .wc-backbone-modal-main footer .inner {
            text-align: right;
            line-height: 23px;
        }

        .wc-backbone-modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            min-height: 360px;
            background: #000;
            opacity: .7;
            z-index: 99900;
        }

        .select2-dropdown {
            z-index: 9999999999;
        }

        .select2-search__field {
            width: 100% !important;
        }

    </style>

    <!-- form start -->
    <form action="{{ route('admin.orders.updateOrder', $bill->id) }}" method="POST" class="form-horizontal">
        @csrf
        @method('PUT')
        <div class="box-body">
            <div class="fields-group">
                {{-- DIV THONG TIN --}}
                <div class="col-md-8">
                    <h2 class="text-left">Thông tin đơn hàng</h2>
                    <div class="form-group">
                        <label for="created_at" class="col-sm-12 asterisk control-label">Ngày tạo</label>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                <input type="text" id="created_at" name="created_at" value="{{ $bill->created_at }}"
                                    class="form-control created_at" placeholder="Ngày tạo">
                            </div>
                        </div>
                    </div>

                    <div class="form-group  ">
                        <label for="bill_status" class="col-sm-12 asterisk control-label">Trạng thái đơn hàng</label>
                        <div class="col-sm-12">
                            <select name="bill_status" class="form-control bill_status" style="width: 100%;">
                                <option value="0" {{ $bill->bill_status == 0 ? 'selected' : '' }}>Chờ thanh toán
                                </option>
                                <option value="1" {{ $bill->bill_status == 1 ? 'selected' : '' }}>Đang xử lý</option>
                                <option value="2" {{ $bill->bill_status == 2 ? 'selected' : '' }}>Đã hoàn tất</option>
                                <option value="3" {{ $bill->bill_status == 3 ? 'selected' : '' }}>Đã hủy</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group  ">
                        <label for="payment_method" class="col-sm-12 asterisk control-label">Phương thức thanh
                            toán</label>
                        <div class="col-sm-12">
                            <select name="payment_method" class="form-control payment_method" style="width: 100%;">
                                <option value="1" {{ $bill->payment_method == 1 ? 'selected' : '' }}>COD</option>
                                <option value="2" {{ $bill->payment_method == 2 ? 'selected' : '' }}>Chuyển khoản ngân
                                    hàng</option>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <h2>Thông tin KH</h2>
                    <div class="form-group">
                        <label for="bill_address_name" class="col-sm-12 asterisk control-label">Tên KH</label>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                <input required type="text" id="bill_address_name" name="bill_address[name]"
                                    value="{{ $bill->bill_address->name }}" class="form-control bill_address_name"
                                    placeholder="Input Tên KH">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bill_address_phone" class="col-sm-12 asterisk control-label">SĐT</label>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                <input required type="text" id="bill_address_phone" name="bill_address[phone]"
                                    value="{{ $bill->bill_address->phone }}"
                                    pattern="((09|03|07|08|05)+([0-9]{8})\b)|(84)\d{9}"
                                    class="form-control bill_address_phone" placeholder="Input SĐT">
                            </div>
                        </div>
                    </div>

                    <div class="form-group  ">
                        <label for="bill_address_email" class="col-sm-12 asterisk control-label">Email</label>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span>
                                <input required type="email" id="bill_address_email" name="bill_address[email]"
                                    value="{{ $bill->bill_address->email }}" class="form-control bill_address_email_"
                                    pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" placeholder="Input Email">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bill_address_address" class="col-sm-12 asterisk control-label">Địa chỉ</label>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                <input required type="text" id="bill_address_address" name="bill_address[address]"
                                    value="{{ $bill->bill_address->address }}" class="form-control bill_address_address"
                                    placeholder="Input Tên KH">
                            </div>
                        </div>
                    </div>

                    <div class="form-group  ">
                        <label for="note" class="col-sm-12  control-label">Note</label>
                        <div class="col-sm-12">
                            <textarea name="note" class="form-control note" rows="3"
                                placeholder="Input Note">{!! $bill->note !!}</textarea>
                        </div>
                    </div>
                </div>
            </div>

            {{-- TABLE PRODUCT --}}
            <div class="content">
                <div class="wrapper_table">
                    @include('tableProductOrder')
                </div>
            </div>

            <div class="box-body order-data-row">
                @include('tableTotal')
            </div>

            <div class="function" style="margin-bottom: 10px;">
                {{-- <a href="{{ route('order.index') }}" class="btn btn-secondary" data-dismiss="modal">Back</a> --}}
                <button type="button" class="btn btn-success add-order-item">Thêm mới</button>
                {{-- <button type="button" class="btn btn-success">Áp dụng</button> --}}

                <button type="button" class="btn btn-warning" style="float: right">Tính toán lại</button>
            </div>

            <div class="wc-order-data-row wc-order-add-item wc-order-data-row-toggle" style="display:none;">
                <button type="button" class="btn add-order-item">Thêm (các) sản phẩm</button>
                <button type="button" class="btn cancel-action" data-reload="true">Hủy</button>
                <button type="button" class="btn btn-primary save-action">Lưu</button>
            </div>

            <div>
                <button type="submit" class="btn btn-success" style="float: right">Cập nhật</button>
            </div>
        </div>
    </form>
</div>
<!-- /.box-body -->

<div id="wc-backbone-modal-dialog" style="display: none;">
    <div class="wc-backbone-modal">
        <div class="wc-backbone-modal-content" tabindex="0">
            <section class="wc-backbone-modal-main" role="main">
                <header class="wc-backbone-modal-header">
                    <h1>Thêm các sản phẩm</h1>
                    <button class="modal-close modal-close-link fa fa-times">
                        <span class="screen-reader-text">Close modal panel</span>
                    </button>
                </header>
                <article style="max-height: 252px;">
                    <form action="" method="post">
                        <table class="widefat">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select class="form-control wc-product-search" name="item_id[]"
                                            multiple="multiple">
                                            @foreach ($products as $product)
                                                <option value="{{ $product->id }}">{{ $product->title }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </article>
                <footer>
                    <div class="inner">
                        <button id="btn-ok" class="btn btn-primary button-large">Thêm</button>
                    </div>
                </footer>
            </section>
        </div>
    </div>
    <div class="wc-backbone-modal-backdrop modal-close"></div>
</div>

<script>
    $(function() {
        $(document).on("click", "a.edit-order-item", function() {
            $('a.edit-order-item').css('display', 'none')
            let id = $(this).parents('tr.order-item').data('order_item_id');
            $('tr[data-order_item_id="' + id + '"] div.view').css('display', 'none')
            $('tr[data-order_item_id="' + id + '"] div.edit').css('display', 'block')
            $('tr[data-order_item_id="' + id + '"] a.edit-order-item').css('display', 'none')
            $('.function').css('display', 'none')
            $('.wc-order-add-item').css('display', 'block')
            // KHI NHAN NUT LUU

            $(document).on('click', 'button.save-action', function() {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    type: "PUT",
                    url: "{{route('admin.orders.updateQtyProduct', $bill->id)}}",
                    data: {
                        item_id: id,
                        edited_price: $('input[name="order_item_price['+id+']"]').val(),
                        edited_qty: $('input[name="order_item_qty['+id+']"]').val()
                    },
                    success: function(response) {
                        $('.wrapper_table').html(response[0]);
                        $('.box-body.order-data-row').html(response[1]);
                        
                        $('.function').css('display', 'block')
                        $('.wc-order-add-item').css('display', 'none')

                    }
                });
            })
        });

        // KHI NHAN NUT HUY
        $('.cancel-action').click(function(){
            $('.function').css('display', 'block')
            $('.wc-order-add-item').css('display', 'none')
            $('a.edit-order-item').css('display', 'block')
            $('div.view').css('display', 'block')
            $('div.edit').css('display', 'none')

        })

        $('.wc-product-search').select2();

        $('.add-order-item').click(function() {
            $('#wc-backbone-modal-dialog').css('display', 'block')
        })
        $('#wc-backbone-modal-dialog .modal-close').click(function() {
            $('#wc-backbone-modal-dialog').css('display', 'none')
        })

        // KHI NHAN NUT THEM SAN PHAM
        $('#btn-ok').click(function() {
            $('#wc-backbone-modal-dialog').css('display', 'none')
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: "{{ route('admin.orders.addProductToOrder', $bill->id) }}",
                data: {
                    item_id: $('.wc-product-search').val()
                },
                success: function(response) {
                    $('.wrapper_table').html(response[0]);
                    $('.box-body.order-data-row').html(response[1]);
                }
            });
        })

        //KHI NHAN NUT XOA SAN PHAM
        $(document).on('click', 'a.delete-order-item', function() {
            let item_id = $(this).parents('tr.order-item').data('order_item_id');
            if(confirm("Bạn chắc chắn muốn xóa những mục được chọn chứ?")){
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    type: "DELETE",
                    url: "{{ route('admin.orders.deleteProduct', $bill->id) }}",
                    data: {
                        item_id: item_id
                    },
                    beforeSend: function() {
                        return confirm("Bạn chắc chắn muốn xóa những mục được chọn chứ?");
                    },
                    success: function(response) {
                        $('.wrapper_table').html(response[0]);
                        $('.box-body.order-data-row').html(response[1]);
                    }
                });
            }
        });

        

    });
</script>
