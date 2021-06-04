
<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">
    <label for="{{$id}}" class="col-sm-2 control-label">{{$label}}</label>
    @include('admin::form.error')
    <input type="hidden" class="form-control" id="{{$id}}" name="{{$name}}" placeholder="{{ $placeholder }}"  value="{{ old($column, $value) }}">
    @include('admin::form.help-block')
    <div class="col-xs-12 col-sm-4">
        <a type="button" data-input="#{{$id}}" {!! $attributes !!} data-preview="#add_avatar"  class="add_picture" style="width: 100%">
            <img id="add_avatar" src="{{ old($column, $value) }}" alt="" style="width: 100%">
        </a>
    </div>
</div>
