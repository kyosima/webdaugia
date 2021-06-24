$(document).ready(function() {
    $('.select-location').select2();
    $('.js-location').change(function(e) {
        e.preventDefault();
        let type = $(this).attr('data-type');
        // console.log($(this).next('div.nice-select.js-location.wide').find('ul.list li.selected').data('value'));
        let parentId = $(this).val();
        $('#preloder').css('display', 'block');
        $('#preloder .loader').css('display', 'block');
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "GET",
            url: "http://localhost:85/webdaugia/getLocation",
            data: {
                type: type,
                parent: parentId
            },
            success: function(response) {
                if(response.data){
                    let html = '';
                    let element = '';
                    if(type == 'city'){
                        html = "<option value='' selected>Mời bạn chọn Quận/Huyện</option>";
                        element = '#selectDistrict';
                        $('#thanhphohidden').val($("#selectCity option:selected").text());
                    }
                    else {
                        html = "<option value='' selected>Mời bạn chọn Phường/Xã</option>";
                        element = '#selectWard';
                        $('#quanhidden').val($("#selectDistrict option:selected").text());
                    }

                    $.each(response.data, function(idx, val){
                        html += "<option value='"+val.id+"'>"+val._prefix+" "+val._name+"</option>"; 
                    });

                    $(element).html('').append(html);
                }
            },
            complete: function() {
                $('#preloder').css('display', 'none');
                $('#preloder .loader').css('display', 'none');
            }
        });
    });

    $('#selectWard').change(function(e){
        e.preventDefault();
        $('#phuonghidden').val($(this).find('option:selected').text());
    });

});
