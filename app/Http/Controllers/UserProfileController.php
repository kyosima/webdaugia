<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserProfileController extends Controller
{
    //

    public function index(){
        $user_info = auth()->user()->user_info()->first();
        return view('public.user.profile', compact(['user_info']));
    }

    public function putChangeProfile(Request $request){
        $this->validate($request, [
            'in_name' => 'required|string|max:255',
            'in_address' => 'required|string|max:255',
            'in_birthday' => ['required', 'date'],
            'sel_gender' => ['max:1', 'min:0'], 
        ]);
        auth()->user()->user_info()->first()->update([
            'fullname' => $request->in_name, 
            'address' => $request->in_address,
            'birthday' => $request->in_birthday,
            'gender' => $request->sel_gender,
            'updated_at' => Carbon::now()
        ]);
        Session::flash('success', 'Thay đổi thành công !');
        return back();
    }
    public function getChangePassword(){
        return view('public.user.changepassword');
    }
    
    public function putChangePassword(Request $request){
        $this->validate($request, [
            'in_oldpassword' => 'required',
            'in_password' => 'required',
	        'in_repassword' => 'required|same:in_password',
        ]);
        $user = User::find(auth()->user()->id);
    	if (Hash::check($request->in_oldpassword, $user->password)) {

            $hash_password = Hash::make($request->in_password);

            $user->password = $hash_password;

            $user->save();

            Session::flash('success', 'Bạn đổi mật khẩu thành công.');
            return back();
        }
        else{
        	Session::flash('error', 'Mật khẩu cũ không đúng.');
        	return back();
        }
    }
}
