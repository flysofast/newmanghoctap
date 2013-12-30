<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MangHocTap.NhomChung.NhomTruong.GioiThieu" %>

<%@ Register Src="~/Nhom/NhomChung/Truong/uc/ucGioiThieu.ascx" TagPrefix="uc1" TagName="ucGioiThieu" %>
<%@ Register Src="~/Nhom/ucThaoLuan.ascx" TagPrefix="uc1" TagName="ucThaoLuan" %>


<asp:Content ClientIDMode="AutoID" ContentPlaceHolderID="head" runat="server">
    <link href="/CSS/NhomPages.css" rel="stylesheet" />
    <script src="/JQuery/jquery-ui.js.js"></script>
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

           
    </style>
    <script>
        $(function () {

            $('#1').click(function () {
                $('#ThaoLuan').hide(function () {
                    $('#GioiThieu').show('slow');
                });

                $('#tabmenu li').removeClass('active');
                $(this).addClass('active');

            });

            $('#2').click(function () {

                $('#GioiThieu').hide(function () {

                    $('#ThaoLuan').show('slow');

                });

                $('#tabmenu li').removeClass('active');

                $(this).addClass('active');

            });

        });
    </script>

</asp:Content>

<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="header" style="margin-bottom: 5px;">
        <img src="/Images/bannerTruong.png"  />
        <div id="tabmenu">
            <ul>
                <%-- <li><a href="GioiThieu.aspx">Giới thiệu</a></li>
                <li><a href="ThaoLuan.aspx">Thảo luận</a></li>--%>
                <li id="1" ><span>Giới thiệu</span></li>
                <li id="2" class="active"><span>Thảo luận</span></li>
            </ul>
        </div>
    </div>
    <div id="GioiThieu" style="width: 100%; height: 300px;display: none;">
        <uc1:ucGioiThieu runat="server" ID="ucGioiThieu" />
    </div>
    <div id="ThaoLuan" style="width: 100%; height: 300px; ">
        <uc1:ucThaoLuan runat="server" ID="ucThaoLuan" />
    </div>

</asp:Content>
