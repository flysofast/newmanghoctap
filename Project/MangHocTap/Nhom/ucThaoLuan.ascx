<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucThaoLuan.ascx.cs" Inherits="MangHocTap.Nhom.NhomChung.Truong.uc.ucThaoLuan" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<link href="/CSS/controls.css" rel="stylesheet" />
<style>
    .tenTaiKhoan {
        font-weight: 800;
        color: #ff8500;
    }

    .ngaydang {
        font-weight: 600;
        color: #258CB9;
    }

    .noidungbaiviet {
        line-break: auto;
        word-wrap: break-word;
        display: inline-block;
    }

    .background {
        position: fixed;
        height: 100%;
        width: 100%;
        top: 0;
        left: 0;
        background: #000000;
        z-index: 98;
        opacity: 0.7;
    }

    .popup {
        position: fixed;
        left: 20%;
        top: 10%;
        z-index: 99;
        width: 70%;
        background-color: #e0e7ff;
    }

    .auto-style1 {
        height: 26px;
    }
</style>
<asp:Label ID="lbMaNhom" runat="server" Text="" Visible="false"></asp:Label>
<asp:Label ID="lbLoaiNhom" runat="server" Text="" Visible="false"></asp:Label>
<asp:Panel runat="server" Visible="false" ID="pnlNewPost1">
    <div class="background"></div>
    <div class="popup">
        <table style="width: 100%; padding: 5px; font-family: Tahoma; font-size: 12px; border: #0094ff 2px solid; height: 100%">
            <tr>
                <td style="text-align: center; font-size: large; font-family: 'Helvetica Neue';" colspan="2" class="auto-style1"><strong>
                    <asp:Label runat="server" Text="Đăng bài viết mới:" ForeColor="#0099FF" Font-Bold="True" Font-Size="14px"></asp:Label>
                    &nbsp;</strong></td>
            </tr>
            <tr>
                <td style="width:15%">Loại bài viết:</td>
                <td style="text-align: left; font-family: 'Helvetica Neue';">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Font-Bold="False" ForeColor="#0099FF">
                        <asp:ListItem Value="tb" style="color: red; font-weight: 800; margin-right: 5px;">&nbsp;Thông báo</asp:ListItem>
                        <asp:ListItem Value="tm" Selected="True">&nbsp;Thắc mắc</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="width:15%">Nội dung bài viết: </td>
                <td style="text-align: left; font-family: 'Helvetica Neue';">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl></td>
            </tr>
            <tr>
                <td style="text-align: right" colspan="2">
                    <asp:Button ID="btPostOK" CssClass="button" runat="server" Text="Đăng bài" OnClick="btPostOK_Click" />
                    <asp:Button ID="btCancel" CssClass="button" runat="server" Text="Hủy bỏ" OnClick="btCancel_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
<table style="width:100%">
    <tr>
        <td>
        <asp:Button ID="btNewPost" CssClass="button" Style="float: right;" runat="server" Text="Tạo bài viết mới" OnClick="btNewPost_Click" />
        </td>
    </tr>
    <tr>
       <td> <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:DataList ID="dlQuestionPosts" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" BorderColor="White">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="#EFF3FB" />
                                <ItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>

                                            <td style="height: 5px" colspan="2"></td>
                                        </tr>
                                        <tr style="padding-top: 10px">
                                            <td rowspan="4" style="vertical-align: top;" class="auto-style2">&nbsp;</td>
                                            <td rowspan="4" style="width: 10%; vertical-align: top;">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("avnguoihoi") %>' Width="120" />
                                            </td>
                                            <td rowspan="4" style="width: 2%; vertical-align: top;">&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lbAskingAcc" runat="server" CssClass="tenTaiKhoan" Text='<%#  Eval("nguoihoi") %>'></asp:Label>
                                                <br />
                                                <asp:Label ID="lbPostDate" CssClass="ngaydang" runat="server" Text='<%#  Eval("ngayhoistring") %>'></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <asp:Label ID="lbQuestion" CssClass="noidungbaiviet" runat="server" Text='<%# Eval("noidunghoi") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">&nbsp;</td>
                                            <td colspan="2" style="height: 10px;">&nbsp;</td>
                                            <td>
                                                <asp:Repeater ID="rpAnsPosts" runat="server" DataSource='<%# Eval("traloi") %>'>
                                                    <ItemTemplate>
                                                        <table style="width: 90%; margin-top: 2px; background-color: #d8e3f8;">
                                                            <tr>
                                                                <td style="width: 5%; vertical-align: top;" colspan="4">
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("avatar") %>' Width="30" />

                                                                </td>
                                                                <td style="width: 5px;"></td>
                                                                <td>
                                                                    <asp:Label ID="lbReplyingAcc" runat="server" CssClass="tenTaiKhoan" Text='<%# Eval("hoten") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label1" runat="server" CssClass="ngaydang" Style="font-size: 9px;" Text='<%# Eval("ngaydangstring") %>'></asp:Label>
                                                                    <asp:Label ID="lbReply" runat="server" CssClass="noidungbaiviet" Text='<%# Eval("noidung") %>' Width="98%"></asp:Label>

                                                                </td>
                                                            </tr>
                                                            <tr style="height: 5px;"></tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">&nbsp;</td>
                                            <td colspan="2" style="height: 10px;">&nbsp;</td>

                                            <td style="padding-top: 20px;">
                                                <asp:TextBox ID="tbComment" runat="server" BorderWidth="1px" BorderColor="LightGray" BackColor="#FAFCFE" BorderStyle="solid" Height="70px" placeholder="Ý kiến của bạn..." Style="resize: none;" TextMode="MultiLine" Width="90%" Font-Italic="True" Font-Names="Tahoma" Font-Size="12px"></asp:TextBox><br />

                                                <asp:LinkButton ID="lbtReply" runat="server" CssClass="button" Style="float: right; margin-right: 9.9%; margin-top: 5px; width: 50px; text-align: center" CommandArgument='<%# Eval("mabaiviet") %>' OnClick="lbtReply_Click">Trả lời</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="height: 50px; width: 100%"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="background: white; height: 2px; width: 100%"></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>

                            <br />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel></td>
    </tr>
</table>
