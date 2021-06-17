
function selectFileWithCKFinder( preview, in_value, type ) {
	CKFinder.popup( {
		chooseFiles: true,
		width: 800,
		height: 600,
		onInit: function( finder ) {

			finder.on( 'files:choose', function( evt ) {

				if(type == 'MULTIPLE'){
					var files = evt.data.files;

				    var html = '';
				    var value = $(in_value).val();

				    files.forEach( function( file, i ) {

				    	html += '<div class="col-4 mt-3"><span data-id="" data-url="'+file.getUrl()+'" class="delete_gallery"><i class="fas fa-times"></i></span><img src="'+file.getUrl()+'"></div>';
				        value += file.getUrl() + ',';
				    } );
				    $(preview).append(html);
				    $(in_value).val(value);
				}
				else{
					var file = evt.data.files.first();
					$(preview).attr('src', file.getUrl());
					$(in_value).val(file.getUrl());
				}
			} );
		}
	} );
}
$(document).on('click', '.add_picture', function(event) {
	/* Act on the event */
	var preview = $(this).data('preview');
	
	var in_value = $(this).data('input');

	var type = $(this).data('type');

	selectFileWithCKFinder( preview, in_value, type );
});


$(document).on('click', '.delete_gallery', function(event) {

	var t = $(this);

	if($(this).data('id') == ''){
		var in_value = $("#in_gallery");
		var url = $(this).data('url');
		var newValue = in_value.val().replace(url+',', '');
		in_value.val(newValue);
		t.parent().remove();
	}else{
		var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
		var id = $(this).data('id');
		$.ajax({
		  url:'delete-gallery',
		  method:"DELETE",
		  data: { _token: CSRF_TOKEN, id: id },
		  success:function(data)
		  {
			t.parent().remove();
		  },
		  error:function(data) {
			/* Act on the event */
			alert(data.responseText);
		  }
		});
	}
});
