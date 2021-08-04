<div class="blockUI"></div>
<table class="order_items" style="width: 100%; background: #fff; position: relative;">
    <thead>
        <tr>
            <th class="order-item">Sản phẩm</th>
            <th class="cost">Giá bán</th>
            <th class="qty">Số lượng</th>
            <th class="total">Tổng</th>
            <th width="1%"></th>
        </tr>
    </thead>
    <tbody id="order_line_items">
        @foreach ($bill->bill_detail as $product)
        <input type="hidden" name="order_item_id[]" value="{{$product->id}}">
            <tr class="order-item" data-order_item_id="{{$product->id}}">
                <td class="thumb">
                    <div class="order-item-thumbnail">
                        <img src="{{ $product->avatar }}" alt="{{ $product->title }}"
                            width="100" height="100">
                        {{ $product->title }}
                    </div>
                </td>
                <td class="cost">
                    <div class="view">
                        {{ number_format($product->getOriginal('pivot_end_price'), 0, ',', '.') . 'đ'}}
                    </div>

                    <div class="edit" style="display: none;">
                        <input type="text" name="order_item_price[{{$product->id}}]" placeholder="0" value="{{ $product->getOriginal('pivot_end_price') }}"
                            class="line_total wc_input_price">
                    </div>
                </td>
                <td class="qty">
                    <div class="view">
                        x {{ $product->getOriginal('pivot_SL') }}
                    </div>
                    <div class="edit" style="display: none;">
                        <input type="number" step="1" min="0" autocomplete="off"
                            name="order_item_qty[{{$product->id}}]" placeholder="0" value="{{ $product->getOriginal('pivot_SL') }}" data-qty="1" size="4"
                            class="quantity">
                    </div>
                </td>
                <td class="total">
                        {{ number_format($product->getOriginal('pivot_end_price')*$product->getOriginal('pivot_SL'), 0, ',', '.') . 'đ'}}
                </td>
                <td>
                    @if ($bill->bill_status == 0)
                        <div class="order-edit-line-item-actions">
                            <a class="edit-order-item tips"></a>
                            <a class="delete-order-item tips"></a>
                        </div>
                    @endif
                </td>
            </tr>
        @endforeach

    </tbody>
</table>