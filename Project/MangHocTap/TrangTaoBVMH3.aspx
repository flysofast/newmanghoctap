<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMonHoc.master" AutoEventWireup="true" CodeBehind="TrangTaoBVMH3.aspx.cs" Inherits="MangHocTap.TrangTaoBVMH3" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/MonHoc/taobaiviet.css" rel="stylesheet" />
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
                <a href="<% laymamonhoc(); %>">
                    <asp:Label ID="lbtieude" runat="server" Visible="true" Text="Tất cả bài viết"></asp:Label></a>
                <asp:Label ID="Label1" runat="server" Visible="true" Text=" >>Chia sẻ tài liệu"></asp:Label>
            </div>
            <div class="kqmh">
                <div style="margin-bottom: 15px; margin-top: 10px;">
                    <div style="float: left; margin-right: 5px;">Tiêu đề</div>
                    <div>
                        <asp:TextBox ID="txttieude" CssClass="tbtieude" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div>
                    <div></div>
                    <div>
                        <CKEditor:CKEditorControl ID="CKEditorControl1" Height="250px" runat="server"></CKEditor:CKEditorControl>
                    </div>
                    <div>
                        <asp:Button ID="btnguibai" OnClick="btnguibai_Click" CssClass="btnguibai" runat="server" Text="Gửi bài" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
