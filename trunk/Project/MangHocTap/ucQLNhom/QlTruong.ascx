<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QlTruong.ascx.cs" Inherits="MangHocTap.ucQLNhom.QlTruong" %>

 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <link href="/CSS/controls.css" rel="stylesheet" />
            <div class="box">
                <div class="box-title">
                    <asp:Label ID="lbCenterTitle" runat="server" Text="Quản lý loại sách"></asp:Label>
                </div>
                <table align="center" width="100%" class="shadowedBox">
                    <tr>
                        <td align="right">&nbsp;<asp:Label ID="Label1" runat="server" Text="Chọn trường:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="20px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="201px" CssClass="textbox" DataTextField="tentruong" DataValueField="matruong">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Chọn danh mục:</td>
                        <td align="left">
                            <asp:DropDownList ID="drdDanhmuc" runat="server" DataTextField="tendanhmuc" DataValueField="madanhmuc" Height="20px" Width="201px" CssClass="textbox" OnSelectedIndexChanged="drdDanhmuc_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="200" align="right" style="width: 1000px">Mã trường:</td>
                        <td style="width: 1000px">
                            <asp:TextBox ID="tbMa" runat="server" Width="201px" CssClass="textbox"></asp:TextBox>
                            <asp:Label ID="lbMa" runat="server" Font-Bold="True" ForeColor="Red" Text="Mã trường không hợp lệ!" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="200" align="right" style="width: 1000px">Tên trường:</td>
                        <td style="width: 1000px">
                            <asp:TextBox ID="tbTen" runat="server" Width="201px" CssClass="textbox"></asp:TextBox>
                            <asp:Label ID="lbTen" runat="server" Font-Bold="True" ForeColor="Red" Text="Tên trường không hợp lệ!" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 1000px" width="200">Địa chỉ:</td>
                        <td style="width: 1000px">
                            <asp:TextBox ID="tbDiachi" runat="server" CssClass="textbox" Width="201px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="200" align="right" style="width: 1000px">Số điện thoại:</td>
                        <td style="width: 1000px">
                            <asp:TextBox ID="tbSdt" runat="server" Width="201px" CssClass="textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 1000px" width="200">Giới thiệu:</td>
                        <td style="width: 1000px">
                            <asp:TextBox ID="tbGioiThieu" runat="server" CssClass="textbox" Width="201px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="200">&nbsp;</td>
                        <td align="left" style="padding-top: 7px;">
                            <asp:Button ID="btThem" runat="server" Text="Thêm mới..." OnClick="btThem_Click" CssClass="button" />
                            <asp:Button ID="btSua" runat="server" Text="Sửa" OnClick="btSua_Click" CssClass="button" />
                            <asp:Button ID="btXoa" runat="server" Text="Xóa" OnClick="btXoa_Click" CssClass="button" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>