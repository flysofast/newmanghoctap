<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PageBanbecuatoi.aspx.cs" Inherits="MangHocTap.PageBanbecuatoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/PageBanbecuatoi.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="clssuattcn">
    <div class="header-ttcn">
        <h3>My Friend</h3>
    </div>
    <div class="content-ttcn">
        <div class="clschangepf">
            <h3 align="center" style="color: #008000; margin-bottom:25px">Danh sách bạn bè</h3>
            <asp:Label ID="lblSobanbecuaban" CssClass="lblSobanbecuaban" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="ctdsbanbe">
            <asp:DataList ID="DataListBanbecuatoi" runat="server" RepeatColumns="2" Width="100%" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" OnItemCommand="DataListBanbecuatoi_ItemCommand">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                <ItemTemplate>
                    <div class="divctbanbetk">
                        <asp:Image ID="imgAvatarbb" CssClass="clsimgAvatarbb" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' Width="60px" Height="60px" runat="server" />
                        <div class="clsTenbanbe">
                            <asp:Label ID="lblTenbanbe" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                        </div>
                        <div class="divtttruonglop">
                            <div class="divPhandong">
                                <label class="lb1">Trường: </label>
                                <asp:Label ID="lblTruongbb" CssClass="lb2" runat="server" Text='<%#Eval("tentruong") %>'></asp:Label>
                            </div>
                            <div class="divPhandong">
                                <label class="lb1">Khoa: </label>
                                <asp:Label ID="lblKhoabb"  CssClass="lb2" runat="server" Text='<%#Eval("tenkhoa") %>'></asp:Label>
                            </div>
                            <div class="divPhandong">
                                <label class="lb1">Ngành: </label>
                                <asp:Label ID="lblNganhbb"  CssClass="lb2" runat="server" Text='<%#Eval("tennganh") %>'></asp:Label>
                                <label style="margin-left:2px;" class="lb1">Lớp: </label>
                                <asp:Label ID="lblLopbb"  CssClass="lb2" runat="server" Text='<%#Eval("tenlop") %>'></asp:Label>
                            </div>
                                        
                        </div>
                        <div class="btnlabanbe">
                            <asp:LinkButton ID="lbtnHuybanbe" CommandName="Huyketban" CommandArgument='<%#Eval("id") %>' runat="server"><img width="67" height="28" src="Images/Huyboloimoi.png" alt="Loi anh" /></asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <div>
                <asp:Label ID="lblThongbaokhongcoban" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
        </div>
    </div>
    </div>
    

</asp:Content>
