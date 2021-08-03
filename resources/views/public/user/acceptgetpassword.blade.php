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
                        <form action="{{route('put.getAcceptPassword')}}" method="post">
                        @method('PUT')
                        @csrf
                            <div class="form-group">
                                <label for="in_name">Email:</label>
                                <input type="email" class="form-control" name="in_email" placeholder="Email của bạn" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Mật khẩu:</label>
                                <input type="password" class="form-control" placeholder="Mật khẩu" name="in_password" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Xác nhận mật khẩu:</label>
                                <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="in_repassword" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</section>


@endsection