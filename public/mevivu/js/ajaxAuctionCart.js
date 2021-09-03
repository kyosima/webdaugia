$(document).ready(function () {
    var pathName = $(location).attr('pathname');
    // add to cart from product detail
    $('.btn-add-auction').click(function () {
        var url = $(this).data('href')
        var productId = $(this).data('id')
        var userId = $(this).data('userid')
        var camId = $(this).data('camid')

        $('#preloder').css('display', 'block')
        $('#preloder .loader').css('display', 'block')

        $(this).remove();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: url,
            data: {
                id: productId,
                userId: userId,
                camId: camId,
            },
            dataType: "json",
            success: function (response) {
                $('.cartHeader .cart-counts').text(response[0])
                $('.cart-counts').css('display', 'inline-block')

                $('body').append(`<div id="successAuctionModal" class="modal fade" style="display: block;" aria-modal="true">
                    <div class="modal-dialog modal-confirm">
                        <div class="modal-content">
                            <div class="modal-header justify-content-center">
                                <div class="icon-box">
                                    <i class="material-icons"></i>
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body text-center">
                                <h4>Thành công</h4>	
                                <p>Đã thêm sản phẩm <span style="color:red">${response[1]}</span> thành công</p>
                                <a class="btn btn-success" data-dismiss="modal" href="${auctionCart}"><span>Đi tới giỏ hàng</span> <i class="material-icons"></i></a>
                            </div>
                        </div>
                    </div>
                </div>`);

                $('#successAuctionModal').modal('show');

            },
            complete: function () {
                $('#preloder').css('display', 'none')
                $('#preloder .loader').css('display', 'none')
            }
        });
    })

    // delete from cart
    $(document).on("click", "span.remove.remove_auction", function () {
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
                if (Object.keys(response[0]).length > 0) {
                    // thay doi SL trong gio hang
                    $('.cartHeader .cart-counts').css('display', 'inline');
                    $('.cartHeader .cart-counts').text(response[2]);
                } else {
                    $("#cbCount").css("display", "none");
                    var pathName = $(location).attr('pathname');
                    if (pathName.includes('/auction-cart')) {
                        window.location.replace(response[4]);
                    }
                }
            },
            complete: function () {
                $('#preloder').css('display', 'none');
                $('#preloder .loader').css('display', 'none');
            }
        });
    });

})