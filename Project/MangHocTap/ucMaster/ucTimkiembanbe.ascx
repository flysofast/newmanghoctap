<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimkiembanbe.ascx.cs" Inherits="MangHocTap.ucMaster.ucTimkiembanbe" %>

<link href="/CSS/ucTimkiembanbe.css" rel="stylesheet" />
<div>
    <div class="inputtimkiembb">
        <asp:TextBox ID="txtTimbanbe" placeholder="Tìm kiếm bạn bè..." runat="server" CssClass="txtTimbanbe" Height="25px" Width="135px" BorderStyle="None" OnTextChanged="txtTimbanbe_TextChanged"></asp:TextBox>
        <asp:ImageButton ID="imgbtnTimbanbe" CssClass="imgbtnTimbanbe" runat="server" Width="25px" Height="25px" ImageUrl="~/Images/seach-iconbb.png" OnClick="imgbtnTimbanbe_Click" />
    </div>
</div>