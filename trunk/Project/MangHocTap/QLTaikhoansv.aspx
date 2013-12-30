<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QLTaikhoansv.aspx.cs" Inherits="MangHocTap.QLTaikhoansv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/QLtaikhoan/Module.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Managead">
        <div class="header-Managead">
            <h4>Quản Lý Tài Khoản</h4>
        </div>
        <div class="content-Managead">
            <div class="contentmain">
                <h2 class="admd-tieude">Quản lý Tài Khoản Sinh Viên</h2>
                <br />
                <div class="content-data">
                    
                    <!--khung nhap du lieu-->
                    <div class="content-post">
                    <asp:Panel ID="PanelSupostTaikhoan" runat="server" Width="700px" BorderColor="Blue" 
                        BorderStyle="Solid" BorderWidth="1px" Visible="False">
                        <table cellspacing="2px" style="width:100%;">
                            <tr>
                                <td align="center" colspan="2" bgcolor="Blue">
                                    <asp:Label ID="lblTieudesptaikhoan" runat="server" Font-Bold="True" 
                                        ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    &nbsp;</td>
                                <td>
                                    <asp:ImageButton ID="ImgbtnCloseForm" runat="server" CssClass="ImgbtnCloseForm" 
                                        ImageUrl="~/CSS/QLtaikhoan/Images/icon-delete.png" OnClick="ImgbtnCloseForm_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style6">
                                    Email</td>
                                <td class="style1">
                                    <asp:TextBox ID="txtEmail" runat="server" Height="23px" Width="200px" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Họ Tên:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHoten" runat="server" Height="23px" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Mật Khẩu:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMatkhau" runat="server" Height="23px" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Trường học:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlChontruong" runat="server" Height="23px" Width="180px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Khoa:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlChonKhoa" runat="server" Height="23px" Width="180px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Ngành học:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlChonNganh" runat="server" Height="23px" Width="180px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Khóa học:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlChonKhoahoc" runat="server" Height="23px" Width="180px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    Lớp:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlChonLop" runat="server" Height="23px" Width="180px">
                                    </asp:DropDownList>
                                    
                                </td>
                            </tr>
    
                            <tr>
                                <td align="left" colspan="2">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="lblThongbaoloi" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="style5">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="btnCapnhat" runat="server" Height="30px" Text="Cập Nhật" 
                                        Width="90px" Font-Bold="True" 
                                        ForeColor="#33CC33" ValidationGroup="tbedsach" />
                                    <asp:Button ID="btnDong" runat="server" Height="30px" Text="Đóng" 
                                        Width="90px" Font-Bold="True" ForeColor="Red" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>

                    <div class="GridViewSach">
                    <asp:GridView ID="GridViewTaikhoanuser" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" GridLines="Vertical" Width="100%" 
                        PageSize="15" AllowPaging="True" OnSelectedIndexChanging="GridViewTaikhoanuser_SelectedIndexChanging" OnSelectedIndexChanged="GridViewTaikhoanuser_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:TemplateField HeaderText="Avatar">
                                <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("avatar") %>' Width="50px" Height="60px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="email" HeaderText="Email" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="hoten" HeaderText="Họ Tên" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tentruong" HeaderText="Trường" >
                            </asp:BoundField>
                            <asp:BoundField DataField="tenkhoa" HeaderText="Khoa" >
                            </asp:BoundField>
                            <asp:BoundField DataField="tennganh" HeaderText="Ngành" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nienkhoa" HeaderText="Khóa học" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tenlop" HeaderText="Lớp" />
                            <asp:CommandField ButtonType="Image" HeaderText="Sửa" 
                                SelectImageUrl="~/CSS/QLtaikhoan/Images/edit-user.png" ShowSelectButton="True" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Image" 
                                DeleteImageUrl="~/CSS/QLtaikhoan/Images/icon-delete.png" HeaderText="Xóa" 
                                ShowDeleteButton="True" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Đầu" 
                            LastPageText="Cuối" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

</asp:Content>
