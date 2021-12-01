<div class="col-lg-4 col-md-4 col-sm-6 mix oranges fresh-meat">
    <div class="featured__item">
        <div class="featured__item__pic set-bg" data-setbg="{{getImage($item->avatar)}}">
            {{-- <ul class="featured__item__pic__hover">
                <li><a href="#"><i class="fa fa-heart"></i></a></li>
            </ul> --}}
        </div>
        <div class="featured__item__text">
            <h5><a href="{{url('dau-gia/'.$item->slug)}}">{{$item->title}}</a></h5>
            <h6>Số sản phẩm đấu giá: {{countProductCampaign($item->id)}}</h6>
            <div class="d-flex mt-2">
                <span class="d-flex align-items-center">
                    <i class="fa fa-clock-o"></i> 
                    <div id="clock-c" class=""> Bắt đầu: {{date('d/m/Y H:i:s',strtotime($item->time_start))}}</div>
                </span>
            </div>
            <div class="d-flex mt-2">
                <span class="d-flex align-items-center">
                    <i class="fa fa-clock-o"></i> 
                    <div id="clock-c" class=""> Thời gian diễn ra: {{ date('H:i', mktime(0,countProductCampaign($item->id) * $item->time_range))}}</div>
                </span>
            </div>
            <div class="text-center mt-3">
                <a class="btn btn-danger mx-auto" href="{{url('dau-gia/'.$item->slug)}}">Chi tiết</a>
            </div>
        </div>
    </div>
</div>