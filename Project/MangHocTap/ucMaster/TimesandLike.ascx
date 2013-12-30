<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimesandLike.ascx.cs" Inherits="MangHocTap.ucMaster.TimesandLike" %>

<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<link href="../CSS/TimesandLike.css" rel="stylesheet" />

<div>
<%--    <div class="showlock">
        <object>
        <embed src="/Files/time.swf" width="200" height="60" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" 
                type="application/x-shockwave-flash" menu="false" wmode="transparent">
        </embed>
        </object>
    </div>--%>
    <div class="divfacebooklike">
        <div class="fb-like-box" data-href="https://www.facebook.com/MangHocTapDaiHocHue" data-width="250px" 
        data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" 
        data-show-border="true"></div>
    </div>
    
    <div class="divlikebutton">
        
    </div>
</div>