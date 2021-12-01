<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Notice;
use Illuminate\Support\Facades\Auth;

class NoticeController extends Controller
{
    //

    function getReadAll(){
        $user = Auth::user();
        Notice::whereUserId($user->id)->update(['is_readed'=>1]);
        return null;
    }

    function getUnRead(){
        $user = Auth::user();
        $notices = Notice::whereUserId($user->id)->latest()->get();
        $html = '';
        foreach($notices as $item){
            $html.=' <a href="'. url($item->link) .'">
            <li>'. $item->content .'
                <p class="text-right text-secondary">
                    <small>'. date('d/m/Y H:i:s', strtotime($item->created_at)) .'</small></p>
            </li>
        </a>
        <hr>';
        }
        $count = Notice::whereUserId($user->id)->whereIsReaded(0)->count();

        return response()->json([
            'html' => $html,
            'count'=>$count
        ], 200);
    }
}
