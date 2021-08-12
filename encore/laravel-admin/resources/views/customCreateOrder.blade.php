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

        /* tbody#order_line_items tr .order-edit-line-item-actions {
            visibility: hidden;
        }

        tbody#order_line_items tr:hover .order-edit-line-item-actions {
            visibility: visible;
        } */

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

        /* LOAD CSS */
        .blockUI {}

        .blockOverlay {
            z-index: 1000;
            border: none;
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            background: rgb(255, 255, 255);
            opacity: 0.6;
            cursor: wait;
            position: absolute;
        }

        .blockUI.blockOverlay::before {
            height: 1em;
            width: 1em;
            display: block;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -.5em;
            margin-top: -.5em;
            content: "";
            -webkit-animation: spin 1s ease-in-out infinite;
            animation: spin 1s ease-in-out infinite;
            background: url('https://namptsport.com/wp-content/plugins/woocommerce/assets/images/icons/loader.svg') center center;
            background-size: cover;
            line-height: 1;
            text-align: center;
            font-size: 2em;
            color: rgba(0, 0, 0, .75);
        }

        @-webkit-keyframes spin {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg)
            }
        }

        @keyframes spin {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg)
            }
        }

    </style>

    <!-- form start -->
    <form action="{{route('admin.orders.addAutionOrder')}}" method="POST" class="form-horizontal">
        @csrf
        <input type="hidden" name="user_id" value="{{$user->id}}">
        <div class="box-body">
            <div class="fields-group">
                {{-- DIV THONG TIN --}}
                <div class="col-md-8">
                    <h2>Thông tin KH</h2>
                    <div class="form-group">
                        <label for="bill_address_name" class="col-sm-12 asterisk control-label">Tên KH</label>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                <input required type="text" id="bill_address_name" name="bill_address[name]"
                                    value="{{$user->user_info->fullname}}" class="form-control bill_address_name"
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
                                    value="{{$user->user_info->phone}}"
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
                                    value="{{$user->email}}" class="form-control bill_address_email_"
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
                                    value="{{$user->user_info->address}}"
                                    class="form-control bill_address_address" placeholder="Input Tên KH">
                            </div>
                        </div>
                    </div>

                    <div class="form-group  ">
                        <label for="note" class="col-sm-12  control-label">Note</label>
                        <div class="col-sm-12">
                            <textarea name="note" class="form-control note" rows="3"
                                placeholder="Input Note"></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <h2 class="text-left">Thông tin đơn hàng</h2>
                    <div class="form-group  ">
                        <label for="payment_method" class="col-sm-12 asterisk control-label">Phương thức thanh
                            toán</label>
                        <div class="col-sm-12">
                            <select name="payment_method" class="form-control payment_method" style="width: 100%;">
                                <option value="1">COD</option>
                                <option value="2">Chuyển khoản ngân
                                    hàng</option>
                            </select>
                        </div>
                    </div>

                </div>
                
            </div>

            {{-- TABLE PRODUCT --}}
            <div class="content">
                <div class="wrapper_table">
                    @include('tableProductAuctioned')
                </div>
            </div>

            <div>
                <button type="submit" class="btn btn-success" style="float: right">Tạo đơn</button>
                <button type="button" id="reset-button" class="btn btn-warning" style="float: right">Reset</button>
            </div>
        </div>
    </form>
</div>
<!-- /.box-body -->

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
        });

        $('.wc-product-search').select2();

        //KHI NHAN NUT XOA SAN PHAM
        $(document).on('click', 'a.delete-order-item', function() {
            let item_id = $(this).parents('tr.order-item').data('order_item_id');
            let campaign_id = $(this).parents('tr.order-item').data('order_campaign_id');
            if (confirm("Bạn chắc chắn muốn xóa những mục được chọn chứ?")) {
                $('#order_line_items tr.order-item[data-order_item_id="' + item_id + '"][data-order_campaign_id="'+campaign_id+'"').remove();
            }
        });

        $('#reset-button').click(function() {
            if (confirm("Bạn chắc chắn muốn reset chứ?")) {
                location.reload();
            }
        });

    });
</script>
