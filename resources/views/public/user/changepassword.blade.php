@extends('public.layout')
@section('content')

<section class="sec_profile">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <x-alert />
            </div>
            <div class="col-lg-3">
                @include('public.user.sidebar')
            </div>
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header text-center">Đổi mật khẩu</div>
                    <div class="card-body">
                        <form action="{{route('put.changepassword')}}" method="post">
                            @method('PUT')
                            @csrf
                            <div class="form-group">
                                <label for="pwd">Mật khẩu cũ:</label>
                                <input type="password" class="form-control" placeholder="Mật khẩu cũ" name="in_oldpassword" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Mật khẩu mới:</label>
                                <input type="password" class="form-control" placeholder="Mật khẩu" name="in_password" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Xác nhận mật khẩu:</label>
                                <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="in_repassword" required>
                            </div>
                           
                            <button type="submit" class="btn btn-ocean">Thay đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</section>


@endsection