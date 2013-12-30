<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucThongTinKH.ascx.cs" Inherits="MangHocTap.ucMaster.ucThongTinKH" %>

<link href="/CSS/UC_ThongtinTK.css" rel="stylesheet" />
<link href="/CSS/menusite.css" rel="stylesheet" />
<script src="/JQuery/menu.js"></script>

<style type="text/css">
    .clstieude
    {
        color:#258cb9;
    }
</style>

<div id="UCThongtintk">
    <div id="headerThongtintk">
        <div class="imgtaikhoan">
        <asp:Image ID="imgAvatar" runat="server" Width="80px" Height="80px" />
        </div>
        <div class="Tuychinhtk">
            <div class="sTentaikhoan">
                <asp:Label ID="lblTentaikhoan" CssClass="lblTentaikhoan" runat="server" Text=""></asp:Label>
                <a class="EditAcc" href="/Thaydoittcanhan.aspx">[Edit]</a>
            </div>
            <asp:Image ID="ImageLevel" CssClass="ImageLevel" runat="server" ImageUrl="~/ImagesAcc/ImgLevel/file14.jpg" Width="17" Height="27" />
            <asp:Label ID="lblTencapdo" CssClass="lblLevelName" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="ttTruonglop">
        <div>
            
            <table style="width:100%;">
                <tr>
                    <td class="clstieude">Trường:</td>
                    <td colspan="3">
                        <asp:Label ID="lblTruongtk" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="clstieude">Khoa:</td>
                    <td class="auto-style1" colspan="3">
                        <asp:Label ID="lblKhoatk" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="clstieude">Ngành:</td>
                    <td>
                        <asp:Label ID="lblNganhtk" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="clstieude">
                        Khóa:</td>
                    <td>
                        <asp:Label ID="lblKhoahoctk" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="clstieude">Lớp:</td>
                    <td colspan="3">
                        <asp:Label ID="lblLoptk" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="footerThongtintk">
        <div class="divDangxuat">
            <asp:LinkButton ID="btnDangxuat" runat="server" OnClick="btnDangxuat_Click">Đăng Xuất</asp:LinkButton>
        </div>
        <div class="divMore">

            <div id="menu">
                <ul id="navmn">  
                    <li><a href="#">Tùy chọn</a>
                    <ul>
                        <li><a href="Default.aspx">Trang Chủ</a></li>
                        <li><a href="#">cái menu này</a></li>
                        <li><a href="#">nên click hay hover hè</a></li>
                    </ul></li>
                </ul>
            </div>

        </div>
    </div>
</div>