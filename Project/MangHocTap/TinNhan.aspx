<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TinNhan.aspx.cs" Inherits="MangHocTap.TinNhan1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/BoxTinNhan.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="BoxTinnhan">
        <asp:Timer ID="Timer2" runat="server" Interval="17000" OnTick="Timer2_Tick"></asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

        <div class="dsbanbe">
            <div class="headdsbanbe">
                
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="height:32px;text-align:center;"><label style="font-family:Arial; font-size:20px; font-weight:800; color:blueviolet; ">Hộp Thư Đến</label></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="divTimkiembb">
                                <asp:TextBox ID="txtTimkiembb" CssClass="txtTimkiembb" runat="server" BorderStyle="None" Height="28px" Width="180px"></asp:TextBox>
                                <asp:ImageButton ID="lbtnTimkiembb" CssClass="lbtnTimkiembb" Width="28px" Height="28px" ImageUrl="~/Images/seach35x35.png" runat="server" OnClick="lbtnTimkiembb_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
                
            </div>
            <div class="contentdsbanbe">
                <asp:DataList ID="DataListdsbanbe" CssClass="DataListdsbanbe" runat="server" Width="100%" CellPadding="4" CellSpacing="4" ForeColor="#333333" OnItemCommand="DataListdsbanbe_ItemCommand">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#E3EAEB" />
                    <ItemTemplate>
                        <div class="ItemFriend">
                        <asp:LinkButton ID="lbtnSelectbb" CommandName='<%#Eval("id") %>' runat="server">
                            <asp:Image ID="imgAvatarbb" CssClass="imgAvatarbb" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' runat="server" Width="50px" Height="50px" />
                            <div class="Hotenbb">
                                <asp:Label ID="Tenbb" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                            </div>
                            <div class="imgStatusbb">
                                <asp:Image ID="imgStatusbb" ImageUrl='<%#getTrangthai(int.Parse(Eval("trangthai").ToString())) %>' runat="server" Width="15px" Height="15px" />
                            </div>
                        </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </div>
        </div>
        <div class="noidungtn">
            <div class="ndtop">
                <asp:Label ID="lblIDBanbe" runat="server" Text="Label" Visible="False"></asp:Label>
                <div style="width:100%; float:left; text-align:center; line-height:40px;">
                    <asp:Label ID="lblTenbangui" runat="server" Text="Name" Font-Bold="True" Font-Size="20px" ForeColor="#0066FF"></asp:Label>
                </div>
            </div>
            <div class="ndcontent">
                <asp:DataList ID="DataListTinnhan" runat="server">
                    <ItemTemplate>
                        <div class="clslistTinnhan">
                            <div class="divavtNguoigui">
                                <asp:Image ID="imgavtNguoigui" Height="45" Width="45" ImageUrl='<%#getavatarsv(int.Parse(Eval("nguoigui").ToString())) %>' runat="server" />
                            </div>
                            <div class="listcontenttn">
                                <div class="divnguinhan">
                                    <asp:Label ID="lblTennguoigui" runat="server" Text='<%#getnamesv(int.Parse(Eval("nguoigui").ToString())) %>' ForeColor="Blue" Font-Bold="True"></asp:Label>
                                    <asp:Label ID="lblThoigiangui" CssClass="lblThoigiangui" runat="server" Text='<%#Eval("ngaynhan") %>' ForeColor="Gray" Font-Size="Small"></asp:Label>
                                </div>
                                <asp:Label ID="lblNoidung" CssClass="lblNoidungtn" runat="server" Text='<%#Eval("noidung") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="ndfooter">
                <table class="tabletool">
                    <tr>
                        <td style="height:65px">
                            <asp:TextBox ID="txtTinnhan" CssClass="txtTinnhan" runat="server" Height="100%" TextMode="MultiLine" Width="100%" Enabled="False" OnTextChanged="txtTinnhan_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;">
                            <asp:CheckBox ID="ckbChonGui" runat="server" Height="25px" Text="Nhấn Enter để gửi" CssClass="ckbChonGui" />
                            <asp:Button ID="btnGui" runat="server" Text="Trả Lời" Height="25px" Width="90px" BackColor="#3366FF" ForeColor="White" Enabled="False" OnClick="btnGui_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

           </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName ="tick" />
            </Triggers>
        </asp:UpdatePanel>
    </div>

</asp:Content>
