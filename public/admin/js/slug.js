
// $(document).on('change', $(".create_slug").data('focus'), function(){
//   console.log($(this));
//   var val = 'hello';
//   var type = 'hello';
//   val = $(this).val();
//   var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
//   var URL = $('meta[name="url"]').attr('content');
//   type = $(this).data('type');
//   $.ajax({
//       url: $('meta[name="url"]').attr('content')+'/admin/kiem-tra-duong-dan',
//       method:"PUT",
//       data: { _token: CSRF_TOKEN, slug: val, type: type },
//       success:function(data)
//       {
//         $(".create_slug").val(data);
//       },
//       error:function(data) {
//         /* Act on the event */
//         alert(data.responseText);
//         $(".create_slug").val('');
//       }
//     });

// });