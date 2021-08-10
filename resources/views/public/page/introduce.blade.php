@extends('public.layout')
@section('content')
<style>
.featured__item__text ul {
    padding: 20px;
    margin: 0;
}
.featured__item__text h2{
    margin:10px 0;
}
</style>

   <!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <div class="breadcrumb__option">
                        <a href="{{URL::to('/')}}">Trang chủ</a>
                        <span>Giới thiệu</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12 col-md-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="featured__item">
                                <div class="featured__item__text">
                                Công ty OnKoi – Quang Minh được thành lập vào năm 2007, là một công ty lâu đời trong lĩnh vực cung cấp cá Koi Nhật Bản và tư vấn thiết kế, thi công hồ cá Koi. Với tên gọi mang ý nghĩa “đoàn kết giữa Nhật Bản và Việt Nam”, Onkoi Quang Minh mong muốn sẽ lan tỏa tình yêu đối với cá Koi đến tất cả những người đã, đang và chuẩn bị chơi cá Koi. Sau hơn 10 năm xây dựng và phát triển, Onkoi Quang Minh đã định hình các lĩnh vực kinh doanh chính để hiện thực hóa sứ mệnh của mình đó là: cung cấp cá Koi Nhật Bản, thiết kế-thi công hồ nuôi cá Koi, phân phối thức ăn cho cá Koi, kinh doanh vật tư thiết bị cho hồ cá Koi.
                                    <h2 id="ftoc-lich-su-phat-trien" class="ftwp-heading"><strong>Lịch sử phát triển</strong></h2>
    Công ty Onkoi Quang Minh được thành lập bắt đầu từ năm 2007, khi thị trường chơi Koi Nhật tại Việt Nam vẫn trong giai đoạn sơ khai, phần lớn là chơi theo sở thích và vẫn chưa nở rộ bởi cá Koi Nhật khá đắt đỏ và kén người chơi nên có thể nói, với hơn 10 năm kinh doanh uy tín và phát triển, Onkoi Quang Minh là một trong số ít đơn vị, cá nhân đi đầu trong lĩnh vực phân phối Koi Nhật Bản chính hiệu. . Ở thời điểm này, đội ngũ nhân viên của đơn vị chỉ đạt một con số khiêm tốn khoảng 10 người. Sau một thời gian phát triển mạnh mẽ, số lượng nhân viên hoạt động tại đơn vị đã lên đến con số trên 50 người.

    Khởi đầu công ty là một hồ Koi nhỏ do cá nhân anh Đào Văn Quang- Giám đốc Công ty Onkoi Quang Minh chính tay chăm sóc, tự chính anh học hỏi và thiết kế hồ Koi theo hướng dẫn từ bạn bè anh tại Nhật Bản. Sau đó, anh cũng trực tiếp sang Nhật Bản để tham gia học hỏi cách chọn Koi đẹp và chuẩn về nuôi.Những chú cá Koi này vẫn đang sinh sống trong hồ của gia đình anh Quang tại Hà Nội.

    Ban đầu, mục đích chính của anh Đào Văn Quang chỉ chơi Koi giống như thú vui để giúp anh giảm stress, thư giãn và suy nghĩ về công việc kinh doanh. Nhưng hiện nay, nhận thấy sức hút của dân chơi đông, nhu cầu lớn nên anh đã nhập trực tiếp cá từ Nhật về mở trại nuôi kinh doanh. Giá cả từ bình dân đến cao cấp, đáp ứng nhu cầu cả số đông lẫn dân chơi cá Koi quý tộc. Trang trại Koi có diện tích rộng lớn với cách thiết kế theo tiêu chuẩn để đảm bảo Koi luôn phát triển trong điều kiện tốt nhất, được Koi là “Showroom Koi” của khu vực phía Bắc.

    Định hướng trong tương lai, Onkoi Quang Minh sẽ đưa đơn vị trở thành doanh nghiệp số 1 trên thị trường phân phối Koi Nhật Bản và thi công hồ cá Koi. Song song đó, đơn vị còn hướng đến việc phát triển nhiều loại hình dịch vụ hơn nữa để phục vụ người dùng. Tuy nhiên, giá thành sẽ được công ty cắt giảm xuống mức thấp nhất nhằm bảo vệ túi tiền khách hàng.
    <h2 id="ftoc-co-cau-to-chuc-cua-cong-ty-onkoi-quang-minh" class="ftwp-heading"><strong>Cơ cấu tổ chức của Công ty Onkoi Quang Minh</strong></h2>
    – Điều hành công ty

    Giám đốc Đào Văn Quang: Đây là công ty được hoạt động theo mô hình Công ty Trách nhiệm hữu hạn, do chủ sở hữu nắm quyền là ông Đào Văn Quang- là người điều hành và giám sát tất cả mọi hoạt động kinh doanh hàng ngày của công ty.

    – Đội ngũ nhân viên:
    <ul>
        <li>+ Nhân viên Marketing</li>
        <li>+ Nhân viên Thiết kế đồ họa</li>
        <li>+ Nhân viên Content</li>
        <li>+ Nhân viên Seo</li>
        <li>+ Nhân viên xuất nhập hàng</li>
    </ul>
    Hoạt động theo mô hình Công ty TNHH nên quy mô quản lý chặt chẽ từ ban lãnh đạo đến các trưởng bộ phận, trưởng nhóm và từng nhân viên, tạo thành một thể thống nhất, đồng lòng từ trên xuống dưới, từ dưới lên trên.

    Đường lối, mục tiêu hoạt động xuyên suốt của công ty là trở thành doanh nghiệp vừa dẫn đầu về thị phần và vừa là doanh nghiệp phát triển dựa trên các giá trị đạo đức kinh doanh, vì người tiêu dùng. Cùng với đó là ự gắn kết chặt chẽ, luôn đồng lòng đồng sức để hoàn thành công việc với tinh thần trách nhiệm cao vì sự phát triển của công ty.
    <h2 id="ftoc-muc-tieu-phat-trien" class="ftwp-heading"><strong>Mục tiêu phát triển</strong></h2>
    Tiếp tục xây dựng và phát triển Công ty. Tiếp tục đầu tư mở rộng qui mô kinh doanh trong các lĩnh vực cá Koi, thi công thiết kế hồ cá Koi, đảm bảo cho Công ty có tiềm lực kinh tế mạnh, đủ sức để cạnh tranh với các doanh nghiệp trong nước và trong khu vực. Không ngừng nâng cao đời sống vật chất, tinh thần cho người lao động, góp phần vào sự phát triển của công ty Onkoi Quang Minh. Ngoài ram Onkoi Quang Minh còn thực hiện các mục tiêu:

    – Công tác đổi mới doanh nghiệp:

    + Tiếp tục thực hiện sắp xếp, đổi mới mọi mặt, xây dựng và phát triển Công ty thành Công ty mạnh, bền vững, có tốc độ tăng trưởng nhanh và có tính cạnh tranh cao.

    + Tổ chức hình thành phát triển chi nhánh, văn phòng đại diện từ Bắc, Trung, Nam và hoàn thiện hệ thống đại lý …

    – Công tác đầu tư:

    + Đầu tư và chú trọng phát triển nhiều hơn nữa về số lượng Koi, lĩnh vực thi công thiết kế hồ Koi.

    + Đầu tư nâng cao hệ thống thiết bị vật tư hồ Koi đạt chuẩn chất lượng

    – Công tác quản lý:

    + Hoàn thiện cơ chế quản lý, điều hành giữa các chi nhánh, văn phòng đại diện của công ty.

    + Bổ sung và nâng cao,đào tạo chất lượng nhân lực

    – Xây dựng mối quan hệ phát triển bền vững đối với khách hàng:

    + Luôn lấy sự tin tưởng và hài lòng của khách hàng làm thước đo giá trị sản phẩm và dịch vụ uy tín nhất trên thị trường.

    + Đảm bảo cung cấp những sản phẩm phù hợp với tình trạng, điều kiện của khách hàng

    + Thể hiện sự hợp tác và tri ân khách hàng thông qua việc đào tạo các quy trình quản lý hệ thống, vận hành hệ thống sản phẩm và hệ thống quản lý.
    <h2 id="ftoc-linh-vuc-hoat-dong-chinh-cua-onkoi-quang-minh" class="ftwp-heading"><strong>Lĩnh vực hoạt động chính của Onkoi Quang Minh</strong></h2>
    Không chỉ được đánh giá là đơn vị cung cấp Koi Nhật uy tín, Onkoi Quang Minh còn được đánh giá là đơn vị có chuyên môn cao trong lĩnh vực thi công thiết kế cảnh quan. Theo đó lĩnh vực hoạt động chính của đơn vị tập trung hướng đến quy trình thi công thiết kế – hồ cá Koi chuyên nghiệp.

    Tính đến thời điểm hiện tại, dịch vụ của đơn vị đã phục vụ hàng nghìn khách hàng là cá nhân và doanh nghiệp. Hầu hết, sau khi trải nghiệm dịch vụ của Onkoi Quang Minh, khách hàng đều tỏ ra hài lòng với chất lượng sản phẩm sau khi hoàn thiện. Đây là động lực và niềm vui rất lớn để Onkoi Quang Minh tiếp tục phát triển hơn nữa.

    Hiện nay, Onkoi Quang Minh tiếp tục cho ra mắt các dịch vụ sản phẩm đa dạng như sau:

    <strong><em>Cung cấp cá Koi Nhật thuần chủng</em></strong>

    Koi là một loại cá chép đã được thuần hóa, lai tạo và được nuôi khá phổ biến tại Nhật Bản để làm cảnh. Bên cạnh vẻ đẹp mê hồn, Koi còn được biết đến là một loại cá phong thủy cực tốt, luôn mang lại may mắn cho người chơi.

    Onkoi Quang Minh chuyên cung cấp cho khách hàng trên cả nước các loại cá Koi Nhật Bản chuẩn với chất lượng tốt với giá thành ưu đãi nhất.

    Với nguồn giống bố mẹ là cá chất lượng cao từ các trang trại nổi tiếng Nhật Bản như Omosako, Danichi, Isa, Sakai…v…v… Các thế hệ con F1 được chọn lựa gắt gao và nuôi lớn bằng thức ăn Hikari nhập khẩu từ Nhật chất lượng số 1 thế giới.

    Với nguồn hàng chất lượng và ổn định, sẵn sàng bảo hành, chúng tôi tin: Onkoi Quang Minh đáp ứng được yêu cầu của những vị khách khó tính nhất trong làng cá Koi nước ta.

    Nguồn koi của onkoi Quang Minh – <strong><a class="rank-math-link" href="https://onkoi.vn/trai-ca-koi-nhat-ban">Các trại cá koi nhật bản(Koi Farm Japan)</a></strong>

    <strong><em>Đấu giá-Thanh lý- Ký gửi cá Koi</em></strong>

    Ngoài cung cấp cá Koi theo cách bán trực tiếp, Onkoi Quang Minh còn thực hiện đấu giá-thanh lý- ký gửi cá Koi nhằm tuyển chọn những em Koi có tố chất tốt nhất, nhận được nhiều sự quan tâm nhất. Bên cạnh đó, việc đấu giá, thanh lý hay ký gửi cá Koi cũng tạo ra môi trường “săn” Koi lành mạnh, xác nhận giao dịch mua bán nhanh chóng do tìm được những người mua hoặc bán có nhu cầu đích thực.

    Đây là những hình thức kinh doanh Koi mới, chưa được phát triển mạnh mẽ tại Việt Nam. Vì thế, thông qua hình thức này, Onkoi Quang Minh mong muốn sẽ ngày càng đa dạng hơn nữa việc chọn lọc Koi đẹp và chuẩn chất lượng đến tay người mua, người chơi Koi tại Việt Nam.

    <strong><em>Thiết kế – thi công hồ cá Koi</em></strong>

    Quy trình thiết kế thi công hồ cá Koi của Onkoi Quang Minh hoàn toàn đảm bảo tính chuyên nghiệp cao. Theo đó quá trình khảo sát hiện trạng xây dựng hồ được đơn vị chú trọng đầu tư để đưa ra phương án khả thi nhất. Đây cũng là lúc mà tính hiệu quả và sự tiết kiệm được đặt lên hàng đầu nhằm cắt giảm chi phí.

    Đặc biệt là đơn vị sẽ luôn luôn lắng nghe sở thích của khách hàng để lên ý tưởng thiết kế hồ cá Koi tự nhiên đẹp như ý. Sau quá trình thiết kế bản vẽ, quy trình thi công sẽ được tiến hành với bảng danh sách nguyên vật liệu kê khai minh bạch.

    Chỉ khi nào công ty đạt được sự thống nhất với khách hàng hàng, đơn vị mới bắt tay vào thi công công trình. Ở giai đoạn này, việc xây dựng và lắp đặt hệ thống lọc nước sẽ được tiến hành một cách kỹ lưỡng. Đảm bảo sao công trình không chỉ có được vẻ đẹp thẩm mỹ cao, mà còn mang đến môi trường sống trong lành cho đàn cá Koi.

    Trước khi bàn gia o hồ Koi, Onkoi Quang Minh sẽ tiếp tục điều chỉnh và kiểm tra bộ lọc nước một lần cuối. Nếu không có vấn đề phát sinh đơn, vị mới tiến hành trao trả công trình cho người dùng. Điều này sẽ hạn chế tối đa các sai sót kỹ thuật có thể xảy ra trong quá trình xây dựng.

    Các danh mục thiết kế – thi công hồ cá Koi tại Onkoi Quang Minh bao gồm:
    <ul>
        <li>– Thiết kế và thi công hồ cá Koi tự nhiên</li>
        <li>– Thiết kế và thi công cảnh quan quanh vườn nuôi cá Koi</li>
        <li>– Thiết kế và thi công hồ cá Koi trong nhà</li>
        <li>– Thiết kế và thi công hồ cá Koi ngoài trời</li>
        <li>– Thiết kế và thi công hồ cá Koi bằng kính cao cấp</li>
        <li>– Thiết kế và thi công hồ cá Koi giá bình dân</li>
        <li>– Thiết kế và thi công hồ cá Koi cao cấp, giá trị cao</li>
    </ul>
    <strong><em>Phân phối thức ăn cho cá Koi</em></strong>

    Onkoi Quang Minh chuyên cung cấp các loại thức ăn cho cá Koi, cung cấp giá sỉ cạnh tranh cho các cửa hàng cá Koi trên toàn quốc. Tất cả các loại thức ăn cho cá Koi mà Onkoi Quang Minh cung cấp đều đảm bảo có xuất xứ rõ ràng, nhiều dòng thức ăn phù hợp với từng nhu cầu Koi khác nhau. Ngoài ra, Onkoi Quang Minh

    còn hướng dẫn cách cho Koi ăn với hàm lượng vừa phải nhằm giúp Koi phát triển tốt nhất.

    <strong><em>Vật tư cho hồ cá Koi</em></strong>

    Onkoi – Quang Minh chuyên cung cấp phụ kiện cho hồ cá Koi, thiết bị lọc hồ Koi và các hệ thống xử lý nước, thiết bị hút nước mặt, đèn V-C cho các hồ cá Koi lớn trên 24m3 nước ao. Các sản phẩm đều được nhập khẩu chính hãng 100% từ các nhãn hàng cao cấp đến từ Đức, Ý, Đài Loan giúp khách hàng dễ dàng lựa chọn sản phẩm và giảm nhiều thời gian chăm sóc Koi, làm sạch hồ Koi.
    <h2 id="ftoc-cam-ket-uy-tin-cua-onkoi-quang-minh" class="ftwp-heading"><strong>Cam kết uy tín của Onkoi Quang Minh</strong></h2>
    Trong suốt thời gian hoạt động của mình, Thiên Dương Koi đã khẳng định được thương hiệu đơn vị với người dùng cả nước. Tất cả là nhờ vào loại hình dịch vụ chuyên nghiệp và các sản phẩm chất lượng cao, trở thành địa chỉ vàng được nhiều người tín nhiệm.

    Nhằm mang đến sự yên tâm tuyệt đối cho người dùng, Onkoi Quang Minh xin cam kết uy tín:
    <ul>
        <li>– Cung cấp cá Koi chuẩn, lựa chọn từng con, tỉ lệ lựa chọn 300/10000, sẵn sàng đền gấp 10 lần giá trị cá, bảo hành lâu dài trên từng em Koi.</li>
        <li>– Cung cấp dịch vụ tư vấn thiết kế hồ cá koi tận tình và đảm bảo trung thực. Luôn lấy lợi ích khách hàng đặt lên hàng đầu trong quá trình cung cấp dịch vụ. Nói không với hành vi thiếu trung thực, gây tốn kém cho quý khách hàng thân yêu.</li>
        <li>– Xây dựng các phương án thi công thiết kế khả thi và tiết kiệm nhất cho người dùng. Nhưng bên cạnh đó chất lượng công trình vẫn được đảm bảo, để giảm thiểu tối đa các thiệt hại có thể xảy ra.</li>
    </ul>
    Đem đến cho người dùng quy trình thi công cá koi chuyên nghiệp đạt tiêu chuẩn chất lượng cao. Lấy sự chính xác tuyệt đối trong từng thao tác tiến hành làm phương châm xây dựng.
    <ul>
        <li>– Các trang thiết bị được sử dụng để lắp đặt hồ nuôi cá koi đảm bảo được nhập khẩu chính hãng. Sản phẩm chất lượng cao cho thời gian sử dụng dài lâu trong môi trường ẩm ướt.</li>
        <li>– Hướng dẫn sử dụng và bảo dưỡng hồ nuôi cá cặn kẽ, chi tiết. Giải đáp nhanh mọi thắc mắc của quý khách hàng trong quá trình sử dụng dịch vụ.</li>
        <li>– Áp dụng mức giá ưu đãi dành cho tất cả các dịch vụ mà Onkoi Quang Minh cung cấp. Bởi đơn vị luôn mong muốn bảo vệ tối đa túi tiền của người dùng.</li>
        <li>– Hoàn tiền 100% nếu như các sản phẩm của công ty không đem lại kết quả như ý hoặc không làm cho quý khách hàng hài lòng.</li>
    </ul>
    Liên hệ mua cá koi, đấu giá, tư vấn nuôi xin mời liên hệ:
    <h2 id="ftoc-heading-7" class="ftwp-heading ftwp-heading">Công ty TNHH On Koi Quang Minh</h2>
    <ul>
        <li>Địa chỉ: số 27 Ngách 32, Ngõ 76 An Dương, Q. Tây Hồ, Hà Nội</li>
        <li>Website: <a href="https://onkoi.vn/">https://onkoi.vn</a></li>
        <li>Hotline: 02439.99.77.55 – 0971.466.888</li>
        <li>Email: noithatonplaza@gmail.com</li>
        <li>Mail: Info@onkoi.vn</li>
    </ul>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->



@endsection