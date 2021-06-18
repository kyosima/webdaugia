@extends('public.layout')
@section('content')

<section class="sec_login">
    <div class="container">
        <div class="row justify-content-center">
        <div class="col-lg-12">
                <x-alert />
            </div>
            <div class="col-lg-4">
            <div class="card">
                <div class="card-header text-center">Lấy lại mật khẩu</div>
                <div class="card-body">
                <form action="{{route('post.sendRequireGetPassword')}}" method="post">
                @csrf
                    <div class="form-group">
                        <label for="email">Vui lòng nhập email:</label>
                        <input type="text" class="form-control" name="in_email" placeholder="Địa chỉ email của quý khách" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                </form>
                </div>
                <div class="card-header text-center">
                    <span>Quý khách chưa có tài khoản vui lòng</span>
                    <a href="{{URL::to('/lien-he')}}">Liên hệ</a>
                </div>
            </div>
            </div>
        </div>
    </div>
    
</section>

@endsection