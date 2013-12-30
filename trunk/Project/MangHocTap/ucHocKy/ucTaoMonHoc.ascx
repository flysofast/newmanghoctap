<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTaoMonHoc.ascx.cs" Inherits="MangHocTap.UC_HocKy.ucTaoMonHoc" %>

<style type="text/css">
    .auto-style1 {
        width: 90px;
    }

    .auto-style2 {
        width: 93px;
    }
</style>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
 <asp:Panel ID="pnsautb" Visible="false" CssClass="pmsbox"  runat="server">
       <div class="msbox">
        <div class="mdtbtieude">
            <div style="float: left;">Thông báo môn học còn thiếu</div>
          
            <div style="text-align: right;">
                <asp:ImageButton ID="ImageButton4" OnClick="imgbtnclose2_Click" ImageUrl="~/Images/btnclose.jpg" runat="server" />
            </div>
        </div>
            <div>
                <div>Cảm ơn bạn!</div>
                <div>Chúng tôi sẻ tiến hành xác minh nhanh nhất có thể, nếu xác minh là đúng thì trong ngành học của bạn sẻ có thêm môn học này</div>
                <div>
                    <asp:Button ID="btnsautb" CssClass="thongbaoOK" runat="server" OnClick="btnsautb_Click" Text="OK" />
                </div>
            </div>
           </div>
</asp:Panel>                  
<asp:Panel ID="pnbaomonthieu" Visible="false" CssClass="pmsbox" runat="server">
    <div class="msbox">
        <div class="mdtbtieude">
            <div style="float: left;">Thông báo môn học còn thiếu</div>
          
            <div style="text-align: right;">
                <asp:ImageButton ID="imgbtnclose2" OnClick="imgbtnclose2_Click" ImageUrl="~/Images/btnclose.jpg" runat="server" />
            </div>
        </div>
        <br />
        <div style="height: 15px;color:#ff0000;font-weight:100;">
            <asp:Label ID="Label10" runat="server"  Visible="false" Text="Thiếu thông tin"></asp:Label>
        </div>
        <div style="text-align:left;color:black;padding-left:20px;width:100%;float:left;margin:10px;margin-top:3px;">
            <div style="float:left;margin-right:5px;">
               <div style="margin-bottom:8px;padding-top:2px;">Ngành:</div> 
                <div>Tên môn học:</div> 
            </div>
            <div>
               <div style="margin-bottom:5px;"> 
                   <asp:DropDownList ID="DropDownList10" Width="152px" runat="server"></asp:DropDownList>  
               </div>           
                 <div>
                     <asp:TextBox ID="TextBox1" Width="150px" runat="server"></asp:TextBox>

                 </div> 
            </div>
        </div>
        <div style="text-align:center;">
        <asp:Button ID="btngui2" runat="server" CssClass="thongbaoOK" OnClick="btngui2_Click" Text="Gửi" />
        <asp:Button ID="btnhuy" runat="server" Text="Hủy" CssClass="thongbaoOK" OnClick="btnhuy_Click" />
        </div>           
   </div>
</asp:Panel>
<asp:Panel ID="pnthongbao" Visible="false" CssClass="pmsbox" runat="server">
    <div class="mstb">
        <div class="mdtbtieude">
            <div style="float: left;">Thông báo</div>
            <div style="text-align: right;">
                <asp:ImageButton ID="imgbtnclose" OnClick="imgbtnclose_Click" ImageUrl="~/Images/btnclose.jpg" runat="server" />
            </div>
        </div>

        <br />
        <div style="height: 40px;">
            <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label></div>
        <asp:Button ID="btntbOK" runat="server" CssClass="thongbaoOK" OnClick="btntbOK_Click" Text="Ok" />

    </div>
