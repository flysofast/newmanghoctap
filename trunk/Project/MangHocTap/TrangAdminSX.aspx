<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TrangAdminSX.aspx.cs" Inherits="MangHocTap.TrangAdminSX" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/quanlysuaxoamonhoc.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="baomenu">
        <a href="TrangAmdinQLHT.aspx" class="sm">Quản lý bài viết</a>
        <a id="active" class="sm">Sửa/Xóa môn học</a>
        <a class="sm">Tạo môn học mới</a>
    </div>
    <div style="background-color: white; padding: 10px; border-top: 1px solid #BFBFBF">
         <asp:GridView ID="gvmonhoc" runat="server" DataKeyNames="mamonhoc" CssClass="gvmh"
            OnRowEditing="gvmonhoc_RowEditing" OnRowCancelingEdit="gvmonhoc_RowCancelingEdit" OnRowUpdating="gvmonhoc_RowUpdating"
            OnRowDeleting="gvmonhoc_RowDeleting" BorderColor="#258CB9" AllowPaging="true" OnPageIndexChanging="gvmonhoc_PageIndexChanging"
             PageSize="12"
            AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Mã môn học">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("mamonhoc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên môn học">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tenmonhoc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div style="text-align: left;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("tenmonhoc") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                    <ItemStyle Width="338px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số TC">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("stc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("stc") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="40px" />
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hệ số">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("heso") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("heso") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="40px" />
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngành">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("manganh") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("manganh") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="40px" />
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Khoa">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("khoa") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("khoa") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="40px" />
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" HeaderText="Sửa" ButtonType="Image" CancelImageUrl="~/Images/ic_dialog_cancel.png" EditImageUrl="~/Images/file_edit.png" UpdateImageUrl="~/Images/Update.png">
                    <ItemStyle Width="100px" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" HeaderText="Xóa" ButtonType="Image" DeleteImageUrl="~/Images/Delete_Icon.png">
                    <ItemStyle Width="50px" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="#A2CDED" ForeColor="#1854A8" />
            <RowStyle BackColor="#E8F3FB" />
        </asp:GridView>
    </div>
</asp:Content>
