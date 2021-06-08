


$(document).ready(function(){

    var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
    var URL = $('meta[name="url"]').attr('content');
    var element = $(".create_slug");

    $(element.data('focus')).change(function(){
        var val = $(this).val();
        var type = element.data('type');
        $.ajax({
            url: $('meta[name="url"]').attr('content')+'/admin/kiem-tra-duong-dan',
            method:"PUT",
            data: { _token: CSRF_TOKEN, slug: val, type: type },
            success:function(data)
            {
                element.val(data);
            },
            error:function(data) {
              /* Act on the event */
              alert(data.responseText);
              element.val('');
            }
          });

    });


});