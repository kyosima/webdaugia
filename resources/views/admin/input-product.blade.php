
<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">
    <label for="{{$id}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>
<div class="{{$viewClass['field']}}">
    <span id="product-select">
    
      <div class="multi_select-area">
        <div class="area_selected">
          <i class="view-select fa fa-search"></i>
          
          @foreach(App\Models\CampaignDetail::whereCampaignId($value)->get() as $val)
            <?php $p = App\Models\Product::find($val->product_id)?>
            <span class="label__selected" data-value="{{$val->product_id}}">{{$p->title}}<i class="fa fa-times remove-select" data-value="{{$val->product_id}}"></i></span>
          @endforeach
        </div>
        <?php $details = App\Models\CampaignDetail::whereCampaignId($value)->pluck('product_id')->toArray();  ?>
        <div class="option_select">
              <input class="form-control" id="searchselect" type="text" placeholder="Tìm sản phẩm..">

              <table class="table" id="sltbdt">
                <tbody>
                  
                  @foreach(App\Models\Product::all() as $product)
                    <tr class="label_option @if(in_array($product->id,$details)) select-disable @endif" data-value="{{$product->id}}">
                      <td>{{$product->title}}</td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
     
        </div>
      </div>
    </span>
    <div id="show_campaign" class="form-group">
      @foreach(App\Models\CampaignDetail::whereCampaignId($value)->get() as $val)
        <?php $p = App\Models\Product::find($val->product_id)?>
        @include('admin.campaign_detail',['product'=>$p, 'campaign_id'=>$value, 'detail'=>$val])
      @endforeach
    </div>
</div>
</div>

<script>
  

  $('.view-select').click(function(){
    $('.option_select').toggle( 'display' );
  });
 
  $('.remove-select').click(function(){
        removeCampaignDetail(this);
      });
  $('.label_option').click(function(){
    if($('.label__selected[data-value='+$(this).data('value')+']').length){
      removeCampaignDetail(this);
    }else{
      $(this).addClass('select-disable');
      $('.area_selected').append('<span class="label__selected" data-value="'+$(this).data('value')+'">'+$(this).text()+'<i class="fa fa-times remove-select" data-value="'+$(this).data('value')+'"></i></span>');
      
      $('.remove-select').click(function(){
        removeCampaignDetail(this);
      });
      
        $.ajax({
            url: '{{url("admin/products/get/")}}'+'/'+$(this).data('value')+'/'+$('#id').val(),
            type: 'GET',
            data: {},
            success: function (response) {
              $('#show_campaign').append(response);

            },
            error: function (data) {
              console.log(data);
            }
        }); 
        
      }   
  });

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
  

    // var multi = new SelectPure("#product-select", {
    //   options: [
    //     @foreach(App\Models\Product::all() as $product)
    //     {
    //       label: "{{$product->title}}",
    //       value: "{{$product->id}}",
    //     },
    //     @endforeach
       
    //   ],
    //   multiple: true,
    //   icon: "fa fa-times remove",
    //   placeholder: "-Chọn sản phẩm-",
    //   onChange: value => { 
    //     console.log(value);
    //     $('#product-select .remove').click(function(){
    //         id_product = $(this).data('value');
    //         $('#campaign-box-'+id_product).remove();
    //     });
    //    },
      
    //   classNames: {
    //     select: "select-pure__select",
    //     dropdownShown: "select-pure__select--opened",
    //     multiselect: "select-pure__select--multiple",
    //     label: "select-pure__label",
    //     placeholder: "select-pure__placeholder",
    //     dropdown: "select-pure__options",
    //     option: "select-pure__option",
    //     autocompleteInput: "select-pure__autocomplete",
    //     selectedLabel: "select-pure__selected-label",
    //     selectedOption: "select-pure__option--selected",
    //     placeholderHidden: "select-pure__placeholder--hidden",
    //     optionHidden: "select-pure__option--hidden",
    //   }
    // });
   


    // $('.select-pure__label').append('<span class="select-pure__selected-label">Cá koi<i class="fa fa-times remove" data-value="3"></i></span>');
    // $('.select-pure__option[data-value="3"]').addClass('select-pure__option--selected');
   
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
        }
      });
    }
    $(document).ready(function(){
      $("#searchselect").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#sltbdt tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });
    });
  </script>

