<?php

namespace App\Http\Controllers;
use App\Models\Campaign;
use App\Models\Product;
use App\Models\CampaignDetail;
use App\Models\CampaignAuction;
use App\Models\CampaignWishlist;
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
    
        $this->checkCampaign($campaign);
       
        $campaign = Campaign::whereSlug($slug)->first();    
        return view('public.campaign.campaign', ['campaign'=>$campaign]);
    }

    public function getCampaignProductDetail($slug1, $slug2)
    {
    
        $campaign = Campaign::whereSlug($slug1)->firstOrFail();
        $product = Product::whereSlug($slug2)->firstOrFail();
        $this->checkCampaign($campaign);

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
        CampaignWishlist::whereCampaignDetailId($request->id)->delete();
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
        for($i=0; $i<count($details); $i++){
            $this->checkCampaignDetail($details[$i], $campaign, $i);
        }
    }
    
    public function checkCampaignDetail($detail, $campaign, $i){
        $now = Carbon::now();
        if($detail->status != 2){
            if((strtotime($campaign->time_start.'+'.($campaign->time_range +$i).'minute') >= strtotime($now))&&(strtotime($now) >= strtotime($campaign->time_start.'+'.$i.'minute'))){
                CampaignDetail::whereId($detail->id)->update(['status'=>1]);
            }elseif(strtotime($campaign->time_start.'+'.($campaign->time_range +$i).'minute') < strtotime($now)){
                CampaignDetail::whereId($detail->id)->update(['status'=>2]);
                CampaignWishlist::whereCampaignDetailId($detail->id)->get();

            }
        }
    }

    public function postAuction(Request $request){
        if(!Auth::check()){
            return false;
        }else{
            $user = Auth::user();
            $amount = $_POST['amount'];
            $detail_id = $_POST['detail_id'];
            $campaign_detail = CampaignDetail::find($detail_id);
            if($campaign_detail->status !=1){
                return 'Sản phẩm đã kết thúc đấu giá';
            }elseif($amount <= $campaign_detail->detail_price_start){
                return 'Giá bạn đưa ra phải lớn hơn giá khởi điểm';
            }elseif($amount <= $campaign_detail->price_end){
                return 'Giá bạn đưa ra phải lớn hơn giá hiện tại';
            }elseif(($amount % $campaign_detail->detail_price_step) != 0){
                return 'Giá bạn đưa ra phải theo giá bước nhảy';
            }else{
                CampaignAuction::insert(['user_id' => $user->id, 'campaign_detail_id' => $detail_id, 'price'=>$amount]);
                CampaignDetail::whereId($detail_id)->update(['price_end'=>$amount, 'user_id'=>$user->id]);
                $id = $request->id;
                $auction = CampaignAuction::whereCampaignDetailId($detail_id)->orderBy('id','desc')->first();
                event(new CampaignEvent( $auction));
                return 'Đấu giá của bạn đã được gửi đi';
            }
        }
    }

    public function getAuction(Request $request){
        $auction = CampaignAuction::whereCampaignDetailId($request->id)->orderBy('desc', 'id')->first();
        return $aution;
    }

    public function addWishList(Request $request){
        if(!Auth::check()){
            return redirect('/dang-nhap');
        }else{
            $user = Auth::user();
            $checkWishList = CampaignWishlist::whereUserId($user->id)->whereCampaignDetailId($request->id)->first();
            $detail = CampaignDetail::whereId($request->id)->first();
            $product= $detail->product()->first();
            if($checkWishList == null){
                CampaignWishlist::insert(['user_id'=>$user->id, 'campaign_detail_id'=>$request->id]);
                return 'Đã thêm sản phẩm '.$product->title.' vào danh sách đấu giá';
            }else{
                CampaignWishlist::whereId($checkWishList->id)->delete();
                return 'Đã xóa sản phẩm '.$product->title.' khỏi danh sách đấu giá';
            }
        }
    }

    public function getHistory(){
        $user = Auth::user();
        $campaign_detail_win = CampaignDetail::whereUserId($user->id)->whereStatus(2)->latest()->paginate(10);
        return view('public.campaign.history', ['campaign_detail_win'=>$campaign_detail_win]); 
    }

    public function getWishlist(){
        $user = Auth::user();
        $campaign_detail_wishlist = CampaignWishlist::whereUserId($user->id)->latest()->paginate(10);
        return view('public.campaign.wishlist', ['campaign_detail_wishlist'=>$campaign_detail_wishlist]); 
    }

}
