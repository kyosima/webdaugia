<?php

namespace App\Http\Controllers;
use App\Models\Campaign;
use App\Models\Product;
use App\Models\CampaignDetail;
use App\Models\CampaignAuction;
use Illuminate\Support\Facades\Auth;
use App\Events\CampaignEvent;

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
        $campaign_not_end = Campaign::whereIn('status', [0,1])->orderBy( 'id','asc')->get();
        foreach($campaign_not_end as $campaign){
            $this->checkCampaign($campaign);
        }
        $campaigns_coming = Campaign::whereStatus(0)->orderBy( 'id','asc')->get();
        $campaigns_run = Campaign::whereStatus(1)->orderBy( 'id','asc')->get();
        $campaigns_end = Campaign::whereStatus(2)->orderBy( 'id','asc')->get();
        
        return view('public.campaign.campaigns',['campaigns_coming'=>$campaigns_coming, 'campaigns_run'=>$campaigns_run, 'campaigns_end'=>$campaigns_end]);
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
        $this->checkCampaign($campaign);
        for($i=0; $i<count($details); $i++){
            if($details[$i]->status != 2){
                if((strtotime($campaign->time_start.'+'.($campaign->time_range +$i).'minute') >= strtotime($now))&&(strtotime($now) >= strtotime($campaign->time_start.'+'.$i.'minute'))){
                    CampaignDetail::whereId($details[$i]->id)->update(['status'=>1]);
                }elseif(strtotime($campaign->time_start.'+'.($campaign->time_range +$i).'minute') < strtotime($now)){
                    CampaignDetail::whereId($details[$i]->id)->update(['status'=>2]);
                }
            }
        }
        $campaign = Campaign::whereSlug($slug)->first();    
        return view('public.campaign.campaign', ['campaign'=>$campaign]);
    }

    public function getCampaignProductDetail($slug1, $slug2)
    {
    
        $campaign = Campaign::whereSlug($slug1)->firstOrFail();
        $product = Product::whereSlug($slug2)->firstOrFail();
        $details = CampaignDetail::whereCampaignId($campaign->id)->orderBy( 'id','asc')->get()->toArray();
        $detail = CampaignDetail::whereCampaignId($campaign->id)->whereProductId($product->id)->firstOrFail();
        $order = array_search($detail->id, array_column($details, 'id'));
        return view('public.campaign.campaign_detail', ['campaign'=>$campaign, 'details'=>$details,'order'=>$order, 'product'=>$product, 'detail'=>$detail]);

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

    public function checkCampaign($campaign){
        $now = Carbon::now();
        $details = CampaignDetail::whereCampaignId($campaign->id)->orderBy( 'id','asc')->get();

        $time_run = $campaign->time_range + count($details)-1;
        if($campaign->status != 2){
            if(strtotime($campaign->time_start) <= strtotime($now) && (strtotime($now) <= strtotime($campaign->time_start.'+'.$time_run.'minute'))){
                Campaign::whereId($campaign->id)->update(['status' =>1]);
            }elseif((strtotime($now) > strtotime($campaign->time_start.'+'.$time_run.'minute'))){
                Campaign::whereId($campaign->id)->update(['status' =>2]);
    
            }
        }
    }

    public function postAuction(Request $request){
        if(!Auth::check()){
            return redirect('/dang-nhap');
        }else{
            $user = Auth::user();
            $amount = $_POST['amount'];
            $detail_id = $_POST['detail_id'];
            $campaign_detail = CampaignDetail::find($detail_id);
            if(($amount% $campaign_detail->detail_price_step) != 0){
                return 'Giá bạn đưa ra phải theo giá bước nhảy';
            }elseif($amount > $campaign_detail->price_end){
                CampaignAuction::insert(['user_id' => $user->id, 'campaign_detail_id' => $detail_id, 'price'=>$amount]);
                CampaignDetail::whereId($detail_id)->update(['price_end'=>$amount, 'user_id'=>$user->id]);
                $id = $request->id;
                $auction = CampaignAuction::whereCampaignDetailId($detail_id)->orderBy('id','desc')->first();
                event(new CampaignEvent( $auction));
                return 'Đấu giá của bạn đã được gửi đi';
            }else{
                return 'Giá bạn đưa ra phải lớn hơn giá hiện tại';
            }
        }
    }

    public function getAuction(Request $request){
        $auction = CampaignAuction::whereCampaignDetailId($request->id)->orderBy('desc', 'id')->first();
        return $aution;
    }

}
