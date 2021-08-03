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
                <div class="card-header text-center">Đăng ký đại lý</div>
                <div class="card-body">
                    <form action="{{route('post.register')}}" method="post">
                        @csrf
                        <div class="form-group">
                            <label for="email">Họ và tên:</label>
                            <input type="text" class="form-control" name="in_name" value="{{old('in_name')}}" placeholder="Họ và tên của bạn" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" name="in_email" value="{{old('in_email')}}" placeholder="Địa chỉ email của bạn" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Số điện thoại:</label>
                            <input type="text" name="in_phone" class="form-control" placeholder="Nhập số điện thoại" value="{{old('in_phone')}}" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" required >
                        </div>
                        <div class="form-row mb-3">
                            <div class="col">
                                <label for="in_birthday">ngày sinh:</label>
                                <input type="date" class="form-control" name="in_birthday" min="1900-01-01" max="2020-01-01" value="{{old('in_birthday')}}" required>
                            </div>
                            <div class="col">
                                <label for="email">Giới tính:</label>
                                <select name="sel_gender" class="form-control" required>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Mật khẩu:</label>
                            <input type="password" class="form-control" placeholder="Mật khẩu" name="in_password" required>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Xác nhận mật khẩu:</label>
                            <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="in_repassword" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng ký</button>
                    </form>
                </div>
                <div class="card-header text-center">
                    <span>Quý khách đã có tài khoản </span>
                    <a href="{{URL::to('/dang-nhap')}}">Đăng nhập ngay?</a>
                </div>
            </div>
            </div>
        </div>
    </div>
    
</section>


@endsection