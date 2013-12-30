<%@ Page Title="" Language="C#"  MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TrangHocKy.aspx.cs" Inherits="MangHocTap.TrangHocKy" %>

<%@ Register Src="~/ucHocKy/ucKinhNghiem.ascx" TagPrefix="uc1" TagName="ucKinhNghiem" %>
<%@ Register Src="~/ucHocKy/ucTaoMonHoc.ascx" TagPrefix="uc1" TagName="ucTaoMonHoc" %>
<%@ Register Src="~/ucHocKy/ucHK.ascx" TagPrefix="uc1" TagName="ucHK" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/HocKy.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
   
            <div id="banner-hk">
            <img src="Images/bannerHK.jpg" width="850" /></div>
        <div id="header">
        <asp:Button CssClass="btnkh" ID="btnhk" runat="server"  Text="Học Kỳ"  OnClick="btnhk_Click"/>
        <asp:Button CssClass="btn" ID="btntmh" runat="server" Text="Tạo Môn Học" OnClick="btntmh_Click" />
        <asp:Button CssClass="btn" ID="btnknht" runat="server" Text="Kinh Nghiệm Học Tập" OnClick="btnknht_Click" />
    </div>
    <div id="content">      
        <uc1:ucHK runat="server" id="ucHK"  />
        <uc1:ucKinhNghiem runat="server"  ID="ucKinhNghiem" />
        <uc1:ucTaoMonHoc runat="server" ID="ucTaoMonHoc" />

    </div>
      
</asp:Content>

