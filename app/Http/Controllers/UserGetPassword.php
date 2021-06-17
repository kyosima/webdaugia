<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendGetPassword;

class UserGetPassword extends Controller
{
    //
    
    public function getPassword(){
        return view('public.user.sendgetpassword');
    }
    public function postSendRequireGetPassword(Request $request){
        if($user = User::where('email', $request->in_email)->first()){
            $url = URL::temporarySignedRoute('getAcceptPassword', now()->addMinutes(120));
            $send = [
                'name' => $user->name, 
                'url' => $url
            ];
            $request->session()->put('id_hash', md5($user->id));

            Mail::to($user->email)->send(new SendGetPassword((object)$send));
            
            Session::flash('success', 'Vui lòng kiểm tra email để có thể lấy lại mật khẩu!');
            return back();
        }
        Session::flash('error', 'Email này không tìm thấy !');
        return back();
    }
    public function getAcceptPassword(Request $request){
        if (! $request->hasValidSignature()) {
            return redirect('/');
        }
        return view('public.user.acceptgetpassword');
    }
    public function postAcceptGetPassword(Request $request){
        $this->validate($request, [
            'in_email' => ['required', 'email', 'max:255'],
            'in_password' => 'required',
	        'in_repassword' => 'required|same:in_password',
        ]);
        if($user = User::where('email', $request->in_email)->first()){
            if(md5($user->id) == $request->session()->get('id_hash')){
                $user->update([
                    'password' => bcrypt($request->in_password)
                ]);
                Session::flash('success', 'Bạn đã lấy lại mật khẩu thành công !');
                return redirect('/dang-nhap');
            }
            Session::flash('error', 'Yêu cầu không chính xác, vui lòng load lại trang!');
            return back();
        }
        Session::flash('error', 'Email không khớp với yêu cầu!');
        return back();
    }
}