</asp:Panel>
<div id="taomonhoc" class="uchk">

    <div id="img" style="text-align: left; margin-left: 0px; margin-bottom: -2px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungTMH.png" /></div>
    <%--<div style="text-align:right;color:red; height:20px"><asp:Label ID="lberror" runat="server"  Visible="false" Text="Dữ liệu không hợp lệ !"></asp:Label></div>--%>
    <div id="baogv">
        <div id="tieude">
            <asp:Label ID="lbkhongco1" runat="server" Text="TẠO MÔN HỌC MỚI"></asp:Label>
        </div>
      
                <div id="kq">

                    <div style="padding:10px;"">
          <div style="color:red;font-size:medium;margin-bottom:10px;">Lưu ý:</div>
            <p style="font-weight:200; color:#141b22;font-size:12px;line-height:20px;">
              - Bạn có thể tìm kiếm môn học nhanh chóng theo mã môn học hoặc tên môn học ở ô tìm kiếm phía dưới<br />
              - Bạn không thể thay đổi mã môn học hoặc tên môn học.<br />
              - Ngoài mã và tên môn học thì các thông tin còn lại chỉ mang tính chất tham khảo. Vì vậy, bạn nên thay đổi các thông tin còn lại sao cho phụ hợp với thông tin thực tế của bạn. Nếu không bạn cũng có thể thay đổi sau này.<br />
              - Hãy cung cấp ngày bắt đầu, ngày kết thúc và thời gian biểu môn học, chúng tôi sẻ tự động tạo thời gian biểu cho bạn.<br />
              - Nếu bạn không tìm thấy môn học mà mình cần tạo bạn có thể gửi một thông báo cho chúng tôi 
                <asp:LinkButton ID="lbtnthieumon" OnClick="lbtnthieumon_Click" runat="server">tại đây</asp:LinkButton>.
            </p>   
           </div>
                    <div id="listmon">
                        <div id="search">
                            <asp:TextBox CssClass="tk" ID="txttk" placeholder="Tìm kiếm ở đây" runat="server" OnTextChanged="txttk_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton1" CssClass="anh" OnClick="ImageButton1_Click" ImageUrl="~/Images/findicon.png" runat="server" />
                        </div>

                        <asp:ListBox ID="ListBox1" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" AutoPostBack="true" CssClass="lbmon" runat="server"></asp:ListBox>
                    </div>


                    <div id="chitietmon">

                        <table>
                            <tr>
                                <table>
                                    <th colspan="2">Thông tin môn học</th>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label1" runat="server" Text="Mã môn học"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtmmh" CssClass="tb1" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>

                                        <td class="auto-style2">
                                            <asp:Label ID="Label2" runat="server" Text="Tên môn học"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txttmh" CssClass="tbmhoc" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label3" runat="server" Text="Số tín chỉ"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="dlstc" CssClass="tb1" runat="server">
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                                <asp:ListItem Value="4"></asp:ListItem>
                                                <asp:ListItem Value="5"></asp:ListItem>
                                                <asp:ListItem Value="6"></asp:ListItem>
                                                <asp:ListItem Value="7"></asp:ListItem>
                                                <asp:ListItem Value="8"></asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label4" runat="server" Text="Hệ số điểm thi"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="dlheso" CssClass="tb1" runat="server">
                                                <asp:ListItem Value="0"></asp:ListItem>
                                                <asp:ListItem Value="50"></asp:ListItem>
                                                <asp:ListItem Value="60"></asp:ListItem>
                                                <asp:ListItem Value="70"></asp:ListItem>
                                                <asp:ListItem Value="80"></asp:ListItem>
                                                <asp:ListItem Value="90"></asp:ListItem>
                                                <asp:ListItem Value="100"></asp:ListItem>

                                            </asp:DropDownList></td>
                                    </tr>

                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label5" runat="server" Text="Ngày bắt đầu"></asp:Label></td>
                                        <td>
                                            <div class="calen">
                                                <div style="float: left;">
                                                    <asp:TextBox ID="txtcld1" CssClass="tbcld" runat="server"></asp:TextBox></div>
                                                <div class="calenimg">
                                                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/cld_trang.jpg" runat="server" OnClick="ImageButton2_Click" />
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td class="auto-style2"></td>
                                        <td colspan="2">
                                            <asp:Panel ID="pncalendar1" runat="server">
                                                <div style="background-color: white; position: absolute; margin-top: -2px;">
                                                    <asp:Calendar ID="Calendar1" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" Width="200px"></asp:Calendar>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label6" runat="server" Text="Ngày kết thúc"></asp:Label></td>
                                        <td>
                                            <div class="calen">
                                                <div style="float: left;">
                                                    <asp:TextBox ID="txtcld2" CssClass="tbcld" runat="server"></asp:TextBox></div>
                                                <div class="calenimg">
                                                    <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images/cld_trang.jpg" runat="server" OnClick="ImageButton3_Click" /></div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2"></td>
                                        <td colspan="2">
                                            <asp:Panel ID="pncalendar2" runat="server">
                                                <div style="background-color: white; position: absolute; margin-top: -2px;">
                                                    <asp:Calendar ID="Calendar2" OnSelectionChanged="Calendar2_SelectionChanged" runat="server" Width="200px"></asp:Calendar>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </tr>
                            <tr>
                                <table id="bangtkb">
                                    <th colspan="10">Thời khóa biểu</th>
                                    <asp:Panel ID="pnb1" runat="server">
                                        <tr>
                                            <td>Buổi 1:</td>
                                            <td>Từ tiết</td>

                                            <td>

                                                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
                                            <td>đến</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></td>
                                            <td>Thứ</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList3" runat="server">
                                                    <asp:ListItem Value="2" Text="hai" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="ba"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="tư"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="năm"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="sáu"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="bảy"></asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td>Phòng</td>
                                            <td>
                                                <asp:TextBox ID="txtphong1" CssClass="txtphong" runat="server"></asp:TextBox></td>
                                            <td>
                                                <asp:ImageButton ID="imgbtnb1" OnClick="imgbtnb1_Click" ImageUrl="~/Images/Delete-icon.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="10" Width="10" runat="server" /></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="pnb2" Visible="false" runat="server">
                                        <tr>
                                            <td>Buổi 2:</td>
                                            <td>Từ tiết</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList></td>
                                            <td>đến</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList></td>
                                            <td>Thứ</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList6" runat="server">
                                                    <asp:ListItem Value="2" Text="hai" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="ba"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="tư"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="năm"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="sáu"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="bảy"></asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td>Phòng</td>
                                            <td>
                                                <asp:TextBox ID="txtphong2" CssClass="txtphong" runat="server"></asp:TextBox></td>
                                            <td>
                                                <asp:ImageButton ID="imgbtnb2" OnClick="imgbtnb2_Click" ImageUrl="~/Images/Delete-icon.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="10" Width="10" runat="server" /></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="pnb3" Visible="false" runat="server">
                                        <tr>
                                            <td>Buổi 3:</td>
                                            <td>Từ tiết</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList7" runat="server"></asp:DropDownList></td>
                                            <td>đến</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList8" runat="server"></asp:DropDownList></td>
                                            <td>Thứ</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList9" runat="server">
                                                    <asp:ListItem Value="2" Text="hai" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="ba"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="tư"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="năm"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="sáu"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="bảy"></asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td>Phòng</td>
                                            <td>
                                                <asp:TextBox ID="txtphong3" CssClass="txtphong" runat="server"></asp:TextBox></td>
                                            <td>
                                                <asp:ImageButton ID="imgbtnb3" OnClick="imgbtnb3_Click" ImageUrl="~/Images/Delete-icon.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="10" Width="10" runat="server" /></td>
                                        </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="imgbtnthembuoi" OnClick="imgbtnthembuoi_Click" ImageUrl="~/Images/btnthem.png" BorderStyle="Dashed" BorderWidth="1px" BorderColor="SlateGray" Height="20" Width="20" runat="server" /></td>
                                    </tr>
                                </table>
                            </tr>
                            <tr>
                                <table>
                                    <th colspan="2">Điểm </th>
                                    <tr>
                                        <td class="auto-style1">
                                            <asp:Label ID="Label7" runat="server" Text="Điểm quá trình"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtdqt" CssClass="tb1" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                            <asp:Label ID="Label8" runat="server" Text="Điểm thi"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtdt" CssClass="tb1" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1"></td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1"></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </tr>

                        </table>
                    </div>
                    <div style="margin: 10px; margin-left: 330px;">
                        <asp:Button ID="btnthem" OnClick="btnthem_Click" CssClass="btnthem" runat="server" Text="Thêm" /></div>
                </div>
    </div>
</div>
            </ContentTemplate>
        </asp:UpdatePanel>