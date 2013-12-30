<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDSBanBe.ascx.cs" Inherits="MangHocTap.ucMaster.ucDSBanBe" %>

<link href="/CSS/DSBanBe.css" rel="stylesheet" />

<div class="listFriend">
    <asp:Timer ID="Timer1" runat="server" Interval="500000"  OnTick="Timer1_Tick"></asp:Timer>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <asp:Repeater ID="RepeaterBanbe" runat="server">
        <ItemTemplate>
            <div class="contentshowFR">
                <a href='<%#"/TinNhan.aspx?idnt="+Eval("id") %>'>
                    <asp:Image ID="imgAvatarFR" CssClass="imgAvatarFR" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' Width="35px" Height="35px" runat="server" />
                    <div class="divnameFR">
                        <asp:Label ID="lblnameFR" CssClass="lblnameFR" runat="server" Text='<%#Eval("hoten") %>' Font-Size="10px"></asp:Label>
                    </div>
                    <div id="divstatus">
                        <asp:Image ID="status" CssClass="icon-status" ImageUrl='<%#getTrangthai(int.Parse(Eval("trangthai").ToString())) %>' runat="server" Height="11px" Width="11px" />
                    </div>
                </a>
            </div>
        </ItemTemplate>
    </asp:Repeater>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName ="tick" />
        </Triggers>
    </asp:UpdatePanel>
</div>