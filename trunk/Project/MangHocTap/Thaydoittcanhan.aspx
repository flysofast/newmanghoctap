<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Thaydoittcanhan.aspx.cs" Inherits="MangHocTap.Thaydoittcanhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Thaydoittcanhan.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tabs ul li:first").addClass("active");
            $("#tabs .contentab:gt(0)").hide();
            $("#tabs ul li").click(function () {
                $("#tabs ul li").removeClass('active');
                //var current_index = $(this).index(); // Sử dụng cho jQuery >= 1.4.x
                var current_index = $("#tabs ul li").index(this);
                $("#tabs ul li:eq(" + current_index + ")").addClass("active");
                $("#tabs .contentab").hide();
                $("#tabs .contentab:eq(" + current_index + ")").fadeIn(100);
            });
        });
	    </script>
    <style type="text/css">
        .style7
        {
            width: 157px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="clssuattcn">
    <div class="header-ttcn">
        <h3>Profile</h3>
    </div>
    <div class="content-ttcn">
        <div class="clschangepf">
            <h3 align="center" style="color: #008000; margin-bottom:25px">Chỉnh sửa thông tin cá nhân</h3>
            <label style="color:#008000; font-weight:800;">Tài khoản: </label>
            <asp:Label ID="lblemailsvdn" CssClass="lblKhdangnhap" runat="server"></asp:Label>
            <asp:Label ID="lblsvdangnhap" CssClass="lblKhdangnhap" runat="server"></asp:Label>

            <div class="tabcontrol">
                <div id="tabs">
                <ul>
                    <li>Thông tin cá nhân</li>
                    <li>Thông tin khác</li>
                </ul>
                
                <div class="contentab">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                    <div class="clsthongtintk">
                        <label class="labelshowedit">Họ tên: </label>
                        <asp:Label ID="lblhoten" CssClass="lblTTedittk" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lnkbtntentk" CssClass="linkedittk" runat="server" OnClick="lnkbtntentk_Click">Chỉnh sửa</asp:LinkButton>
                        <asp:Panel ID="Panelhoten" CssClass="PanelEditprofile" runat="server" 
                            Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Nhập họ tên: "></asp:Label>
                            <asp:TextBox ID="txtedithoten" runat="server" Height="20px"></asp:TextBox>
                            <asp:Button ID="btnLuuhoten" runat="server" Text="Lưu" Height="26px" 
                                Width="40px" Font-Bold="True"  
                                ValidationGroup="tbsht" OnClick="btnLuuhoten_Click" />
                            <asp:Button ID="btnHuyhoten" runat="server" Text="Hủy" Height="26px" 
                                Width="40px" Font-Bold="True" OnClick="btnHuyhoten_Click"  />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtedithoten" Display="Dynamic" 
                                ErrorMessage="Bạn chưa nhập họ tên" ValidationGroup="tbsht" ForeColor="Red"></asp:RequiredFieldValidator>
                        </asp:Panel>
                    </div>

                    </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="clsthongtintk">
                        <label class="labelavt">Avatar: </label>
                        <asp:Image ID="imgThayavatar" Width="100px" Height="100px" runat="server" />
                        <asp:LinkButton ID="LinkButton1" CssClass="linkeditavt" runat="server" OnClick="LinkButton1_Click">Chỉnh sửa</asp:LinkButton>
                        <asp:Panel ID="Panelavatar" CssClass="PanelEditprofile" runat="server" 
                            Visible="False">
                            <asp:Label ID="Label8" runat="server" Text="Chọn ảnh làm avatar: "></asp:Label>
                            <asp:FileUpload ID="FileUploadavt" runat="server" Height="22px" />
                            <br />
                            <div style="text-align:center;">
                                <asp:Button ID="Button1" runat="server" Text="Lưu" Height="26px" 
                                Width="40px" Font-Bold="True"  
                                ValidationGroup="tbsht" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Hủy" Height="26px" 
                                Width="40px" Font-Bold="True" OnClick="Button2_Click"  />
                            </div>
                            
                        </asp:Panel>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                    <div class="clsthongtintk">
                        <label class="labelshowedit">Mật khẩu: </label>
                        <asp:Label ID="lblMatkhaukh" CssClass="lblTTedittk" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lnkbtnmatkhau" CssClass="linkedittk" runat="server" OnClick="lnkbtnmatkhau_Click" 
                            >Chỉnh sửa</asp:LinkButton>
                        <asp:Panel ID="Panelmatkhau" CssClass="PanelEditprofile" runat="server" 
                            Visible="False">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label5" runat="server" Text="Nhập mật khẩu cũ: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txteditmkcu" runat="server" Height="20px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txteditmkcu" ErrorMessage="Chưa nhập MK cũ" 
                                            ValidationGroup="tbao" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label6" runat="server" Text="Nhập mật khẩu mới: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txteditmkmoi" runat="server" Height="20px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txteditmkmoi" ErrorMessage="Chưa nhập MK mới" 
                                            ValidationGroup="tbao" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label7" runat="server" Text="Nhập lại mật khẩu:  "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txteditnhaplaik" runat="server" Height="20px" 
                                            TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="txteditmkmoi" ControlToValidate="txteditnhaplaik" 
                                            ErrorMessage="Nhập lại MK sai" ValidationGroup="tbao" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txteditnhaplaik" Display="Dynamic" 
                                            ErrorMessage="Bạn chưa nhập lại MK" ValidationGroup="tbao" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnLuumatkhau" runat="server" Font-Bold="True" Height="26px" 
                                            Text="Lưu" Width="40px"  
                                            ValidationGroup="tbao" OnClick="btnLuumatkhau_Click" />
                                        <asp:Button ID="btnHuymatkhau" runat="server" Font-Bold="True" Height="26px" 
                                             Text="Hủy" Width="40px" OnClick="btnHuymatkhau_Click" />
                                        <asp:Label ID="lblThongbaoloi" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>

                    <div class="clsthongtintk">
                        <label class="labelshowedit">Số điện thoại: </label>
                        <asp:Label ID="lblSodtsv" CssClass="lblTTedittk" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lnkbtnsdt" CssClass="linkedittk" runat="server" OnClick="lnkbtnsdt_Click" 
                            >Chỉnh sửa</asp:LinkButton>
                        <asp:Panel ID="Panelsdt" CssClass="PanelEditprofile" runat="server" 
                            Visible="False">
                            <asp:Label ID="Label2" runat="server" Text="Nhập SĐT: "></asp:Label>
                            <asp:TextBox ID="txteditsdt" runat="server" Height="20px"></asp:TextBox>
                            <asp:Button ID="btnLuusdt" runat="server" Text="Lưu" Height="26px" 
                                Width="40px" Font-Bold="True"
                                ValidationGroup="tbsdt" OnClick="btnLuusdt_Click" />
                            <asp:Button ID="btnHuysdt" runat="server" Text="Hủy" Height="26px" 
                                Width="40px" Font-Bold="True" OnClick="btnHuysdt_Click"  />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txteditsdt" ErrorMessage="Chưa nhập SĐT" 
                                ValidationGroup="tbsdt" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToValidate="txteditsdt" Display="Dynamic" ErrorMessage="Phải là kiểu số" 
                                Operator="DataTypeCheck" Type="Integer" ValidationGroup="tbsdt" ForeColor="Red"></asp:CompareValidator>
                        </asp:Panel>
                    </div>

                    <div class="clsthongtintk">
                        <label class="labelshowedit">Ngày sinh: </label>
                        <asp:Label ID="lblNgaysinhsv" CssClass="lblTTedittk" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lnkbtnngaysinh" CssClass="linkedittk" runat="server" OnClick="lnkbtnngaysinh_Click" 
                            >Chỉnh sửa</asp:LinkButton>
                        <asp:Panel ID="Panelngsinh" CssClass="PanelEditprofile" runat="server" 
                            Visible="False">
                            <asp:Label ID="Label3" runat="server" Text="Chọn ngày sinh của bạn: "></asp:Label>
                            <asp:DropDownList ID="ddlChonngay" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlChonthang" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlChonnam" runat="server"></asp:DropDownList>
                            <asp:Button ID="btnLuuns" runat="server" Text="Lưu" Height="26px" 
                                Width="40px" Font-Bold="True"  
                                ValidationGroup="tbns" OnClick="btnLuuns_Click" />
                            <asp:Button ID="btnHuyns" runat="server" Text="Hủy" Height="26px" 
                                Width="40px" Font-Bold="True" OnClick="btnHuyns_Click"  />
                        </asp:Panel>
                    </div>
                    
                    <div class="clsthongtintk">
                        <label class="labelshowedit">Giới tính: </label>
                        <asp:Label ID="lblGioitinhsv" CssClass="lblTTedittk" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lnkbtngtinh" CssClass="linkedittk" runat="server" OnClick="lnkbtngtinh_Click" 
                            >Chỉnh sửa</asp:LinkButton>
                        <asp:Panel ID="Panelgioitinh" CssClass="PanelEditprofile" runat="server" 
                            Visible="False">
                            <asp:Label ID="Label4" runat="server" Text="Chọn giới tính của bạn: "></asp:Label>
                            <asp:RadioButton ID="RadioNam" Text="Nam" runat="server" GroupName="gioitinh" />
                            <asp:RadioButton ID="RadioNu" Text="Nữ" runat="server" GroupName="gioitinh" />
                            <asp:Button ID="btnLuugtinh" runat="server" Text="Lưu" Height="26px" 
                                Width="40px" Font-Bold="True"  
                                ValidationGroup="tbemail" OnClick="btnLuugtinh_Click" />
                            <asp:Button ID="btnHuygtinh" runat="server" Text="Hủy" Height="26px" 
                                Width="40px" Font-Bold="True" OnClick="btnHuygtinh_Click"  />
                        </asp:Panel>
                    </div>

                    </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

                <%--<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="ImageLoadTTKH" CssClass="ImageLoadTTKH" runat="server" />
                </ProgressTemplate>
                </asp:UpdateProgress>--%>
                <!-- end tab1 content -->
                <div class="contentab">
                
                </div>
                <!-- end tab2 content -->
                </div>
            </div>
        </div>
    </div>
    </div>


</asp:Content>
