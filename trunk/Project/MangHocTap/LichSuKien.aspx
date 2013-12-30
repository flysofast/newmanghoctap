<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LichSuKien.aspx.cs" Inherits="MangHocTap.LichSuKien" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/CSS/simpleandperfect_nam.css" rel="stylesheet" />
    <link href="CSS/controls.css" rel="stylesheet" />
    <style type="text/css">
        .calendar_title {
            background: #1ba1e2;
            color: white;
        }

        table {
            border-spacing: 0;
        }

        .auto-style1 {
            width: 82px;
        }

        .popup {
            position: fixed;
            left: 500px;
            z-index: 99;
            background-color: #e0e7ff;
        }

        a:visited, a {
            text-decoration: none;
        }

            a:hover {
                color: orange;
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

        .auto-style2 {
            height: 24px;
            width: 50%;
        }
    </style>
    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <img src="Images/loading.gif" style="position: fixed; top: 50%; left: 50%; z-index: 100" width="80" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlThemSuKien" runat="server" CssClass="popup" Visible="false">
                <table style="width: 100%; padding: 5px; font-family: Tahoma; font-size: 12px; border: #0094ff 2px solid;">
                    <tr>
                        <td style="text-align: center; font-size: large; font-family: 'Helvetica Neue';" colspan="2"><strong>
                            <asp:Label ID="lbEventDatetime" runat="server" Text="Cập nhật sự kiện" ForeColor="#0099FF" Font-Bold="True" Font-Size="12px"></asp:Label>
                        </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Tên sự kiện </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="tbTenSK" runat="server" Width="165px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Mô tả nội dung</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="tbNoidung" runat="server" Width="165px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Bắt đầu lúc</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="tbSH" runat="server" Width="21px"></asp:TextBox>
                            giờ
                            <asp:TextBox ID="tbSM" runat="server" Width="21px"></asp:TextBox>
                            &nbsp;phút &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Kết thúc lúc</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="tbEH" runat="server" Width="21px"></asp:TextBox>
                            giờ&nbsp;<asp:TextBox ID="tbEM" runat="server" Width="21px"></asp:TextBox>
                            &nbsp;phút &nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Địa điểm</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="tbDiadiem" runat="server" Width="165px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Người tham gia (cách nhau bởi dấu ;)</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="tbNguoiThamGia" runat="server" Width="165px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center" colspan="2">
                            <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Label ID="lbXacNhan" runat="server" Text="Bạn có thực sự muốn xóa sự kiện này không?"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding-bottom: 20px">
                            <asp:Button ID="btXoaOK" runat="server" OnClick="btXoaOK_Click" Text="Xóa" Width="50px" CssClass="button xoa" />
                            <asp:Button ID="btXoaCancel" runat="server" OnClick="btXoaCancel_Click" Text="Không" Width="50px" CssClass="button" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" colspan="2">
                            <asp:Button ID="btOK" runat="server" CssClass="button" Text="Cập nhật" Width="70px" OnClick="btOK_Click1" />
                            <asp:Button ID="btXoa" runat="server" CssClass="button xoa" OnClick="btXoa_Click" Text="Xóa" Visible="False" Width="70px" />
                            <asp:Button ID="btHuy" runat="server" CssClass="button" Text="Hủy bỏ" Width="70px" OnClick="btHuy_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlBackground" runat="server" CssClass="background" Visible="false"></asp:Panel>

            <table style="width: 100%; font-family: sans-serif; font-size: 14px;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" CellPadding="0" ShowGridLines="True" NextMonthText="►" OnDayRender="Calendar1_DayRender" PrevMonthText="◄" Width="50%" NextPrevStyle-ForeColor="White">
                            <DayHeaderStyle BorderColor="#1ba1e2" ForeColor="#666666" />
                            <DayStyle BorderColor="#1ba1e2" ForeColor="#666666" />
                            <SelectedDayStyle BackColor="#1ba1e2" />
                            <TitleStyle BorderColor="#1ba1e2" CssClass="calendar_title" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr >
                    <td align="center" class="auto-style1">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1">Khung nhìn</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" style="color:#666666;">
                            <asp:ListItem Selected="True" style="margin-left:6px;margin-right:6px;" Value="7">&nbsp;Xem theo tuần</asp:ListItem>
                            <asp:ListItem Value="1">&nbsp;Xem theo ngày</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                  <tr >
                    <td align="center" class="auto-style1">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="z-index: 0; width: 850px;">
                        <DayPilot:DayPilotCalendar ID="dpcSchedule" runat="server" CssOnly="True" DataEndField="ketthuc" DataStartField="batdau" DataTextField="tensukien" DataValueField="ID" EventClickHandling="PostBack" OnTimeRangeSelected="dpcSchedule_TimeRangeSelected" TimeRangeSelectedHandling="PostBack" Days="7" OnEventClick="dpcSchedule_EventClick" BusinessBeginsHour="0" BusinessEndsHour="24" HeaderDateFormat="dddd" CssClassPrefix="simpleandperfect_nam" BorderStyle="NotSet" ColumnMarginRight="5" HideFreeCells="True" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
