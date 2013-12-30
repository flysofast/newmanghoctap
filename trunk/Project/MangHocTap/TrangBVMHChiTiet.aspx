<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMonHoc.master" AutoEventWireup="true" CodeBehind="TrangBVMHChiTiet.aspx.cs" Inherits="MangHocTap.TrangBVMHChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/MonHoc/taobaiviet.css" rel="stylesheet" />
     <link href="/CSS/MonHoc/chitiet.css" rel="stylesheet" />
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

            $('#2').click(function () {
                $('#blnhanh').hide(function () {
                    $('#blnhubv').show('slow');
                });

                $('#tabmenu li').removeClass('active');
                $(this).addClass('active');

            });

            $('#1').click(function () {

                $('#blnhubv').hide(function () {

                    $('#blnhanh').show(2000);

                });

                $('#tabmenu li').removeClass('active');

                $(this).addClass('active');

            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="submonhoc">
        <div class="imgheader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungbvht.png" />
        </div>
        <div class="lbloi">
            <asp:Label ID="lbloi" runat="server" Visible="false" Text=""></asp:Label>
        </div>
        <div class="bodermonhoc">
            <div class="tieudeheader">
                <a style="float: left;" href="<% laymamonhoc(); %>">
                    <asp:Label ID="lbtieude" runat="server" Visible="true" Text="Tất cả bài viết"></asp:Label></a>
                <div><% laytieude();%></div>
            </div>
            <div class="kqmh">
                <div style="float: left; width: 99%; margin-bottom: -30px; position: absolute;">
                    <div style="float: left; margin-left: 30px; padding: 2px; border: 1px solid #0094ff; background-color: white;">
                        <asp:Image ID="avatar" Width="70px" Height="80px" runat="server" />
                    </div>
                    <div style="float: left; margin-top: 70px; margin-left: 10px; font-weight: 800; color: #3B5998;">
                        <asp:Label ID="lbten" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div style="border: 1px solid #0094ff; float: left; padding: 5px; width: 99%; margin-top: 65px;">
                    <div>
                        <div style="border: 1px solid #3B5998; background-color: #0094ff; margin-top: 25px; font-weight: 800; padding: 10px;">
                            <asp:Label ID="lbtieudebv" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div style="border: 1px solid #808080; padding: 10px;">
                            <asp:Label ID="lbnoidungbv" runat="server" Text="Label"></asp:Label>
                        </div>                       
                        <div  style="border: 1px solid #808080; padding: 5px; border-top: none; height: 10px;">
                        </div>
                         <div id="tabmenu">
                            <ul>
                                <li id="1"><span>Bình luận nhanh</span></li>
                                <li id="2" class="active"><span>Bình luận như một bài viết</span></li>
                            </ul>
                        </div>
                        <div id="blnhanh" style="border: 1px solid #808080; padding: 5px; margin-top: 20px; height: 30px;">
                        </div>
                        <div id="blnhubv" style="border: 1px solid #808080; padding: 5px; margin-top: 20px; height: 100px; display:none;">
                        </div>
                        <div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

