@extends('public.layout')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__option">
                            <a href="{{URL::to('/')}}">Trang chủ</a>
                            
                            <a href="{{URL::to('dau-gia/')}}">Đấu giá</a>
                            <span>{{$campaign->title}}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="product__details__text">
                                <h3 class="product__detail__title">{{$campaign->title}}</h3>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-xs-12">
                                        @if($campaign->status == 0)
                                            <div class="col-lg-12">
                                                <div id="campaign-counter-title" class="">
                                                    <h4>Thời gian đến khi mở đấu giá còn</h4>
                                                </div>
                                                <div class="campaign__count_time_run">
                                                    <div id="campaign-counter" data-url="{{url('dau-gia/bat-dau/'.$campaign->id)}}">
                                                        <div id="timer">
                                                            <div class="number-list">
                                                            <div class="item day">00</div>
                                                            <div class="item hour">00</div>
                                                            <div class="item minute">00</div>
                                                            <div class="item second">00</div>
                                                            </div>
                                                            <div class="unit-list">
                                                            <div class="item">Day</div>
                                                            <div class="item">Hour</div>
                                                            <div class="item">Minutes</div>
                                                            <div class="item">Seconds</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                countStart('{{$campaign->time_start}}','{{count($campaign->campaign_details()->get())}}', {{$campaign->time_range}});
                                            </script>
                                        @elseif($campaign->status == 1)
                                            <div class="col-lg-12">
                                                <div id="campaign-counter-title" class="">
                                                    <h4>Thời gian đã đấu giá</h4>
                                                </div>
                                                <div class="campaign__count_time_run">
                                                    <div id="campaign-counter" data-url="{{url('dau-gia/bat-dau/'.$campaign->id)}}">
                                                        <div id="timer">
                                                            <div class="number-list">
                                                            <div class="item day">00</div>
                                                            <div class="item hour">00</div>
                                                            <div class="item minute">00</div>
                                                            <div class="item second">00</div>
                                                            </div>
                                                            <div class="unit-list">
                                                            <div class="item">Day</div>
                                                            <div class="item">Hour</div>
                                                            <div class="item">Minutes</div>
                                                            <div class="item">Seconds</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                countRun('{{$campaign->time_start}}','{{$campaign->campaign_details()->get()}}');
                                            </script>
                                        @else
                                            <div class="alert alert-success text-center ">
                                                <h5 class="text-dark">Chiến dịch đấu giá đã kết thúc</h5>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="campaign-time-start">
                                    <div id="clock-c" class=" text-white"><span class="text-danger">Thời gian bắt đầu:</span> {{date('d/m/Y H:i:s',strtotime($campaign->time_start))}}</div>
                                </div>
                                <div class="product__details__tab__desc">
                                    {!!$campaign->description!!}
                                </div>
                                
                                {{-- <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a> --}}
                                <ul>
                                    {{-- <li><b>Danh mục</b> <span>{{$product->category->title}}</span></li> --}}
                                    <li><b>Chia sẻ</b>
                                        <div class="share">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-instagram"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
                <div class="col-lg-8 col-md-8">
                    <div class="list-detail">
                            <div class="search-detail">
                                <label class="text-light">Tìm kiếm sản phẩm</label>
                                <input id="filter" class="form-control" placeholder="Nhập tên sản phẩm..." type="text">
                            </div>
                            <div id="campaign-detail">
                                @for($i=0; $i< count($details = $campaign->campaign_details()->get()); $i++)
                                    @include('public.campaign.include.campaign_detail_grid', ['duration'=>$campaign->time_range,'order'=>$i, 'total'=>count($details) ,'item'=>$details[$i], 'product'=>$details[$i]->product()->first()])
                                @endfor
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
  <!-- Modal -->
  <div id="detail-media" class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        {{-- <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div> --}}
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-light" data-dismiss="modal">Đóng</button>
          {{-- <button type="button" class="btn btn-primary">Save changes</button> --}}
        </div>
      </div>
    </div>
  </div>
    <script>

        $("#filter").keyup(function() {
            // Retrieve the input field text and reset the count to zero
            var filter = $(this).val(),
              count = 0;
        
            // Loop through the comment list
            $('#campaign-detail section').each(function() {
        
        
              // If the list item does not contain the text phrase fade it out
              if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                $(this).hide();  // MY CHANGE
        
                // Show the list item if the phrase matches and increase the count by 1
              } else {
                $(this).show(); // MY CHANGE
                count++;
              }
        
            });
        
        });
          
        </script>
@endsection
