<div class="product__item__price">
    <span class="new__price">@money($item->product_price  - round($item->product_price*$item->product_discount/100))</span>
    @if ($item->product_discount != 0)
        <span class="old__price">@money($item->product_price)</span>
    @endif
</div>