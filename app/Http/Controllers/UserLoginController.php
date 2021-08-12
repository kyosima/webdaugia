<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use App\Models\User;


class UserLoginController extends Controller
{
    //

    public function index(){
        if(!Auth::check()){
            return view('public.user.login');
        }
        return redirect('/');
    }

    public function postLogin(Request $request){
        // dd($request);
        if (Auth::attempt(['name' => $request->in_name, 'password' => $request->in_password])) {
            return redirect('/');
        }
        Session::flash('error', 'Sai tài khoản hoặc mật khẩu!');
        return back();
    }

    public function getLogout(){
        Auth::logout();
        return redirect('/');
    }

}
