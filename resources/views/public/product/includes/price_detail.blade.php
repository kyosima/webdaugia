<div class="product__warraper">
    <p class="product__details__price">
        <span class="n__price">{{getCurrency($item->price  - round($item->price*$item->discount/100))}}</span>
        @if ($item->discount != 0)
         - <span class="o__price">{{getCurrency($item->price)}}</span>
        @endif
    </p>
</div>