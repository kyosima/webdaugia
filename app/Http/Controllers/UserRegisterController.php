<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\userInfo;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;

class UserRegisterController extends Controller
{
    //
    public function index(){
        return view('public.user.register');
    }

    public function postRegister(Request $request){
        $this->validate($request, [
            'in_name' => ['required', 'string', 'max:255'],
            'in_email' => ['required', 'email','unique:users,email', 'max:255'],
            'in_phone' => ['required', 'regex:/((09|03|07|08|05)+([0-9]{8})\b)/'],
            'in_birthday' => ['required', 'date'],
            'sel_gender' => ['max:1', 'min:0'], 
            'in_password' => 'required',
	        'in_repassword' => 'required|same:in_repassword',
        ]);
        $user = User::create([
            'name' => $request->in_email,
            'email' => $request->in_email,
            'password' => bcrypt($request->in_password),
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
        $user->user_info()->create([
            'fullname' => $request->in_name,
            'phone' => $request->in_phone,
            'birthday' => $request->in_birthday,
            'gender' => $request->sel_gender,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);

        Session::flash('success', 'Bạn đã tạo tài khoản thành công');
        return redirect('/dang-nhap');
    }
}
