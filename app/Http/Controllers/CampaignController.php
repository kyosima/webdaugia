<?php

namespace App\Http\Controllers;
use App\Models\Campaign;
use App\Models\CampaignDetail;
use Carbon\Carbon;


use Illuminate\Http\Request;

class CampaignController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $campaigns_coming = Campaign::whereStatus(0)->orderBy( 'id','asc')->get();
        $campaigns_run = Campaign::whereStatus(1)->orderBy( 'id','asc')->get();
        $campaigns_end = Campaign::whereStatus(2)->orderBy( 'id','asc')->get();

        return view('public.campaign.campaign',['campaigns_coming'=>$campaigns_coming, 'campaigns_run'=>$campaigns_run, 'campaigns_end'=>$campaigns_end]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        //
        $campaign = Campaign::whereSlug($slug)->first();    
        $now = Carbon::now();
        $details = CampaignDetail::whereCampaignId($campaign->id)->orderBy( 'id','asc')->get();
        $time_run = $campaign->time_range + count($details)-1;
        if(strtotime($campaign->time_start) <= strtotime($now) && (strtotime($now) <= strtotime($campaign->time_start.'+'.$time_run.'minute'))){
            Campaign::whereId($campaign->id)->update(['status' =>1]);
        }elseif((strtotime($now) > strtotime($campaign->time_start.'+'.$time_run.'minute'))){
            Campaign::whereId($campaign->id)->update(['status' =>2]);

        }
        for($i=0; $i<count($details); $i++){
            if((strtotime($campaign->time_start.'+'.($campaign->time_range +$i).'minute') >= strtotime($now))&&(strtotime($now) >= strtotime($campaign->time_start.'+'.$i.'minute'))){
                CampaignDetail::whereId($details[$i]->id)->update(['status'=>1]);
            }elseif(strtotime($campaign->time_start.'+'.($campaign->time_range +$i).'minute') < strtotime($now)){
                CampaignDetail::whereId($details[$i]->id)->update(['status'=>2]);
            }
        }
        return view('public.campaign.detail', ['campaign'=>$campaign]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function startCampaign(Request $request){
        $id = $request->id;
        Campaign::whereId($id)->update(['status' =>1]);
        $detail = CampaignDetail::whereCampaignId($id)->orderBy( 'id','asc')->first();
        CampaignDetail::whereId($detail->id)->update(['status'=>1]);

        return 'Start campaign successfully';
    }
    public function startDetail(Request $request){
        $id = $request->id;
        CampaignDetail::whereId($id)->update(['status'=>1]);
        return 'Start details successfully';
    }
    public function stopDetail(Request $request){
        $id = $request->id;
        CampaignDetail::whereId($id)->update(['status'=>2]);
        return 'Stop details successfully';
    }
}
