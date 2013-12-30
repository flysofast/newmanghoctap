<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucThongBaoKy.ascx.cs" Inherits="MangHocTap.ucMaster.ucThongBaoKy" %>

<link href="/CSS/Thongbao.css" rel="stylesheet" />
<script src="/JQuery/JSNotiface.js"></script>

<asp:Timer ID="Timer1" runat="server" Interval="50000" OnTick="Timer1_Tick"></asp:Timer>

<div class="fbbg">
    <div class="maindiv facebook">
        <ul class="naviul">
            <li class="banbe"><span class="notired">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <%=solmketbban %>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName ="tick" />
                    </Triggers>
                </asp:UpdatePanel>
                </span><a class="a111 showfrindreq mesgnotfctn spritimg notifriend" title="Click to View Friend Requests">ws</a>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                <ul class="ulbanbe">
                    <li>
                        <div class="divtbbanbe">
                            <div class="imgtopshownt"><img src="/CSS/Images/topshownoti.png" width="20" height="11" alt="ER" /></div>
                            <div class="divtbheader">
                                Lời mời kết bạn
                            </div>
                            <div class="divtbcontent">
                                <asp:Repeater ID="Repeaterlmketban" runat="server" OnItemCommand="Repeaterlmketban_ItemCommand">
                                    <ItemTemplate>
                                        <div class="divtbkbcontent">
                                            <asp:Image ID="imgAvatarbb" CssClass="imgAvatarbb" Width="45px" Height="45px" runat="server" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' />
                                            <div class="clsTennggkb">
                                                <asp:Label ID="lblTenngkb" runat="server" Text='<%#Eval("hoten") %>'></asp:Label> 
                                            </div>
                                            <div class="btnKetban">
                                                <asp:LinkButton ID="lbtnXacnhan" CommandName="Xacnhan" CommandArgument='<%#Eval("id") %>' runat="server"><img width="70" height="23" src="/Images/Xacnhanbanbe.png" alt="Loi anh" /></asp:LinkButton>
                                                <asp:LinkButton ID="lbtnHuybo" CommandName="Huybo" CommandArgument='<%#Eval("id") %>' runat="server"><img src="/Images/Huyboloimoi.png" alt="Loi anh" width="60" height="23" /></asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="lblThongbaotn" >
                                    <asp:Label ID="lblThongbaolmkb" runat="server" Text="Không có lời mời kết bạn nào" Font-Italic="True" Visible="False"></asp:Label>
                                </div>
                            </div>
                            <div class="divtbfooter">
                                <a href="PageBanbecuatoi.aspx">Danh sách bạn bè</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName ="tick" />
                </Triggers>
            </asp:UpdatePanel>
            </li>
            <li class="tinnhan"><span class="notired">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <%=sotinnhan %>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </span><a class="a111 showmesgreq spritimg messagenormal" title="Click to View New Messages">ws</a>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
            <ul class="ultinnhan">
                <li>
                    <div class="divtbtinnhan">
                        <div class="imgtopshownt"><img src="/CSS/Images/topshownoti.png" width="20" height="11" alt="ER" /></div>
                        <div class="divtbheader">
                            Hộp thư đến
                        </div>
                        <div class="divtbcontent">
                            <asp:Repeater ID="RepeaterTBTinnhan" runat="server">
                                <ItemTemplate>
                                    <a href='<%#"TinNhan.aspx?idnt="+Eval("nguoigui") %>'>
                                    <div class="divtbtncontent">
                                        <asp:Image ID="imgAvatartn" CssClass="imgAvatartn" Width="45px" Height="45px" runat="server" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' />
                                        <div class="clsTennggui">
                                            <asp:Label ID="lblTennggui" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                                            <asp:Label ID="lblsSotinnhan" runat="server" Text=<%#"("+Eval("sotin")+")" %>></asp:Label>
                                        </div>
                                        <asp:Label ID="lblttNoidung" CssClass="lblttNoidung" runat="server" Text='<%#Eval("noidung") %>'></asp:Label>
                                        <asp:Label ID="lblNgaygui" CssClass="lblNgaygui" runat="server" Text='<%#Eval("ngaynhan") %>' Font-Size="11px"></asp:Label>
                                    </div>
                                        </a>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="lblThongbaotn" >
                                <asp:Label ID="Thongbaotn" runat="server" Text="Không có tin nhắn nào mới" Font-Italic="True" Visible="False"></asp:Label>
                            </div>
                                        
                        </div>
                        <div class="divtbfooter">
                            <a href="TinNhan.aspx">Đến hòm thư của bạn</a>
                        </div>
                    </div>
                </li>
            </ul>
                </ContentTemplate>
            </asp:UpdatePanel>
            </li>
            <li class="thongbao"><span class="notired">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <%=sothongbao %>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </span><a class="a111 showmesgreq spritimg nottifinormal" title="Click to View Notifications">ws</a>
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                <ul class="ulthongbao">
                <li>
                    <div class="divtbthongbao">
                        <div class="imgtopshownt"><img src="/CSS/Images/topshownoti.png" width="20" height="11" alt="ER" /></div>
                        <div class="divtbheader">
                            Thông báo
                        </div>
                        <div class="divtbcontent">
                            <asp:Repeater ID="RepeaterThongbao" runat="server">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnLinknhom" runat="server">
                                        <div class="divtbtbcontent">
                                            <div class="clsTennggui">
                                                <asp:Label ID="lblTennggui" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                                            </div>
                                            <asp:Label ID="lblttNoidung" CssClass="lblttNoidung" runat="server" Text='<%#Eval("NoiDung") %>'></asp:Label>
                                        </div>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="lblThongbaotn" >
                                <asp:Label ID="lblThongbaocuatb" runat="server" Text="Không có thông báo nào mới" Font-Italic="True" Visible="False"></asp:Label>
                            </div>
                        </div>
                        <div class="divtbfooter">
                            <a href="#">Xem tất cả</a>
                        </div>
                    </div>
                </li>
            </ul>
                   </ContentTemplate>
                </asp:UpdatePanel>
            </li>

        </ul>
    </div>
</div>

    