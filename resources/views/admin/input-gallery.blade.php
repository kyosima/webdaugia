<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">
    <label for="{{$id}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>
    @include('admin::form.error')
    <input type="hidden" class="form-control" id="{{$id}}" name="{{$name}}" placeholder="{{ $placeholder }}"  value="{{ old($column, $value) }}">
    @include('admin::form.help-block')
</div>

<div class="{{$viewClass['field']}}">
    <div id="preview_gallery" class="row">
        
    </div>
    <button type="button" class="btn btn-primary add_picture" data-type="MULTIPLE" data-input="#{{$id}}" data-preview="#preview_gallery">Thêm thư viện hình ảnh</button>
    
</div>