<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">
    <label for="{{$id}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>
    @include('admin::form.error')
    <input type="hidden" class="form-control" id="{{$id}}" name="{{$name}}" placeholder="{{ $placeholder }}"  value="{{ $value }}">
    @include('admin::form.help-block')
</div>

<div class="">
    <div id="preview_gallery" class="row">
    @php
        $string = Str::of($value)->rtrim(',');
        $string = Str::of($string)->explode(',');
    @endphp
        @foreach($string as $url)
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 mt-3">
                <span data-id="1" data-url="{{$url}}" class="delete_gallery"><i class="fas fa-times"></i></span>
                <img src="{{asset($url)}}">
            </div>
        @endforeach
    @foreach($string as $url)
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 mt-3">
            <span data-id="1" data-url="{{$url}}" class="delete_gallery"><i class="fas fa-times"></i></span>
            <img src="{{asset($url)}}">
        </div>
    @endforeach
    
    </div>
    <div class="text-center" style="margin: 30px 0px">
    <button type="button" class="btn btn-primary add_picture" data-type="MULTIPLE" data-input="#{{$id}}" data-preview="#preview_gallery">Thêm thư viện hình ảnh</button>
    </div> 
</div>