<?php
    use Carbon\Carbon;
?>

<div marginwidth="0" marginheight="0" style="padding:0">
    <div id="m_-7487506495403580656wrapper" dir="ltr"
        style="background-color:#f7f7f7;margin:0;padding:70px 0;width:100%">
        <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
            <tbody>
                <tr>
                    <td align="center" valign="top">
                        <div id="m_-7487506495403580656template_header_image">
                        </div>
                        <table border="0" cellpadding="0" cellspacing="0" width="600"
                            id="m_584358752881652500template_container"
                            style="background-color:#ffffff;border:1px solid #dedede;border-radius:3px">
                            <tbody>
                                <tr>
                                    <td align="center" valign="top">

                                        <table border="0" cellpadding="0" cellspacing="0" width="100%"
                                            id="m_584358752881652500template_header"
                                            style="background-color:#000;color:#ffffff;border-bottom:0;font-weight:bold;line-height:100%;vertical-align:middle;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;border-radius:3px 3px 0 0">
                                            <tbody>
                                                <tr>
                                                    <td id="m_584358752881652500header_wrapper"
                                                        style="padding:36px 48px;display:block">
                                                        <h1
                                                            style="font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:30px;font-weight:300;line-height:150%;margin:0;text-align:left;color:#ffffff">
                                                            Đơn hàng mới #{{ $billID }}</h1>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">

                                        <table border="0" cellpadding="0" cellspacing="0" width="600"
                                            id="m_584358752881652500template_body">
                                            <tbody>
                                                <tr>
                                                    <td valign="top" id="m_584358752881652500body_content"
                                                        style="background-color:#ffffff">

                                                        <table border="0" cellpadding="20" cellspacing="0" width="100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top" style="padding:48px 48px 32px">
                                                                        <div id="m_584358752881652500body_content_inner"
                                                                            style="color:#636363;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:14px;line-height:150%;text-align:left">

                                                                            <p style="margin:0 0 16px">Bạn vừa nhận được
                                                                                đơn hàng từ {{ $name }}. Đơn hàng như sau:
                                                                            </p>

                                                                            <h2
                                                                                style="color:#000;display:block;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left">
                                                                                <a href="#"
                                                                                    style="font-weight:normal;text-decoration:underline;color:#000"
                                                                                    target="_blank"
                                                                                    data-saferedirecturl="">[Đơn hàng
                                                                                    #{{ $billID }}]</a>
                                                                                ({{Carbon::now('Asia/Ho_Chi_Minh')->format('l d F Y')}})
                                                                            </h2>

                                                                            <div style="margin-bottom:40px">
                                                                                <table cellspacing="0" cellpadding="6"
                                                                                    border="1"
                                                                                    style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;width:100%;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th scope="col"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                Sản phẩm</th>
                                                                                            <th scope="col"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                Số lượng</th>
                                                                                            <th scope="col"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                Giá</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        @foreach ($items as $item)
                                                                                        
                                                                                            <tr>
                                                                                                <td
                                                                                                    style="color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;word-wrap:break-word">
                                                                                                    {{ $item->title }}
                                                                                                </td>
                                                                                                <td
                                                                                                    style="color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif">
                                                                                                    {{ $item->quantity }}
                                                                                                </td>
                                                                                                <td
                                                                                                    style="color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif">
                                                                                                    <span>{{ number_format($item->price * $item->quantity , '0', ',', '.') }}<span>₫</span></span>
                                                                                                </td>
                                                                                            </tr>
                                                                                        @endforeach

                                                                                    </tbody>
                                                                                    <tfoot>
                                                                                        <tr>
                                                                                            <th scope="row" colspan="2"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;border-top-width:4px">
                                                                                                Tổng số phụ:</th>
                                                                                            <td
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;border-top-width:4px">
                                                                                                <span>{{ number_format($subtotal , '0', ',', '.') }}<span>₫</span></span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        @if ($promo > 0)
                                                                                        <tr>
                                                                                            <th scope="row" colspan="2"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;">
                                                                                                Giảm giá:</th>
                                                                                            <td
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;">
                                                                                                <span>-{{ number_format($promo, '0', ',', '.')}}<span>₫</span></span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        @endif
                                                                                         <tr>
                                                                                            <th scope="row" colspan="2"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                Phương thức thanh toán:
                                                                                            </th>
                                                                                            <td
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                {{$payment == 1 ? 'Trả tiền mặt khi nhận hàng' : 'Chuyển khoản ngân hàng'}}
                                                                                            </td>
                                                                                        </tr>
                                                                                        
                                                                                        <tr>
                                                                                            <th scope="row" colspan="2"
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                Tổng cộng:</th>
                                                                                            <td
                                                                                                style="color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left">
                                                                                                <span style="color: red; font-w">{{ number_format($total, '0', ',', '.')}}<span>₫</span></span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        
                                                                                    </tfoot>
                                                                                </table>
                                                                            </div>


                                                                            <table id="m_584358752881652500addresses"
                                                                                cellspacing="0" cellpadding="0"
                                                                                border="0"
                                                                                style="width:100%;vertical-align:top;margin-bottom:40px;padding:0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td valign="top" width="50%"
                                                                                            style="text-align:left;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;border:0;padding:0">
                                                                                            <h2
                                                                                                style="color:#96588a;display:block;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left">
                                                                                                Địa chỉ thanh toán</h2>

                                                                                            <address
                                                                                                style="padding:12px;color:#636363;border:1px solid #e5e5e5">
                                                                                                {{$name}}
                                                                                                <br>
                                                                                                {{$address}}
                                                                                                <br><a
                                                                                                    href="tel:{{$phone}}"
                                                                                                    style="color:#96588a;font-weight:normal;text-decoration:underline"
                                                                                                    target="_blank">{{$phone}}</a>
                                                                                                <br><a
                                                                                                    href="mailto:{{$email}}"
                                                                                                    target="_blank">{{$email}}</a>
                                                                                            </address>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="yj6qo"></div>
        <div class="adL">
        </div>
    </div>
    <div class="adL">
    </div>
</div>
