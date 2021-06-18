<div class="card profile_sidebar d-none d-md-block">
    <div class="card-header">Xin chào, {{Auth::user()->name}}</div>
    <div class="card-body">
        <ul>
            <li><a href="{{URL::to('trang-ca-nhan')}}"><i class="fa fa-address-card-o"></i> Thông tin</a>
            <li><a href="#"><i class="fa fa-list-alt"></i> Đơn hàng</a>
            <li><a href="#"><i class="fa fa-hourglass-half"></i> Đấu giá</a>
            <li><a href="#"><i class="fa fa-heart-o"></i> Yêu thích</a>
            <li><a href="{{URL::to('doi-mat-khau')}}"><i class="fa fa-key"></i> Đổi mật khẩu</a>
            
        </ul>
    </div>
    <div class="card-footer">
        <a href="{{URL::to('/thoat-tai-khoan')}}"><i class="fa fa-sign-out"></i> Thoát tài khoản</a>
    </div>
</div>