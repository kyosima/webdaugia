@php
use App\Models\User;
use App\Models\Type_card;
@endphp

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{env('APP_NAME')}}</title>
    <style>
        p{
            font-size:18px;
        }
    </style>
</head>
<body>
    <h1 style="text-align:center">Yêu cầu lấy lại mật khẩu</h1>
    <p>Xin chào, <strong>{{$send->name}}</strong></p>
    <p>Bạn hoặc ai đó đã yêu cầu lấy lại mật khẩu từ {{env('APP_NAME')}}</p>
    <p>Vui lòng <a href="{{$send->url}}">click vào đây</a> để lấy mật khẩu mới</p>
    <p>Hoặc copy đường dẫn sau vào trình duyệt của bạn : <a href="{{$send->url}}" target="_blank">{{$send->url}}</a></p>  
</body>
</html>