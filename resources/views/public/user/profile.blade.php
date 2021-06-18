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
                    <div class="card-header text-center">Thông tin cá nhân</div>
                    <div class="card-body">
                        <form action="{{route('put.changeprofile')}}" method="post">
                            @method('PUT')
                            @csrf
                            <div class="row">
                                <div class="form-group col-lg-4">
                                    <label for="email">Họ và tên:</label>
                                    <input type="text" class="form-control" name="in_name" value="{{$user_info->fullname}}" placeholder="Họ và tên của bạn" required>
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="in_email" value="{{Auth::user()->email}}" placeholder="Địa chỉ email của bạn" readonly>
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="email">Số điện thoại:</label>
                                    <input type="text" name="in_phone" class="form-control" placeholder="Nhập số điện thoại" value="{{$user_info->phone}}" readonly >
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="email">Địa chỉ:</label>
                                    <input type="text" name="in_address" class="form-control" placeholder="Địa chỉ" value="{{$user_info->address}}" required >
                                </div>
                                <div class="col-lg-4">
                                    <label for="in_birthday">ngày sinh:</label>
                                    <input type="date" class="form-control" name="in_birthday" min="1900-01-01" max="2022-01-01" value="{{date('Y-m-d',strtotime($user_info->birthday))}}" required>
                                </div>
                                <div class="col-lg-4">
                                    <label for="email">Giới tính:</label>
                                    <select name="sel_gender" class="form-control" required>
                                        <option value="1">Nam</option>
                                        <option @if($user_info->gender == 0) selected="selected" @endif value="0">Nữ</option>
                                    </select>
                                </div>
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