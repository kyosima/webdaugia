<?php

namespace App\Http\Controllers;
use App\Events\CampaignEvent;
use Illuminate\Http\Request;
use App\Models\Campaign;
use App\Models\CampaignDetail;

class PusherController extends Controller
{
    //
    public function startCampaign(Request $request){
        $id = $request->id;
        event(new CampaignEvent('sss'));
        // Campaign::whereId($id)->update([
        //     'status'=>1
        // ]);
        return 'success';
    }
}
