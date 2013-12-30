<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucFooter.ascx.cs" Inherits="MangHocTap.ucMaster.ucFooter" %>

<link href="/CSS/ucFooter.css" rel="stylesheet" />
<div id="fb-root"></div>
<div id="Div1"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script type="text/javascript">
    (function () {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/platform.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
    })();
</script>

<div class="divfooter">
    <div class="thongtinweb">
        <label class="tt1">BÀI TẬP THIẾT KẾ WEB: MẠNG HỌC TÂP</label>
        <label class="tt2">Giáo viên hướng dẫn: NGUYỄN HOÀNG HÀ</label>
        <label class="tt2">Sinh viên thực hiện: NGUYỄN ĐÔNG NIN, BÙI TẤN KỶ, LÊ HẢI NAM</label>
    </div>
    <div class="divlike">
        <div class="divfblike">
            <div class="fb-like" data-href="https://manghoctap.somee.com" data-layout="box_count" 
                data-action="like" data-show-faces="false" data-share="false"></div>
        </div>
        <div class="divgglike">
            <div class="g-plusone" data-size="tall" data-href="https://manghoctap.somee.com"></div>
        </div>
    </div>
</div>