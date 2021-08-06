// Enable pusher logging - don't include this in production
Pusher.logToConsole = true;

var pusher = new Pusher('68ef3c83b7b5c521c84a', {
  cluster: 'ap1'
});

var channel = pusher.subscribe('my-channel');
channel.bind('my-event', function(data) {
    var detail = JSON.stringify(data['message']);
    detail = JSON.parse(detail);
    $('#price-detail-'+detail['id']+' #current-price').text(formatCash(detail['price_end'])+'đ');
    $('#toast-detail-'+detail['id'] +' .toast-body').empty().append('<p class="text-dark">Giá đã thay đổi thành: <b class="text-danger" id="price-update">'+formatCash(detail['price_end'])+'đ</b></p>');
    $('#price-detail-'+detail['id']+' #next-price').text(formatCash(detail['price_end']+detail['detail_price_step'])+'đ');
    $('#auction-cf-'+detail['id']).val(detail['price_end']+detail['detail_price_step']);
    $('#user-detail-'+detail['id'] +' #user-top').text(detail['user_name']);

    $('#toast-detail-'+detail['id']).toast('show');
   
});

function formatCash(str) {
    str =String(str);
    return str.split('').reverse().reduce((prev, next, index) => {
        return ((index % 3) ? next : (next + ',')) + prev
    })
}
   
       
    
        


