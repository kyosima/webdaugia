<div class="campaign-box" id="campaign-box-{{$product->id}}">
    <div class="form" method="POST" action="{{url('admin/campaigns/postCampaign')}}">
        <div class="row h-100" style="margin:0px">
            <div class="col-md-4">
                <img src="{{getImage($product->avatar)}}" style="max-width:100px;max-height:100px" class="img-detail img img-thumbnail">
            </div>
            <div class="col-md-8">
               
                <button type="button" class="btn btn-danger remvovecp" onclick="removeInCampaign(this)" data-value="{{$product->id}}">X</button>
                <div class="campaign-info">
                    <h3>{{$product->title}}</h3>
                    <input type="hidden" name="campaign_detail_id" value="{{$detail->id}}"/>
                    <input type="hidden" name="campaign_id" value="{{$campaign_id}}"/>
                    <label>ID sản phẩm</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                    <input readonly="" type="text" id="id" name="product_id" value="{{$product->id}}" class="form-control id" placeholder="Input ID"></div>
                    <div class="input-group">
                        <label>Giá khỏi điểm</label>
                        <div class="input-group">
                            <span class="input-group-addon">đ</span>
                            <input style="width: 120px; text-align: right;" type="number" min='0' id="" name="detail_price_start" value="{{$detail->detail_price_start}}" class="form-control " >
                        </div>
                    </div> 
                    <div class="input-group">
                        <label>Bước nhảy</label>
                        <div class="input-group">
                            <span class="input-group-addon">đ</span>
                            <input style="width: 120px; text-align: right;" type="number" min='0' id="" name="detail_price_step" value="{{$detail->detail_price_step}}" class="form-control " >
                        </div>
                    </div> 
                    <div class="form-group text-center">
                        <div class="notice-k">
                            <p></p>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="postCampaign(this)" data-value="{{$product->id}}">Cập nhật</button>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<script>
     function removeInCampaign(e){
        removeCampaignDetail(e);
  }


  function removeCampaignDetail(e){
    var r = confirm('Bạn chắc chắn muốn xóa sản phẩm này ra khỏi chiến dịch');
        if (r == true) {
            id = $('#campaign-box-'+$(e).data('value') + ' input[name="campaign_detail_id"]').val();
            $('#campaign-box-'+$(e).data('value')).remove();
            $('.label__selected[data-value='+$(e).data('value')+']').remove();
            $('.label_option[data-value='+$(e).data('value')+']').removeClass('select-disable');
            $.ajax({
                url: '{{url("admin/campaigns/remove/")}}'+'/'+id,
                type: 'GET',
                data: {},
                success: function (response) {
                  console.log('Remove successfully');
                    // $('#show_campaign').append(response);
                },
                error: function (data) {
                  console.log(data);
                }
            }); 
        }
    }
  
     function postCampaign(e) {
        id = $(e).data('value');
        var url = $('#campaign-box-'+id +' .form').attr('action');

        var form = $(
            '<form action="' + url + '" method="post">' +
            '<input name="campaign_detail_id" value="' + $('#campaign-box-'+id +' .form input[name=campaign_detail_id]').val() + '">' +
            '<input name="detail_price_start" value="' + $('#campaign-box-'+id +' .form input[name=detail_price_start]').val() + '">' +
            '<input name="detail_price_step" value="' + $('#campaign-box-'+id +' .form input[name=detail_price_step]').val() + '">' +

            '</form>'
        );
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
        });
      $.ajax({
            type: "POST",
            url: url,
            data: form.serialize(), 
            error: function(data){
              console.log(data);
            },
            success: function(data)
            {
                console.log(data);
                $('#campaign-box-'+id +' .notice-k p').text('Cập nhật thành công');
            }
          });


    }


    
</script>