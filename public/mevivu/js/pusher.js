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
    $('#toast-detail-'+auction['campaign_detail_id'] +' #price-update').text(formatCash(auction['price'])+'đ');
    $('#toast-detail-'+auction['campaign_detail_id'] + ' .toast').toast('show');

});

function formatCash(str) {
    str =String(str);
    return str.split('').reverse().reduce((prev, next, index) => {
        return ((index % 3) ? next : (next + ',')) + prev
    })
}
   
       
    
        


