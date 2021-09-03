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
            url: ajaxSelectAddress,
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

    // load screen when submit checkout
    // $('form#form-checkout').submit(function(e){
    //     e.preventDefault();
    //     $('#preloder').css('display', 'block');
    //     $('#preloder .loader').css('display', 'block');
    // })

    $('section.checkout span.coupon-remove').click(function() {
        $('form.form-coupon-remove').submit();
    })

});


$(function() {

    $.validator.addMethod('customphone', function (value, element) {
        return this.optional(element) || /((09|03|07|08|05)+(\d{8})\b)|(84)\d{9}/.test(value);
    }, "Vui lòng nhập đúng định dạng số điện thoại");

    $("form#form-checkout").validate({
        // onfocusout: false,
        // onkeyup: false,
        // onclick: false,
        ignore: 'input[type=hidden], .select2-input, .select2-focusser',
        onchange:true,
        rules: {
            "customer_Name": {
                required: true,
            },
            "customer_Phone": {
                required: true,
                digits: true,
                maxlength: 11,
                minlength: 10,
                customphone: "default"
            },
            "customer_Email": {
                required: true,
                email: true,
            },
            "customer_City": {
                required: true,
                digits: true,
            },
            "customer_District": {
                required: true,
                digits: true,
            },
            "customer_Ward": {
                required: true,
                digits: true,
            },
            "customer_Address": {
                required: true,
            },
            "payment_method": {
                required: true,
            }
        },
        messages: {
            "customer_Phone": {
                required: "Vui lòng nhập số điện thoại",
                maxlength: "Tối đa 11 ký tự",
                minlength: "Tối thiểu là 10 chữ số",
                digits: "Vui lòng chỉ nhập số",
            },
            "customer_Name": {
                required: "Vui lòng nhập họ tên",
            },
            "customer_Email": {
                required: "Vui lòng nhập email",
                email: "Vui lòng nhập đúng định dạng email"
            },
            "customer_City": {
                required: "",
            },
            "customer_District": {
                required: "",
            },
            "customer_Ward": {
                required: "",
            },
            "customer_Address": {
                required: "Vui lòng nhập địa chỉ",
            },
            "payment_method": {
                required: "Vui lòng chọn phương thức thanh toán",
            }
        },
        submitHandler: function(form) {
            // your ajax logic here
            form.submit();
            $('#preloder').css('display', 'block');
            $('#preloder .loader').css('display', 'block');
        }
    });
});