$(function () {
    $(document).on("click", ".wishlist-add button", function () {
        $('#preloder').css('display', 'block');
        $('#preloder .loader').css('display', 'block');
        let $button = $(this);
        let url = $button.data('href');
        let id = $button.parents('.product__discount__item').data('id');

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
            success: function (response, textStatus, xhr) {
                switch (xhr.status) {
                    case 200:
                        $('.wishlistHeader span').css('display', 'inline-block');
                        $('.wishlistHeader span').text(response[0]);

                        $('body').append(`
                        <div class="tinv-wishlist">
                            <div class="tinvwl_added_to_wishlist tinv-modal tinv-modal-open">
                                <div class="tinv-overlay"></div>
                                <div class="tinv-table">
                                    <div class="tinv-cell">
                                        <div class="tinv-modal-inner">
                                            <i class="icon_check"></i>
                                            <div class="tinv-txt">Đã thêm ${response[2].title} vào danh sách yêu thích</div>
                                            <div class="tinvwl-buttons-group tinv-wishlist-clear">
                                                <button class="primary-btn tinvwl_button_view"
                                                    data-url="${response[1]}" type="button"><i
                                                        class="icon_heart_alt"></i> Danh sách yêu thích </button>
                                                <button class="primary-btn tinvwl_button_close" type="button">
                                                <i class="icon_close"></i> Close</button>
                                            </div>
                                            <div class="tinv-wishlist-clear"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        `)
                        break;

                    case 201:
                        $('body').append(`
                        <div class="tinv-wishlist">
                            <div class="tinvwl_added_to_wishlist tinv-modal tinv-modal-open">
                                <div class="tinv-overlay"></div>
                                <div class="tinv-table">
                                    <div class="tinv-cell">
                                        <div class="tinv-modal-inner">
                                            <i class="icon_close"></i>
                                            <div class="tinv-txt">${response[0].title} đã có trong danh sách yêu thích </div>
                                            <div class="tinvwl-buttons-group tinv-wishlist-clear">
                                                <button class="primary-btn tinvwl_button_view"
                                                    data-url="${response[1]}" type="button"><i
                                                        class="icon_heart_alt"></i> Danh sách yêu thích </button>
                                                <button class="primary-btn tinvwl_button_close" type="button">
                                                <i class="icon_close"></i> Close</button>
                                            </div>
                                            <div class="tinv-wishlist-clear"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        `)
                        break;

                    default:
                        break;
                }
            },
            complete: function () {
                $('#preloder').css('display', 'none');
                $('#preloder .loader').css('display', 'none');
            }
        });
    });

    $(document).on("click", ".tinvwl_button_view", function () {
        $(location).attr('href', $(this).data('url'));
    })

    $(document).on("click", ".tinvwl_button_close", function () {
        $('.tinvwl_added_to_wishlist').removeClass('tinv-modal-open');
    })


});