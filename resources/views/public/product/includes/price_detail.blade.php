<div class="product__warraper">
    <p class="product__details__price">
        <span class="n__price">@money($item->product_price  - round($item->product_price*$item->product_discount/100))</span> -
        @if ($item->product_discount != 0)
            <span class="o__price">@money($item->product_price)</span>
        @endif
    </p>
</div>