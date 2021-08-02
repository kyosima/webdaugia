// Enable pusher logging - don't include this in production
Pusher.logToConsole = true;

var pusher = new Pusher('68ef3c83b7b5c521c84a', {
  cluster: 'ap1'
});

var channel = pusher.subscribe('my-channel');
channel.bind('my-event', function(data) {
    var auction = JSON.stringify(data['message']);
    auction = JSON.parse(auction);
    $('#price-detail-'+auction['campaign_detail_id']+' #current-price').text(formatCash(auction['price'])+'đ');
    $('#toast-detail-'+auction['campaign_detail_id'] +' .toast-body').empty().append('<p class="text-dark">Giá đã thay đổi thành: <b class="text-danger" id="price-update">'+formatCash(auction['price'])+'đ</b></p>');
    $('#toast-detail-'+auction['campaign_detail_id']).toast('show');
});

function formatCash(str) {
    str =String(str);
    return str.split('').reverse().reduce((prev, next, index) => {
        return ((index % 3) ? next : (next + ',')) + prev
    })
}
   
       
    
        


