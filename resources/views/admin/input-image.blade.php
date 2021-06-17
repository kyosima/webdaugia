
<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">
    <label for="{{$id}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>
    @include('admin::form.error')
    <input type="hidden" class="form-control" id="{{$id}}" name="{{$name}}" placeholder="{{ $placeholder }}"  value="{{ URL('/').$value }}">
    @include('admin::form.help-block')
    <div class="{{$viewClass['field']}}">
        <a type="button" data-input="#{{$id}}" {!! $attributes !!} data-type="" data-preview="#add_avatar"  class="add_picture" style="width: 100%">
            <img id="add_avatar" src="{{ URL('/').$value }}" alt="" style="width: 100%">
        </a>
    </div>
</div>
