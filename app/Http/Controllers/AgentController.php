<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class AgentController extends Controller
{
    //
    public function index(){
        $agent = DB::table('users')->select('users.email as email', 'users_info.fullname as fullname', 'users_info.phone as phone', 'users_info.address as address')
        ->join('users_info', 'users.id', '=', 'users_info.user_id')
        ->where('users.type', 2)
        ->get();
        return view('public.page.agent', compact('agent'));
    }
}
