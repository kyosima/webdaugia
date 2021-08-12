<div class="blockUI"></div>
<table class="order_items" style="width: 100%; background: #fff; position: relative;">
    <thead>
        <tr>
            <th class="order-item">Sản phẩm</th>
            <th class="auction">Chiến dịch</th>
            <th class="cost">Giá bán</th>
            <th class="qty">Số lượng</th>
            <th class="total">Tổng</th>
            <th width="1%"></th>
        </tr>
    </thead>
    <tbody id="order_line_items">
        @php
            $idProductAuctioned = DB::table('campaign_details')->where('user_id', $user->id)
                                                            ->where('status', 2)
                                                            ->where('is_ordered', 0)
                                                            ->get();
            $i = 0;
        @endphp

        @foreach ($idProductAuctioned as $id)
        @php 
            $product = DB::table('product')->where('id', $id->product_id)->first();
            $auction = DB::table('campaign')->where('id', $id->campaign_id)->first();
        @endphp
            <tr class="order-item" data-order_item_id="{{$product->id}}" data-order_campaign_id="{{$id->campaign_id}}">
                <input type="hidden" name="order_item_id[{{$i}}][campaign]" value="{{$id->campaign_id}}">
                <input type="hidden" name="order_item_id[{{$i}}][product_id]" value="{{$product->id}}">
                <td class="thumb">
                    <div class="order-item-thumbnail">
                        <img src="{{ $product->avatar }}" alt="{{ $product->title }}"
                            width="100" height="100">
                        {{ $product->title }}
                    </div>
                </td>
                <td class="auction-title">
                    {{ $auction->title }}
                </td>
                <td class="cost">
                    <div class="view">
                        {{ number_format($id->price_end, 0, ',', '.') . 'đ'}}
                    </div>

                    <div class="edit" style="display: none;">
                        {{-- <input type="text" name="order_item_price[{{$product->id}}]" placeholder="0" value="{{ $id->price_end }}"
                            class="line_total wc_input_price"> --}}
                        <input type="hidden" name="order_item_id[{{$i}}][price]" placeholder="0" value="{{ $id->price_end }}"
                        class="line_total wc_input_price">
                    </div>
                </td>
                <td class="qty">
                    <div class="view">
                        x 1
                    </div>
                    <div class="edit" style="display: none;">
                        {{-- <input type="number" step="1" min="0" autocomplete="off"
                            name="order_item_qty[{{$product->id}}]" placeholder="0" value="1" data-qty="1" size="4"
                            class="quantity"> --}}
                        <input type="hidden" step="1" min="0" autocomplete="off"
                        name="order_item_id[{{$i}}][qty]" placeholder="0" value="1" data-qty="1" size="4"
                        class="quantity">
                    </div>
                </td>
                <td class="total">
                        {{ number_format($id->price_end, 0, ',', '.') . 'đ'}}
                </td>
                <td>
                    <div class="order-edit-line-item-actions">
                        {{-- <a class="edit-order-item tips"></a> --}}
                        <a class="delete-order-item tips"></a>
                    </div>
                </td>
            </tr>
            @php $i++; @endphp
        @endforeach

    </tbody>
</table>