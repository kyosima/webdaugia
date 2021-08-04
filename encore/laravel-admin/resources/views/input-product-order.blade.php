
<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">
    <label for="{{$id}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>
    @include('admin::form.error')
    {{-- <input type="hidden" class="form-control" id="{{$id}}" name="{{$name}}" placeholder="{{ $placeholder }}"  value="{{ URL('/').$value }}"> --}}
    @include('admin::form.help-block')
    <p><strong>Để tiếp tục thêm sản phẩm, vui lòng tick "Continue editing" & nhấn Submit</strong></p>
</div>
