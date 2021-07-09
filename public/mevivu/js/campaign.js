function countStart(time,total){ 
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
                        countRunDetail(time, 0, 0, total)

                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                    });
            }

            // document.getElementById("campaign-counter").innerHTML = ''
            // d+" day(s), "+h+" hour(s), "+m+" minute(s), "+s+" second(s) working";
        }, 1000);
    }
}

function countRun(time,total){ 
    countRunDetail(time, 0, 0, total)

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

function countRunDetail(time, order, step, total,duration){ 
    // var t = '2014/01/01 23:59:59:0'.split(/[- :]/);
    var t = time.split(' ');
    var a = t[0].split('-');
    var b = t[1].split(':');
    // Apply each element to the Date function
    // var startDateTime = new Date('2014,0,1,23,59,59,0');

    var startDateTime = new Date(a[0], a[1]-1, a[2], b[0], parseInt(b[1]) + step, b[2],0);
    var  startStamp= startDateTime.getTime();
    var timer; // for storing the interval (to stop or pause later if needed)
    newDate = new Date();
    newStamp= newDate.getTime();
    var diff = Math.round((newStamp-startStamp)/1000);
    var d = Math.floor(diff/(24*60*60)); 
    diff = diff-(d*24*60*60);
    var h = Math.floor(diff/(60*60));
    diff = diff-(h*60*60);
    var m_o = Math.floor(diff/(60));
    var count_m = 0;
    var start_next = true;
    timer = setInterval(function(){
         newStamp= newDate.getTime();
        var diff = Math.round((newStamp-startStamp)/1000);
        var d = Math.floor(diff/(24*60*60)); /* though I hope she won't be working for consecutive days :) */
        diff = diff-(d*24*60*60);
        var h = Math.floor(diff/(60*60));
        diff = diff-(h*60*60);
        var m = Math.floor(diff/(60));
        diff = diff-(m*60);
        var s = diff;
        if(m_o != m){
            count_m +=1;
        }
        if(start_next){
            if(count_m >=1){
                if(order+1 < total){
                    url =$('#detail-counter-1').data('url');
                    console.log(url);
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
                    start_next = false;
                    countRunDetail(time, parseInt(order)+1,1, total);
                }
            }
        }
        $('#detail-counter-'+order+ ' .day').text(d);
        $('#detail-counter-'+order+ ' .hour').text(h);
        $('#detail-counter-'+order+ ' .minute').text(m);
        $('#detail-counter-'+order+ ' .second').text(s);
        // document.getElementById("campaign-counter").innerHTML = ''
        // d+" day(s), "+h+" hour(s), "+m+" minute(s), "+s+" second(s) working";
    }, 1000);
}