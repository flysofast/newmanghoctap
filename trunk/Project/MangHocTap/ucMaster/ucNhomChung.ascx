<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNhomChung.ascx.cs" Inherits="MangHocTap.ucMaster.ucNhomChung" %>
<link href="/CSS/ucNhomChung.css" rel="stylesheet" />
<div id="nhomchung">
    <div class="main" onclick="location.href='/Nhom/NhomChung/Truong'"><asp:Label ID="lbTruong" runat="server" Text="ĐH KHOA HỌC"></asp:Label></div>
    <div class="child" onclick="location.href='/Nhom/NhomChung/Khoa'"><asp:Label ID="lbKhoa" runat="server" Text="Khoa Công nghệ Thông tin" Font-Size="9px"></asp:Label></div>
    <div class="child" onclick="location.href='/Nhom/NhomChung/KhoaHoc'"><asp:Label ID="lbKhoaK" runat="server" Text="K34" Font-Size="9px"></asp:Label></div>
    <div class="child" onclick="location.href='/Nhom/NhomChung/Lop'"><asp:Label ID="lbLop" runat="server" Text="TinA" Font-Size="9px"></asp:Label></div>
</div>