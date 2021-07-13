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
                        countRunDetail(time, 0, 1, total, duration,0);
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
    url =$('#detail-counter-'+(parseInt(order))).data('urlcancel');
    $.ajax({
        type: "GET",
        url: url,
        data: {}, // serializes the form's elements.
        success: function(response)
        {
            console.log(response); // show response from the php script.
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
        },
        error: function(xhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

function countRunDetail(time, order, step, total,duration, status){ 
    console.log(order);
    if(parseInt(status) == 0){
        startDetail(parseInt(order));
    }
    // var t = '2014/01/01 23:59:59:0'.split(/[- :]/);
    var t = time.split(' ');
    var a = t[0].split('-');
    var b = t[1].split(':');
    // Apply each element to the Date function
    // var startDateTime = new Date('2014,0,1,23,59,59,0');
    var startDateTime = new Date(a[0], a[1]-1, a[2], b[0], parseInt(b[1])+(step*order) , b[2],0);
    startDateTime = new Date(startDateTime.getTime() + duration*60000);
    var  newStamp= startDateTime.getTime();
    var timer; // for storing the interval (to stop or pause later if needed)
    
    var start_next = true;
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
        console.log(step +' ' + (parseInt(duration) -2) + ' ' +m);
        console.log(start_next);
        if(((parseInt(duration) -2) == m) && (start_next == true)){
            console.log('dk1');
            console.log(parseInt(order)+1);
            console.log(parseInt(total));
            if((parseInt(order)+1) <= (parseInt(total))){
                console.log('dk2');
                countRunDetail(time, parseInt(order)+1, step,total,duration, 0);
                start_next = false;
            }
        }
        
        if((d == 0) && (h==0) && (m == 0) && (s ==0)){
            stopDetail(order);
            clearInterval(timer);
        }
        $('#detail-counter-'+order+ ' .day').text(d);
        $('#detail-counter-'+order+ ' .hour').text(h);
        $('#detail-counter-'+order+ ' .minute').text(m);
        $('#detail-counter-'+order+ ' .second').text(s);
    }, 1000);
}

