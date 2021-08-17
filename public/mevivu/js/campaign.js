
function countStart(time,total, duration){ 
    // var t = '2014/01/01 23:59:59:0'.split(/[- :]/);
    console.log(time);
    var t = time.split(' ');
    var a = t[0].split('-');
    var b = t[1].split(':');
    // Apply each element to the Date function
    // var startDateTime = new Date('2014,0,1,23,59,59,0');
    var startDateTime = new Date(a[0], a[1]-1, a[2], b[0], b[1], b[2],0);
    var newStamp = startDateTime.getTime();
    var timer; // for storing the interval (to stop or pause later if needed)
    status = 0;
    if(status == 0){
        timer = setInterval(function(){
            $('#campaign-counter-title h2').text('Thời gian đến lúc mở đấu giá'); 
            newDate = new Date();
            startStamp = newDate.getTime();
            var diff = Math.round((newStamp-startStamp)/1000);
            var d = Math.floor(diff/(24*60*60)); /* though I hope she won't be working for consecutive days :) */
            diff = diff-(d*24*60*60);
            var h = Math.floor(diff/(60*60));
            diff = diff-(h*60*60);
            var m = Math.floor(diff/(60));
            diff = diff-(m*60);
            var s = diff;
            $('#campaign-counter .day').text(d);
            $('#campaign-counter .hour').text(h);
            $('#campaign-counter .minute').text(m);
            $('#campaign-counter .second').text(s);
            if((d == 0) && (h==0) && (m == 0) && (s ==0)){
                status =1;
                url =$('#campaign-counter').data('url');
                console.log(url);
                $.ajax({
                    type: "GET",
                    url: url,
                    data: {}, // serializes the form's elements.
                    success: function(response)
                    {
                        console.log(response); // show response from the php script.
                        countRun(time,total);
                        console.log('total: ' +total);
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                    });
                    clearInterval(timer);

            }

            // document.getElementById("campaign-counter").innerHTML = ''
            // d+" day(s), "+h+" hour(s), "+m+" minute(s), "+s+" second(s) working";
        }, 1000);
    }
}

function countRun(time,total){ 

    // var t = '2014/01/01 23:59:59:0'.split(/[- :]/);
    var t = time.split(' ');
    var a = t[0].split('-');
    var b = t[1].split(':');
    // Apply each element to the Date function
    // var startDateTime = new Date('2014,0,1,23,59,59,0');
    var startDateTime = new Date(a[0], a[1]-1, a[2], b[0], b[1], b[2],0);
    var  startStamp= startDateTime.getTime();
    var timer; // for storing the interval (to stop or pause later if needed)
    timer = setInterval(function(){
        $('#campaign-counter-title h2').text('Đấu giá đã bắt đầu'); 
        newDate = new Date();
        newStamp= newDate.getTime();
        var diff = Math.round((newStamp-startStamp)/1000);
        var d = Math.floor(diff/(24*60*60)); /* though I hope she won't be working for consecutive days :) */
        diff = diff-(d*24*60*60);
        var h = Math.floor(diff/(60*60));
        diff = diff-(h*60*60);
        var m = Math.floor(diff/(60));
        diff = diff-(m*60);
        var s = diff;
        $('#campaign-counter .day').text(d);
        $('#campaign-counter .hour').text(h);
        $('#campaign-counter .minute').text(m);
        $('#campaign-counter .second').text(s);
        

        // document.getElementById("campaign-counter").innerHTML = ''
        // d+" day(s), "+h+" hour(s), "+m+" minute(s), "+s+" second(s) working";
    }, 1000);
}

function startDetail(order){
    url =$('#detail-counter-'+(parseInt(order))).data('url');
    $.ajax({
        type: "GET",
        url: url,
        data: {}, // serializes the form's elements.
        success: function(response)
        {
            console.log(response); // show response from the php script.
            $('#detail-counter-'+(parseInt(order))).css('display', 'block');
            $('detail-product-title-'+(parseInt(order))).css('display', 'none');
        },
        error: function(xhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}
function stopDetail(order){
    url =$('#detail-counter-'+(parseInt(order))).data('urlcancel');
    $.ajax({
        type: "GET",
        url: url,
        data: {}, // serializes the form's elements.
        success: function(response)
        {
            console.log(response); // show response from the php script.
            $('#detail-counter-'+(parseInt(order))).css('display', 'none');
            $('detail-product-title-'+(parseInt(order))).css('display', 'block');
            $('detail-product-title-'+(parseInt(order))).text('Sản phẩm đã kết thúc đấu giá');
        },
        error: function(xhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

function countRunDetail(time, order, total,duration, status){ 

    if(parseInt(status) == 0){
        startDetail(parseInt(order));
    }
    $('.auction-area').css('display', 'block');
    // var t = '2014/01/01 23:59:59:0'.split(/[- :]/);
    var t = time.split(' ');
    var a = t[0].split('-');
    var b = t[1].split(':');
    // Apply each element to the Date function
    // var startDateTime = new Date('2014,0,1,23,59,59,0');
    var startDateTime = new Date(a[0], a[1]-1, a[2], b[0], parseInt(b[1])+(parseInt(order)) , b[2],0);
    startDateTime = new Date(startDateTime.getTime() + duration*60000);
    var  newStamp= startDateTime.getTime();
    var timer; // for storing the interval (to stop or pause later if needed)
    
    timer = setInterval(function(){
     
        newDate = new Date();
        startStamp= newDate.getTime();
        var diff = Math.round((newStamp-startStamp)/1000);
        var d = Math.floor(diff/(24*60*60)); /* though I hope she won't be working for consecutive days :) */
        diff = diff-(d*24*60*60);
        var h = Math.floor(diff/(60*60));
        diff = diff-(h*60*60);
        var m = Math.floor(diff/(60));
        diff = diff-(m*60);
        var s = diff;
        if((d == -1) ){
            console.log('end ' + order);
            $('#detail-order-'+order+' #status').text('Kết thúc');
            $('#detail-order-'+order+' #list-counter').remove();
            stopDetail(order);
            clearInterval(timer);
            $('.auction-area').css('display','none')
            if((parseInt(order)+1) == parseInt(total)){
                $('.campaign__count_time_run').empty().append('<div class="alert alert-success text-center "><h5 class="text-dark">Chiến dịch đấu giá đã kết thúc</h5></div>');
                $('#campaign-counter-title').remove();
            }
        }
        $('#detail-counter-'+order+ ' .day').text(d);
        $('#detail-counter-'+order+ ' .hour').text(h);
        $('#detail-counter-'+order+ ' .minute').text(m);
        $('#detail-counter-'+order+ ' .second').text(s);
    }, 1000);
}

function countStartDetail(time, order, total,duration, status){ 
    // var t = '2014/01/01 23:59:59:0'.split(/[- :]/);
    console.log(time);
    var t = time.split(' ');
    var a = t[0].split('-');
    var b = t[1].split(':');
    // Apply each element to the Date function
    // var startDateTime = new Date('2014,0,1,23,59,59,0');
    var startDateTime = new Date(a[0], a[1]-1, a[2], b[0], b[1], b[2],0);
    startDateTime = new Date(startDateTime.getTime() + order*60000);
    var newStamp = startDateTime.getTime();
    var timer; // for storing the interval (to stop or pause later if needed)
    if(status == 0){
        timer = setInterval(function(){
            newDate = new Date();
            startStamp = newDate.getTime();
            var diff = Math.round((newStamp-startStamp)/1000);
            var d = Math.floor(diff/(24*60*60)); /* though I hope she won't be working for consecutive days :) */
            diff = diff-(d*24*60*60);
            var h = Math.floor(diff/(60*60));
            diff = diff-(h*60*60);
            var m = Math.floor(diff/(60));
            diff = diff-(m*60);
            var s = diff;
            $('#detail-counter-'+order+ ' .day').text(d);
            $('#detail-counter-'+order+ ' .hour').text(h);
            $('#detail-counter-'+order+ ' .minute').text(m);
            $('#detail-counter-'+order+ ' .second').text(s);
            if((d == 0) && (h==0) && (m == 0) && (s ==0)){
                $('#detail-order-'+order+' #status').text('Đang chạy');   
                clearInterval(timer);
                countRunDetail(time, order, total, duration,status);
            }

            // document.getElementById("campaign-counter").innerHTML = ''
            // d+" day(s), "+h+" hour(s), "+m+" minute(s), "+s+" second(s) working";
        }, 1000);
    }
}

function addCampaintoWishlist(e){
    id = $(e).data('detailid');
    url = $(e).data('url');
    $.ajax({
        type: "GET",
        url: url+'/'+id,
        data: {}, // serializes the form's elements.
        success: function(response)
        {
            text =$('#add-detail-wishlist-'+id +' i').text();
            if(text == 'favorite_border'){
                $('#add-detail-wishlist-'+id +' i').text('favorite');
                $('#add-detail-wishlist-'+id).attr('data-status',1);
            }else{
                $('#add-detail-wishlist-'+id +' i').text('favorite_border');
                $('#add-detail-wishlist-'+id).attr('data-status',0);
            }
            console.log(response); // show response from the php script.
        },
        error: function(data) {
            console.log(data);
        }
    });
}

function getImage(e){
    id = $(e).data('id');
    url = $(e).data('url');
    $.ajax({
        type: "GET",
        url: url+'/'+id,
        data: {}, // serializes the form's elements.
        success: function(response)
        {
            $('#detail-media .modal-body').empty().html(response);
            $('#detail-media').modal('show');
            console.log(response); // show response from the php script.
        },
        error: function(data) {
            console.log(data);
        }
    });
}
function getVideo(e){
    id = $(e).data('id');
    url = $(e).data('url');
    $.ajax({
        type: "GET",
        url: url+'/'+id,
        data: {}, // serializes the form's elements.
        success: function(response)
        {
            $('#detail-media .modal-body').empty().html(response);
            $('#detail-media').modal('show');
            console.log(response); // show response from the php script.
        },
        error: function(data) {
            console.log(data);
        }
    });
}