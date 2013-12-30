<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMonHoc.master" AutoEventWireup="true" CodeBehind="TrangMonHocGhiChep.aspx.cs" Inherits="MangHocTap.TrangMonHocGhiChep" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/MonHoc/ghichep.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="submonhoc">
        <div class="imgheader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungHK.png" />
        </div>
        <div class="bodermonhoc">
            <div class="tieudeheader">
                <asp:Label ID="lbtieude" runat="server" Visible="true" Text=">> Sổ ghi chép quá trình học tập"></asp:Label>
            </div>
                    <div class="kqmh">
                        <div style="width: 620px; float: left; margin-bottom: 5px;">
                            <div>
                                <div style="float: left; padding: 5px;">
                                    <asp:Label ID="lbngayghichep" runat="server"></asp:Label>
                                </div>
                                <div style="text-align: right;">
                                    <asp:Button ID="btnhomnay" CssClass="btn" OnClick="btnhomnay_Click" runat="server" Text="Hôm nay" />
                                    <asp:Button ID="btnluu" CssClass="btn" OnClick="btnluu_Click" runat="server" Text="Lưu" />
                                    <asp:Button ID="btnxoa" CssClass="btn" OnClick="btnxoa_Click" runat="server" Text="Xóa" />
                                </div>
                            </div>
                            <div style="height: 315px; float: left;">
                                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" Width="618px" Height="210px"></CKEditor:CKEditorControl>
                            </div>
                        </div>
                        <div style="padding-top: 25px; padding-left: 10px; float: left;">
                            <div style="color: #2b3d4d; font-weight: 800; font-size: 12px;margin-bottom:5px;">
                                Danh Sách bài viết:
                            </div>
                            <div >
                                <asp:ListBox ID="lboxgc" CssClass="lboxgc" OnSelectedIndexChanged="lboxgc_SelectedIndexChanged" runat="server" AutoPostBack="True"></asp:ListBox></div>
                        </div>
                    </div>
        </div>
    </div>
</asp:Content>
