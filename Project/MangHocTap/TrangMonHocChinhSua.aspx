<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMonHoc.master" AutoEventWireup="true" CodeBehind="TrangMonHocChinhSua.aspx.cs" Inherits="MangHocTap.TrangMonHocChinhSua" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/MonHoc/chinhsua.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="submonhoc">
        <div class="imgheader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungcsmh.png" />
        </div>
        <div class="bodermonhoc">
            <div class="tieudeheader">
                <asp:Label ID="lbtieude" runat="server" Visible="true" Text=">> Thông tin chi tiết môn học"></asp:Label>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="kqmh">
                        <div>
                            <div style="background-color: #E8F3FB; float: left; font-weight: 800; color: #258CB9; margin-bottom: 10px; width: 820px;">Thông tin chung</div>
                            <div style="float: left; margin-bottom: 15px;">
                                <div style="float: left; width: 99%;">
                                    <div style="float: left; width: 99%; margin-bottom: 5px;">
                                        <div style="float: left; margin-right: 23px;" class="lbcsmh">
                                            <asp:Label ID="Label1" runat="server" Text="Mã môn học"></asp:Label>
                                        </div>
                                        <div style="float: left;">
                                            <asp:TextBox ID="txtmmh" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div style="float: left; width: 99%; margin-bottom: 5px;">

                                        <div style="float: left; margin-right: 16px;" class="lbcsmh">
                                            <asp:Label ID="Label2" runat="server" Text="Tên môn học"></asp:Label>
                                        </div>
                                        <div style="float: left;">
                                            <asp:TextBox ID="txttmh" CssClass="tbmhoc" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div style="float: left;">
                                    <div style="float: left; margin-bottom: 5px; width: 800px;">
                                        <div style="float: left; margin-right: 39px;" class="lbcsmh">
                                            <asp:Label ID="Label3" runat="server" Text="Số tín chỉ"></asp:Label>
                                        </div>
                                        <div style="float: left; margin-right: 30px;">
                                            <asp:DropDownList ID="dlstc" AutoPostBack="true"  runat="server">
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                                <asp:ListItem Value="4"></asp:ListItem>
                                                <asp:ListItem Value="5"></asp:ListItem>
                                                <asp:ListItem Value="6"></asp:ListItem>
                                                <asp:ListItem Value="7"></asp:ListItem>
                                                <asp:ListItem Value="8"></asp:ListItem>
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div style="float: left; margin-right: 10px;" class="lbcsmh">
                                            <asp:Label ID="Label4" runat="server" Text="Hệ số điểm thi"></asp:Label>
                                        </div>
                                        <div style="float: left; margin-right: 10px;">
                                            <asp:DropDownList ID="dlheso"  AutoPostBack="true" runat="server">
                                                <asp:ListItem Value="0"></asp:ListItem>
                                                <asp:ListItem Value="50"></asp:ListItem>
                                                <asp:ListItem Value="60"></asp:ListItem>
                                                <asp:ListItem Value="70"></asp:ListItem>
                                                <asp:ListItem Value="80"></asp:ListItem>
                                                <asp:ListItem Value="90"></asp:ListItem>
                                                <asp:ListItem Value="100"></asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div style="float: left; width: 800px; margin-bottom: 5px;">
                                        <div style="float: left; margin-right: 53px;" class="lbcsmh">
                                            <asp:Label ID="Label10" runat="server" Text="Học kỳ"></asp:Label>
                                        </div>
                                        <div style="float: left;">
                                            <asp:DropDownList ID="dlhocky"  AutoPostBack="true" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div style="width: 800px; margin-bottom: 5px;">
                                        <div style="float: left; margin-right: 17px;" class="lbcsmh">
                                            <asp:Label ID="Label5" runat="server" Text="Ngày bắt đầu"></asp:Label>
                                        </div>
                                        <div style="float: left; margin-right: 17px;">
                                            <div class="calen" style="float: left;">
                                                <div style="float: left;">
                                                    <asp:TextBox ID="txtcld1"  runat="server"></asp:TextBox>
                                                    <asp:Panel ID="pncalendar1" runat="server">
                                                        <div style="background-color: white; position: absolute; margin-left: 0; margin-top: 0px; float: left;">
                                                            <asp:Calendar ID="Calendar1" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" Width="200px"></asp:Calendar>
                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                                <div class="calenimg" style="float: left;">
                                                    <asp:ImageButton ID="imgbtncld1" ImageUrl="~/Images/cld_trang.jpg" runat="server" OnClick="imgbtncld1_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div style="float: left; margin-right: 13px;" class="lbcsmh">
                                            <asp:Label ID="Label6" runat="server" Text="Ngày kết thúc"></asp:Label>
                                        </div>
                                        <div style="float: left;">
                                            <div class="calen" style="float: left;">
                                                <div style="float: left;">
                                                    <asp:TextBox ID="txtcld2"  runat="server"></asp:TextBox>
                                                    <asp:Panel ID="pncalendar2" runat="server">

                                                        <div style="background-color: white; position: absolute; margin-top: 0; float: left;">
                                                            <asp:Calendar ID="Calendar2" OnSelectionChanged="Calendar2_SelectionChanged" runat="server" Width="200px"></asp:Calendar>
                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                                <div class="calenimg" style="float: left;">
                                                    <asp:ImageButton ID="imgbtncld2" ImageUrl="~/Images/cld_trang.jpg" runat="server" OnClick="imgbtncld2_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div style="float: left;margin-bottom:10px;">
                                <div id="bangtkb" style="float: left;">
                                    <div style="background-color: #E8F3FB; float: left; font-weight: 800; color: #258CB9; margin-bottom: 10px; width: 820px;">Thời khóa biểu</div>
                                    <asp:Panel ID="pnb1" runat="server">
                                        <div style="float: left; width:800px;margin-bottom:5px;">
                                            <div class="btkb" style="float: left;padding-top:2px;">Buổi 1:</div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Từ tiết</div>

                                            <div class="btkb" style="float: left;">

                                                <asp:DropDownList ID="DropDownList1" AutoPostBack="true"  runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">đến</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList2"  AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Thứ</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList3"  AutoPostBack="true" runat="server">
                                                    <asp:ListItem Value="2" Text="hai" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="ba"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="tư"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="năm"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="sáu"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="bảy"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Phòng</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:TextBox ID="txtphong1"  runat="server"></asp:TextBox>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:3px;">
                                                <asp:ImageButton ID="imgbtnb1" OnClick="imgbtnb1_Click" ImageUrl="~/Images/Delete-icon.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="10" Width="10" runat="server" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnb2" runat="server">
                                        <div style="float: left; width:800px;margin-bottom:5px;">
                                            <div class="btkb" style="float: left;padding-top:2px;">Buổi 2:</div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Từ tiết</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList4"  AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">đến</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList5"  AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Thứ</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList6"  AutoPostBack="true" runat="server">
                                                    <asp:ListItem Value="2" Text="hai" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="ba"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="tư"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="năm"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="sáu"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="bảy"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Phòng</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:TextBox ID="txtphong2"  runat="server"></asp:TextBox>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:3px;">
                                                <asp:ImageButton ID="imgbtnb2" OnClick="imgbtnb2_Click" ImageUrl="~/Images/Delete-icon.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="10" Width="10" runat="server" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnb3" runat="server">
                                        <div style="float: left;width:800px;margin-bottom:5px;">
                                            <div class="btkb" style="float: left;padding-top:2px;">Buổi 3:</div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Từ tiết</div>
                                            <div class="btkb" style="float: left;padding-top:2px;">
                                                <asp:DropDownList ID="DropDownList7"  AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">đến</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList8"  AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Thứ</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:DropDownList ID="DropDownList9"  AutoPostBack="true" runat="server">
                                                    <asp:ListItem Value="2" Text="hai" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="ba"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="tư"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="năm"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="sáu"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="bảy"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:2px;">Phòng</div>
                                            <div class="btkb" style="float: left;">
                                                <asp:TextBox ID="txtphong3"  runat="server"></asp:TextBox>
                                            </div>
                                            <div class="btkb" style="float: left;padding-top:3px;">
                                                <asp:ImageButton ID="imgbtnb3" OnClick="imgbtnb3_Click" ImageUrl="~/Images/Delete-icon.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="10" Width="10" runat="server" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <div>
                                        <div style="margin-top:5px;">
                                            <asp:ImageButton ID="imgbtnthembuoi" OnClick="imgbtnthembuoi_Click" ImageUrl="~/Images/btnthem.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="20" Width="20" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="float: left;">
                                <div style="float: left;">
                                    <div style="background-color: #E8F3FB; float: left; font-weight: 800; color: #258CB9; margin-bottom: 10px; width: 820px;">Điểm</div>
                                    <div style="float: left;width:800px;margin-bottom:20px;">
                                        <div style="float: left; margin-right: 10px;" class="lbcsmh">
                                            <asp:Label ID="Label7" runat="server" Text="Điểm quá trình"></asp:Label>
                                        </div>
                                        <div style="float: left;margin-right:34px;">
                                            <asp:TextBox ID="txtdqt" OnTextChanged="txtdqt_TextChanged" AutoPostBack="true"  runat="server"></asp:TextBox>
                                        </div>
                                        <div style="float: left;margin-right:46px;" class="lbcsmh">
                                            <asp:Label ID="Label8" runat="server" Text="Điểm thi"></asp:Label>
                                        </div>
                                        <div style="float: left;">
                                            <asp:TextBox ID="txtdt" OnTextChanged="txtdt_TextChanged" AutoPostBack="true"  runat="server"></asp:TextBox>
                                        </div>                                       
                                    </div>
                                    <div style="float: left;margin-right:20px;" >
                                        <div>
                                            <div style="margin-bottom:5px;margin-left:90px;">
                                                <asp:Button ID="btnsua" OnClick="btnsua_Click" class="btnsuamh" runat="server" Text="Sửa" />
                                                <asp:Button ID="btnOK" OnClick="btnOK_Click" class="btnsuamh" runat="server" Text="Cập nhật" />
                                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" class="btnsuamh" runat="server" Text="Trở lại" />
                                            </div>
                                        </div>
                                    </div>
                                     <div style="float: left;">
                                            <div style="color: red; font-size: 10px; height: 15px; padding-top:5px;">
                                                <asp:Label ID="lbthongbaosua" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
