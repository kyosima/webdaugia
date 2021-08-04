$(document).ready(function(){
    var pathName = $(location).attr('pathname');
    // add to cart from product detail
    $('.product__details__text .primary-btn').click(function(){
        var qtyProduct = $('.pro-qty input').val();
        var url = $(this).data('href');
        $('#preloder').css('display', 'block');
        $('#preloder .loader').css('display', 'block');

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            data: {
                id: $(this).data('id'),
                qty: qtyProduct
            },
            dataType: "json",
            success: function (response) {
                $('.cartHeader .cart-count').text(response[2]);

                $('ul.mini-cart>li').remove();
                $.each(response[0], function(key, value){
                    $('ul.mini-cart').prepend(
                        `<li class="mini-cart-item">
                        <span class="remove" data-rowid="${value.rowId}" data-href="${response[4]}">x</span>
                        <a href="${response[3]}/${value.options.slug}" style="color: #000;">
                            <img src="${value.options.feature_img}" width="60" height="60">${value.name}
                        </a>
                        <p class="quantity">${value.qty} x <span class="amount">${ new Intl.NumberFormat('vn-VN').format(value.price) }₫</span>
                        </p>
                        </li>`
                    );
                })

                // HIEN THI GIA TIEN TAM TINH
                $('.div-dropdown-cart .cart-content>p').remove();
                $('.div-dropdown-cart .cart-content').append(
                    `<p class="total">
                    <strong>Tổng số phụ: </strong>
                    <span class="amount">${response[1]} ₫</span></p>`
                )

                $('.header__cart__price span').text(response[1] + '₫');

                $('.cart-count').css('display', 'inline-block');

                $('.cartHeader .div-dropdown-cart').addClass('cart-active');
                setTimeout(function () {
                    $('.cartHeader .div-dropdown-cart').removeClass('cart-active');
                }, 2000)
            },
            complete: function() {
                $('#preloder').css('display', 'none');
                $('#preloder .loader').css('display', 'none');
            }
        });
    })

    // add to cart from quick add
    $(document).on("click","li.quick-add button",function() {
        var $button = $(this);
        var url = $(this).data('href');
        var id = $button.parents('div.product__discount__item').data('id');
        var parent = $button.parent();

        $('#preloder').css('display', 'block');
        $('#preloder .loader').css('display', 'block');

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            data: {
                id: id
            },
            dataType: "json",
            success: function (response) {
                $('.cartHeader .cart-count').text(response[2]);

                $('ul.mini-cart>li').remove();
                $.each(response[0], function(key, value){
                    $('ul.mini-cart').prepend(
                        `<li class="mini-cart-item">
                        <span class="remove" data-rowid="${value.rowId}" data-href="${response[4]}">x</span>
                        <a href="${response[3]}/${value.options.slug}" style="color: #000;">
                            <img src="${value.options.feature_img}" width="60" height="60">${value.name}
                        </a>
                        <p class="quantity">${value.qty} x <span class="amount">${ new Intl.NumberFormat('vn-VN').format(value.price) }₫</span>
                        </p>
                        </li>`
                    );
                })

                // HIEN THI GIA TIEN TAM TINH
                $('.div-dropdown-cart .cart-content>p').remove();
                $('.div-dropdown-cart .cart-content').append(
                    `<p class="total">
                    <strong>Tổng số phụ: </strong>
                    <span class="amount">${response[1]} ₫</span></p>`
                )

                $('.header__cart__price span').text(response[1] + '₫');

                $('.cart-count').css('display', 'inline-block');

                $('.cartHeader .div-dropdown-cart').addClass('cart-active');
                setTimeout(function () {
                    $('.cartHeader .div-dropdown-cart').removeClass('cart-active');
                }, 2000);

                parent.empty();
                parent.prepend(`
                    <button style="background-color:#28a745">
                        <i class="fa fa-check" style="color: #fff;"></i>
                    </button>
                `)

            },
            complete: function() {
                $('#preloder').css('display', 'none');
                $('#preloder .loader').css('display', 'none');
            }
        });
    });


    // delete from cart
    if(coupon == null){
        $(document).on("click","span.remove",function() {
            var rowID = $(this).data('rowid');
            var url = $(this).data('href');
    
            $('#preloder').css('display', 'block');
            $('#preloder .loader').css('display', 'block');
    
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: "DELETE",
                url: url,
                data: {
                    rowID: rowID
                },
                dataType: "json",
                success: function (response) {
                    // print object
                    if(Object.keys(response[0]).length > 0) {
                        // thay doi SL trong gio hang
                        $('.cartHeader .cart-count').css('display', 'inline');
                        $('.cartHeader .cart-count').text(response[2]);
    
                        // HIEN THI SP TRONG GIO HANG
                        $('ul.mini-cart>li').remove();
                        $('.shoping__cart__table table tbody tr').remove();
                        $.each(response[0], function(key, value){
                            $('ul.mini-cart').prepend(
                                `<li class="mini-cart-item">
                                <span class="remove" data-rowid="${value.rowId}" data-href="${url}">x</span>
                                <a href="${response[3]}/${value.options.slug}" style="color: #000;">
                                    <img src="${value.options.feature_img}" width="60" height="60">${value.name}
                                </a>
                                <p class="quantity">${value.qty} x <span class="amount">${new Intl.NumberFormat('vn-VN').format(value.price)}₫</span>
                                </p>
                                </li>`
                            );
    
                            $('.shoping__cart__table table tbody').prepend(
                                `<tr>
                                    <td class="shoping__cart__item">
                                        <img src="${value.options.feature_img}" alt="" width="100" height="100">
                                        <h5>${value.name}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${new Intl.NumberFormat('vn-VN').format(value.price)}₫
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <span class="dec qtybtn">-</span>
                                                <input type="text" value="${value.qty}" data-rowId="${value.rowId}">
                                                <span class="inc qtybtn">+</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${new Intl.NumberFormat('vn-VN').format(value.price*value.qty)}₫
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close remove" data-rowId="${value.rowId}" data-href="${url}"></span>
                                    </td>
                                </tr>`
                            );
    
                        })
    
                        // HIEN THI GIA TIEN TAM TINH
                        $('.div-dropdown-cart .cart-content>p').remove();
                        $('.div-dropdown-cart .cart-content').append(
                            `<p class="total">
                            <strong>Tổng số phụ: </strong>
                            <span class="amount">${response[1]} ₫</span></p>`
                        )
    
                        // DISPLAY CART DROPDOWN
                        $('.div-dropdown-cart').addClass('cart-active')
                        setTimeout(function () { 
                            $('.div-dropdown-cart').removeClass('cart-active');
                        }, 2000);
    
                    } else {
                        $("#cbCount").css("display","none");
                        $(".cart-content p.total").remove();
                        $('ul.mini-cart>li').remove();
                        $("ul.mini-cart").append(
                            "<li>Chưa có sản phẩm nào trong giỏ hàng</li>"
                        )
                        $('.cart-count').css('display', 'none');
    
                        var pathName = $(location).attr('pathname');
                        if(pathName.includes('/cart')){
                            window.location.replace(response[4]);
                        }
                    }
    
                    $('.header__cart__price span').text(response[1] + '₫');
                },
                complete: function() {
                    $('#preloder').css('display', 'none');
                    $('#preloder .loader').css('display', 'none');
                }
            });
        });



        /*-------------------
		Quantity change & Update cart
	    --------------------- */
        var newVal = 0;
        $(document).on('click', '.qtybtn', function () {
            var $button = $(this);
            var oldValue = $button.parent().find('input').val();
            if ($button.hasClass('inc')) {
                newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 1) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 1;
                }
            }
            $button.parent().find('input').val(newVal);

            // UPDATE QTY ON SHOPPING CART PAGE
            if(pathName.includes('/cart')){
                $('#preloder').css('display', 'block');
                $('#preloder .loader').css('display', 'block');

                var rowId = $button.parent().find('input').data('rowid');

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "PUT",
                    url: "/webdaugia/update-cart",
                    data: {
                        rowID: rowId,
                        qty: newVal,
                    },
                    dataType: "json",
                    success: function (response) {

                        var qty = response[0][rowId].qty
                        var price = response[0][rowId].price
                        
                        $button.parents('tr').children('td.shoping__cart__total').text(`
                            ${ new Intl.NumberFormat('vn-VN').format(qty*price) }₫
                        `)

                        $('.shopping__subtotal b').text(response[1]+'₫');
                        $('.shopping__total b').text(response[1]+'₫');

                    },
                    complete: function() {
                        $('#preloder').css('display', 'none');
                        $('#preloder .loader').css('display', 'none');
                    }
                });
            }
        });
    } else {
        $(document).on('click', '.qtybtn', function () {
            alert('Bạn phải xóa coupon để cập nhật số lượng');
        })

        $(document).on("click","span.remove",function() {
            alert('Bạn phải xóa coupon để xóa sản phẩm khỏi giỏ hàng');
        })
    }
    
})