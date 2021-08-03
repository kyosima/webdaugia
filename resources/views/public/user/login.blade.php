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
                <div class="card-header text-center">Đăng nhập</div>
                <div class="card-body">
                    <form action="{{route('post.login')}}" method="post">
                    @csrf
                        <div class="form-group">
                            <label for="in_name">Tên đăng nhập:</label>
                            <input type="text" class="form-control" name="in_name" placeholder="Tên đăng nhập" required>
                        </div>
                        <div class="form-group">
                            <label for="in_password">Password:</label>
                            <input type="password" class="form-control" name="in_password" placeholder="Enter password" required>
                        </div>
                        <div class="form-group text-right">
                            <a href="{{URL::to('gui-yeu-cau-lay-mat-khau')}}">Quên mật khẩu?</a>
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
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