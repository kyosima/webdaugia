<div class="product__item__price">
    <span class="new__price">@money($item->price  - round($item->price*$item->discount/100))</span>
    @if ($item->discount != 0)
        <span class="old__price">@money($item->price)</span>
    @endif
</div>