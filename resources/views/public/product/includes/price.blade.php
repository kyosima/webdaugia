<div class="product__item__price">
    <span class="new__price">{{getCurrency($item->price  - round($item->price*$item->discount/100))}}</span>
    @if ($item->discount != 0)
        <span class="old__price">{{getCurrency($item->price)}}</span>
    @else
        <span><br/></span>
    @endif
</div>