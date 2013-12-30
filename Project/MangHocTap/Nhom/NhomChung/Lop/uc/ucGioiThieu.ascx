<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucGioiThieu.ascx.cs" Inherits="MangHocTap.Nhom.NhomChung.Lop.uc.ucGioiThieu" %>
<script>
    $(function () {

        $('#info .title').click(function () {
            if ($('#info .content:first').css('display') == 'none') {
                $('.content').hide('slow');
            }

            $('#info .content').toggle('slow');
        });
        $('#QA .title').click(function () {
            if ($('#QA .content:first').css('display') == 'none') {
                $('.content').hide('slow');
            }

            $('#QA .content').toggle('slow');
        });
    });
</script>
<style>
    #info .content td {
        background-color: #E8F3FB;
        border:1px solid white;
    }
</style>
<div id="info">
    <div class="title">Thông tin về trường ĐH Khoa học Huế</div>
    <div class="content">
        <table style="width: 100%;">
            <tr>
                <td rowspan="3" style="width: 40%;">
                    <asp:Image ID="imgMap" runat="server" ImageUrl="~/Images/DHKH/DHKH-Map.PNG" Width="330px" />
                </td>
                <td style="width: 60%; vertical-align: top;">
                    <p>
                        <b>Trường Đại học Khoa học Huế</b><span class="Apple-converted-space">&nbsp;</span>là một trường đại học thuộc<span class="Apple-converted-space">&nbsp;</span><a href="http://vi.wikipedia.org/wiki/Đại_học_Huế" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;" title="Đại học Huế">Đại học Huế</a>. Trường đại học này có trụ sở chính tại số 77 Nguyễn Huệ, <a href="http://vi.wikipedia.org/wiki/Huế" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;" title="Huế">Huế</a>. Khu trường sở của Trường Đại học Khoa học Huế có diện tích 14.000 m², nằm giữa giữa ba đường phố ở trung tâm phía Nam <a href="http://vi.wikipedia.org/wiki/Sông_Hương" style="text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;" title="Sông Hương">Sông 
                        Hương</a><span class="Apple-converted-space">&nbsp;</span>của thành phố Huế: đường Nguyễn Huệ, đường Đống Đa và đường Lý Thường Kiệt. Trường Đại học Khoa học Huế - Đại học Huế (gọi tắt là trường Đại học Khoa học Huế), tiền thân là trường Đại học Tổng hợp Huế, được thành lập theo Quyết định số 426/TTg ngày 27-10-1976 của Thủ tướng chính phủ trên cơ sở sát nhập Đại học Khoa học và Đại học Văn khoa của Viện Đại học Huế trước đây (Viện ĐH Huế thành lập năm 1957). Năm 1994, theo Nghị định số 30/CP của Chính phủ về việc thành lập Đại học Huế, trường Đại học Tổng hợp trở thành trường thành viên của Đại học Huế và được đổi tên thành trường Đại học Khoa học.
                    </p>
                    <p>
                        Sứ mạng của Trường Đại học Khoa học Huế được xác định như sau: &quot;Trường Đại học Khoa học- Đại học Huế là cơ sở đào tạo đại học, sau đại học đa ngành, đa lĩnh vực và nghiên cứu khoa học, chuyển giao công nghệ về khoa học tự nhiên, khoa học xã hội-nhân văn, kỹ thuật và công nghệ; là nơi cung cấp nguồn nhân lực và sản phẩm khoa học công nghệ chất lượng cao, đáp ứng sự nghiệp công nghiệp hóa, hiện đại hóa đất nước, trực tiếp là các tỉnh miền Trung- Tây Nguyên&quot;.
                    </p>
                    <p style="float: right;">
                        <em>(Theo Wikipedia)</em>
                    </p>
                </td>
            </tr>
            <tr>
                <td>Địa chỉ: 77 Nguyễn Huệ, TP Huế&nbsp;</td>
            </tr>
            <tr>
                <td>Số điện thoại: 0123465789</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="http://upload.wikimedia.org/wikipedia/vi/thumb/2/21/%C4%90%E1%BA%A1i_h%E1%BB%8Dc_Khoa_h%E1%BB%8Dc_Hu%E1%BA%BF.jpg/800px-%C4%90%E1%BA%A1i_h%E1%BB%8Dc_Khoa_h%E1%BB%8Dc_Hu%E1%BA%BF.jpg" Width="340px" />
                    <asp:Image ID="Image2" runat="server" ImageUrl="http://upload.wikimedia.org/wikipedia/vi/thumb/6/6f/%C4%90%E1%BA%A1i_h%E1%BB%8Dc_Khoa_h%E1%BB%8Dc_Hu%E1%BA%BF1.jpg/300px-%C4%90%E1%BA%A1i_h%E1%BB%8Dc_Khoa_h%E1%BB%8Dc_Hu%E1%BA%BF1.jpg" Width="340px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span>Các lĩnh vực nghiên cứu cơ bản, đặc trưng của một trường đại học khoa học cơ bản ở miền Trung (KHTN, KHXHNV, KHCN, Kỹ thuật và KHGD). - Đáp ứng nhu cầu phát triển kinh tế - xã hội thực tiễn của khu vực miền Trung - Tây Nguyên nói riêng và cả nước nói chung. - Phát huy thế mạnh về đội ngũ và trang thiết bị hiện có để phấn đấu trở thành một trung tâm nghiên cứu và đào tạo nguồn nhân lực chất lượng cao ở khu vực Miền Trung. - Xây dựng đề tài đa ngành, đa cấp, đa lĩnh vực; đề tài ứng dụng và chuyển giao công nghệ, góp phần quy hoạch phát triển bền vững và khai thác hợp 
                    lý tài nguyên thiên nhiên. Phát huy truyền thống hơn 30 năm xây dựng và phát triển, trong những năm tới Trường sẽ không ngừng nâng cao chất lượng, mở rộng quy mô đào tạo và NCKH. Chú trọng mở một số ngành đào tạo mới theo hướng công nghệ - ứng dụng; tăng quy mô đào tạo hợp lý phù hợp thế mạnh đội ngũ, CSVC của Trường nhằm đáp ứng nhu cầu xã hội; tích cực điện tử hoá bài giảng, xuất bản giáo trình; trang bị phòng học, phòng thực hành, phòng thí nghiệm hiện đại, chất lượng cao; áp dụng đào tạo tín chỉ cho các ngành học. Tăng cường liên kết với các đối tác để tiến hành ký kết hợp tác nghiên cứu các đề tài trọng điểm, các đề tài có tính chuyển giao công nghệ, ứng dụng cao và tham gia thỉnh giảng trao đổi chuyên môn.</span></td>
            </tr>
        </table>
    </div>
</div>
<div id="QA">
    <div class="title">FAQ - Câu hỏi thường gặp</div>
    <div class="content" style="display: none;">Trường Đại học Khoa học Huế - Đại học Huế (gọi tắt là trường Đại học Khoa học Huế ), tiền thân là trường Đại học Tổng hợp Huế, được thành lập theo Quyết định số 426/TTg ngày 27-10-1976 của Thủ tướng chính phủ trên cơ sở sát nhập Đại học Khoa học và Đại học Văn khoa của Viện Đại học Huế trước đây (Viện ĐH Huế thành lập năm 1957). Năm 1994, theo Nghị định số 30/CP của Chính phủ về việc thành lập Đại học Huế, trường Đại học Tổng hợp trở thành trường thành viên của Đại học Huế và được đổi tên thành trường Đại học Khoa học.</div>
</div>
