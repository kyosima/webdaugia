    <div class="col-sm-6">
        @if ($bill->bill_coupon)
            <ul class="coupon-list">
                <li>
                    <strong>Mã ưu đãi</strong>
                </li>
                <li class="code">{{ $bill->bill_coupon }}</li>
            </ul>
        @endif
    </div>
    <div class="col-sm-6">
        <table class="order-total" style="text-align: right; width: 100%;">
            @if ($bill->bill_coupon)
                <tbody>
                    <tr>
                        <td>Tạm tính:</td>
                        <td class="bill-subtotal">
                            <span class="amount">{{ number_format($bill->bill_subtotal, 0, ',', '.') . 'đ' }}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Giảm giá:</td>
                        <td class="bill-promo">
                            <span class="amount">-{{ number_format($bill->bill_promo, 0, ',', '.') . 'đ' }}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Thành tiền:</td>
                        <td class="bill-total">
                            <span class="amount">{{ number_format($bill->bill_total, 0, ',', '.') . 'đ' }}</span>
                        </td>
                    </tr>
                </tbody>
            @else
                <tbody>
                    <tr>
                        <td>Tạm tính:</td>
                        <td class="bill-subtotal">
                            <span class="amount">{{ number_format($bill->bill_total, 0, ',', '.') . 'đ' }}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Thành tiền:</td>
                        <td class="bill-total">
                            <span class="amount">{{ number_format($bill->bill_total, 0, ',', '.') . 'đ' }}</span>
                        </td>
                    </tr>
                </tbody>
            @endif

        </table>
    </div>
