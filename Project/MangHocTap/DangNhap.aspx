<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="MangHocTap.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/DangNhap.css" rel="stylesheet" />
    <link href="CSS/DangNhap/styleformlogin.css" rel="stylesheet" />
    <link href="CSS/DangNhap/animate-custom.css" rel="stylesheet" />
    <title>Đăng Nhập</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div id="header">
            <div id="webname">
                <a class="bnnameweb" href="#">Web học tập</a>
            </div>
            <div id="weblinkdn">
                <a href="#toregister">ĐĂNG KÝ</a>
                <a href="#tologin">ĐĂNG NHẬP</a>
            </div>
        </div>
        <div id="content">

            <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > 
                                        Email của bạn: 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ErrorMessage="(*)" ControlToValidate="txtEmaildangnhap" ForeColor="Red" ValidationGroup="tbloginerr"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmaildangnhap" ForeColor="Red" ValidationGroup="tbloginerr" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </label>
                                    <asp:TextBox ID="txtEmaildangnhap" runat="server" CssClass="username"  placeholder="eg. youremail"></asp:TextBox>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> 
                                        Mật khẩu: 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(*)" ControlToValidate="txtMatkhau" ForeColor="Red" ValidationGroup="tbloginerr"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:TextBox ID="txtMatkhau" runat="server" CssClass="password"  placeholder="eg. yourpassword" TextMode="Password"></asp:TextBox>
                                </p>
                                <p class="keeplogin"> 
                                    <asp:CheckBox ID="ckbNhotaikhoan" runat="server" CssClass="loginkeeping" />
									<label for="loginkeeping">Ghi nhớ đăng nhập</label>
								</p>
                                <p>
                                    <asp:Label ID="lblThongbao" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </p>
                                <p class="login button"> 
                                    <asp:Button ID="btnDangNhap" runat="server" Text="Login" OnClick="btnDangNhap_Click" ValidationGroup="tbloginerr" />
								</p>
                                <p class="change_link">
									Bạn chưa có tài khoản ?
									<a href="#toregister" class="to_register">Hãy đăng ký ngay</a>
								</p>
                        </div>
                        
                        <div id="register" class="animate form">
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">
                                        Tên của bạn:
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="(*)" ValidationGroup="tbloidky" ControlToValidate="txtHoten" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:TextBox ID="txtHoten" runat="server" CssClass="usernamesignup" placeholder="Tên của bạn" ></asp:TextBox>
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > 
                                        Email của bạn:
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="(*)" ValidationGroup="tbloidky" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email không hợp lệ" Display="Dynamic" ValidationGroup="tbloidky" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                                    </label>
                                    <asp:TextBox ID="txtEmail" runat="server"  placeholder="mysupermail@mail.com" ></asp:TextBox> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">
                                        Mật khẩu: 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="(*)" ValidationGroup="tbloidky" ControlToValidate="txtMatkhaudk" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:TextBox ID="txtMatkhaudk" runat="server" TextMode="Password"  placeholder="eg. X8df!90EO"></asp:TextBox>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">
                                        Nhập lại mật khẩu: 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="(*)" ValidationGroup="tbloidky" ControlToValidate="txtReMatkhaudk" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Nhập lại MK không đúng" ValidationGroup="tbloidky" ControlToCompare="txtMatkhaudk" ControlToValidate="txtReMatkhaudk" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                    </label>
                                    <asp:TextBox ID="txtReMatkhaudk" runat="server" TextMode="Password" placeholder="eg. X8df!90EO"></asp:TextBox>
                                </p>
                                <p> 
                                    <label for="yourphonesignup" class="yourphone" > Số điện thoại</label>
                                    <asp:TextBox ID="txtSodienthoai" runat="server" placeholder="(+84)123456789" ></asp:TextBox> 
                                </p>
                                <p> 
                                    <label for="yourbirthdaysignup" class="yourbirthday" > Ngày sinh: </label>
                                    <asp:DropDownList ID="ddlNgay" runat="server"></asp:DropDownList>
                                    <asp:DropDownList ID="ddlThang" runat="server"></asp:DropDownList>
                                    <asp:DropDownList ID="ddlNam" runat="server"></asp:DropDownList>
                                </p>
                                <p class="pradiogioitinh">
                                    <label for="gioitinhsignup" class="gioitinh" > Giới tính:<asp:RadioButton ID="Gioitinhnam" CssClass="Radiogt" runat="server" Text="Nam" GroupName="gioitinh" Checked="true" /></label>
                                    <asp:RadioButton ID="Gioitinhnu" CssClass="Radiogt" runat="server" Text="Nữ" GroupName="gioitinh" />
                                </p>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                              <ContentTemplate>
                                <p> 
                                    <label for="yourstudysignup" class="truonglop" > Bạn học trường nào?</label>
                                    <asp:DropDownList ID="ddlChontruong" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChontruong_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlChontruong" ErrorMessage="(*)" InitialValue="0" ValidationGroup="tbloidky" ForeColor="Red"></asp:RequiredFieldValidator>
                                </p>
                                  <asp:Panel ID="Panelchonkhoa" runat="server" Visible="False">
                                    <p> 
                                        <label for="yourstudysignup" class="truonglop" > Bạn học khoa nào?</label>
                                        <asp:DropDownList ID="ddlChonKhoa" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChonKhoa_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlChonKhoa" ErrorMessage="(*)" ForeColor="Red" InitialValue="0" ValidationGroup="tbloidky"></asp:RequiredFieldValidator>
                                    </p>
                                  </asp:Panel>
                                  <asp:Panel ID="PanelChonNganh" runat="server" Visible="False">
                                     <p> 
                                        <label for="yourstudysignup" class="truonglop" > Bạn học ngành nào?</label>
                                        <asp:DropDownList ID="ddlChonNganh" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChonNganh_SelectedIndexChanged"></asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlChonNganh" ErrorMessage="(*)" ForeColor="Red" InitialValue="0" ValidationGroup="tbloidky"></asp:RequiredFieldValidator>
                                    </p>
                                  </asp:Panel>
                                  <asp:Panel ID="PanelChonkhoahoc" runat="server" Visible="False">
                                     <p> 
                                        <label for="yourstudysignup" class="truonglop" > Bạn học Khóa bao nhiêu?</label>
                                        <asp:DropDownList ID="ddlChonKhoahoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChonKhoahoc_SelectedIndexChanged"></asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlChonKhoahoc" ErrorMessage="(*)" ForeColor="Red" InitialValue="0" ValidationGroup="tbloidky"></asp:RequiredFieldValidator>
                                    </p>
                                  </asp:Panel>
                                  <asp:Panel ID="PanelChonLop" runat="server" Visible="False">
                                    <p> 
                                        <label for="yourstudysignup" class="truonglop" > Bạn học lớp nào?</label>
                                        <asp:DropDownList ID="ddlChonLop" runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlChonLop" ErrorMessage="(*)" ForeColor="Red" InitialValue="0" ValidationGroup="tbloidky"></asp:RequiredFieldValidator>
                                    </p>
                                </asp:Panel>
                                  <p>
                                      <asp:Label ID="lblThongbaodky" runat="server" Text="" ForeColor="Red"></asp:Label>
                                  </p>
                                <p class="signin button"> 
                                    <asp:Button ID="btnDangky" runat="server" Text="Sign up" ValidationGroup="tbloidky" OnClick="btnDangky_Click" />
								</p>
                             </ContentTemplate>
                            </asp:UpdatePanel>
                                <p class="change_link">  
									Bạn đã có tài khoản ?
									<a href="#tologin" class="to_register"> Trở lại đăng nhập </a>
                                </p>
                            </div>
                        </div>
                </div>

        </div>
        <div id="footer">
            <div id="footerinfo">
                    <ul>
                        <li><a href="#toregister">ĐĂNG KÝ</a></li>
                        <li><a href="#tologin">ĐĂNG NHẬP</a></li>
                    </ul>
                    <p>
                        WEB HỌC TẬP COPYRIGHT © 2013 BETA 
                    </p>
            </div>
        </div>
          
    </div>
    </form>
</body>
</html>
