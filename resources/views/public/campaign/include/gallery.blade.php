<div class="fotorama" data-arrows="true" data-click="true" data-nav="thumbs" data-width="100%" data-ratio="800/600">
    <img src="{{getImage($product->avatar)}}" >
    @foreach (explode(',',$product->gallery) as $image)                       
        <img src="{{getImage($image)}}">
    @endforeach
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

