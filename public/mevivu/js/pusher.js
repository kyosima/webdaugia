// Enable pusher logging - don't include this in production
Pusher.logToConsole = true;

var pusher = new Pusher('68ef3c83b7b5c521c84a', {
  cluster: 'ap1'
});

var channel = pusher.subscribe('my-channel');
channel.bind('my-event', function(data) {
    var auction = JSON.stringify(data['message']);
    auction = JSON.parse(auction);

    $('#current-price').text(formatCash(auction['price'])+'đ');
});

function formatCash(str) {
    str =String(str);
    return str.split('').reverse().reduce((prev, next, index) => {
        return ((index % 3) ? next : (next + ',')) + prev
    })
}
   
       
    
        


