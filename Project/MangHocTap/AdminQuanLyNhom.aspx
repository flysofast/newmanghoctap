<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminQuanLyNhom.aspx.cs" Inherits="MangHocTap.AdminQuanLyNhom" %>

<%@ Register Src="~/ucQLNhom/QlTruong.ascx" TagPrefix="uc1" TagName="QlTruong" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/CSS/NhomPages.css" rel="stylesheet" />
    <script src="JQuery/jquery202.js"></script>
    <style>
        #GioiThieu .title {
            background-color: #258cb9;
            color: white;
            font-size: small;
            font-weight: bold;
            text-align: center;
            padding: 5px;
            cursor: pointer;
        }

            #GioiThieu .title:hover {
                color: orange;
            }

        .box-title {
            width: 100%;
            height: 25px;
            /*border-radius: 8px 8px 0px 0px;*/
            margin-bottom: 5px;
            font-family: Tahoma;
            color: white;
            font-weight: bold;
            text-align: center;
            padding-top: 3px;
            font-size: 15px;
            background-color: #A09A78;
        }
    </style>
    <script>
        $(function () {

            $('#tabmenu li').click(function () {
                var contentID = '#' + $(this).attr('id') + 'Content';
                $('.contentNhom').hide('slow');
                $(contentID).show('slow');

                $('#tabmenu li').removeClass('active');
                $(this).addClass('active');

            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="header">
        <div id="tabmenu" style="font-family:Tahoma;">
            <ul>
                <%-- <li><a href="GioiThieu.aspx">Giới thiệu</a></li>
                <li><a href="ThaoLuan.aspx">Thảo luận</a></li>--%>
                <li id="Truong" class="active"><span>Trường</span></li>
                <li id="Khoa"><span>Khoa</span></li>
                <li id="Lop"><span>Lớp</span></li>
            </ul>
        </div>
    </div>
    <div id="TruongContent" style="width: 100%; height: 300px;" class="contentNhom">
        <uc1:QlTruong runat="server" ID="QlTruong" />
    </div>
    <div id="KhoaContent" style="width: 100%; height: 300px; display: none;" class="contentNhom">
        <uc1:QlTruong runat="server" ID="QlTruong1" />
    </div>
    <div id="LopContent" style="width: 100%; height: 300px; display: none;" class="contentNhom">
        <uc1:QlTruong runat="server" ID="QlTruong2" />
    </div>

</asp:Content>
