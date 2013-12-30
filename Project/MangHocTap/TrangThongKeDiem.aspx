<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TrangThongKeDiem.aspx.cs"  Inherits="MangHocTap.TrangThongKeDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/thongkediem.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
      <asp:Panel ID="pnhoixoa" Visible="false" CssClass="pmsbox" runat="server">
            <div class="msboxtkd">
                <div class="mdtbtieude">
                    <div style="float: left;">Câu hỏi?</div>
                    <div style="text-align: right;">
                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" ImageUrl="~/Images/btnclose.jpg" runat="server" />
                    </div>
                </div>

                <br />
                <div style="height: 40px;">
                    <asp:Label ID="Label10" runat="server" Text="Bạn có chắc chắn muốn xóa hết các môn học này hay ko?"></asp:Label>
                </div>
                <asp:Button ID="Button1" runat="server" CssClass="thongbaoOK" OnClick="Button1_Click" Text="Ok" />
                <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="thongbaoOK" OnClick="Button2_Click" />
            </div>
        </asp:Panel>
    <asp:Panel ID="pnmsbox" Visible="false" CssClass="pmsbox" runat="server">
        <div class="msboxtkd">
            <div class="mdtbtieude">
                <div style="float: left;">Lấy dữ liệu từ file excel</div>
                <div style="text-align: right; margin-top: -1px;">
                    <asp:ImageButton ID="imgbtnclose2" OnClick="imgbtnclose2_Click" ImageUrl="~/Images/btnclose.jpg" runat="server" />
                </div>
            </div>

            <br />
            <div style="height: 40px;">
                Lấy đường dẫn file:
                <asp:FileUpload ID="FileUpload1"  runat="server" />
            </div>
            <asp:Button ID="btnOK2" runat="server" CssClass="thongbaoOK" OnClick="btnOK2_Click" Text="Ok" />
            <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" CssClass="thongbaoOK" />    
        </div>
    </asp:Panel>
    <div id="banner-tkd">
        <img src="Images/bannertkd.jpg" width="850" />
    </div>
    <div id="tkdiem" class="uchk">
        <div id="duongcong">
            <div style="text-align: right; margin-right: 20px; padding-top: 3px;">
                <asp:LinkButton ID="lbxohet" OnClick="lbxohet_Click" runat="server">Xóa hết tất cả môn học</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnnhapexcel" OnClick="lbtnnhapexcel_Click" runat="server">Lấy dữ liệu từ file excel</asp:LinkButton>
            </div>
        </div>       
        <div id="bodertkd">
            <div id="tieude">
                <asp:Label ID="Label1" runat="server" Text="THÔNG KÊ KẾT QUẢ QUÁ TRÌNH HỌC TẬP"></asp:Label>
            </div>
            <div>
                <div style="float: left; width: 280px; padding: 2px;">
                    <table>
                        <tr>
                            <td colspan="2">Thông kê theo:</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="dlcachtk_SelectedIndexChanged" CssClass="dlcachtk" ID="dlcachtk" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="kqtieudehd">Kết quả học tập</td>
                        </tr>
                        <tr>
                            <td class="kqtieude">Tổng điểm hệ 10:</td>
                            <td class="kqnoidung">
                                <asp:Label ID="lbh10" runat="server" Text="0"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="kqtieude">Tổng điểm hệ 4:</td>
                            <td class="kqnoidung">
                                <asp:Label ID="lbh4" runat="server" Text="0"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="kqtieude">Xệp loại:</td>
                            <td class="kqnoidung">
                                <asp:Label ID="lbxl" runat="server" Text="Không"></asp:Label></td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; padding: 2px; text-align: center; color: #435868;">
                    <asp:GridView ID="GridView1" CssClass="gv" HeaderStyle-BackColor="#A2CDED" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Mã môn học" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mamonhoc") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("mamonhoc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tên môn học">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tenmonhoc") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <a href='<%# "TrangMonHocGhiChep.aspx?mmh="+Eval("mamonhoc") %>'>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("tenmonhoc") %>'></asp:Label></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="STC" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("stc") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("stc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="diemquatrinh" HeaderText="Điểm quá trình">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="diemthi" HeaderText="Điểm thi">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="ĐTB môn">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("d10") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("d10") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hệ 4" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("d4") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("d4") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#A2CDED"></HeaderStyle>
                    </asp:GridView>
                </div>
            </div>
        </div>     
    </div>
    <asp:GridView ID="GridView2" Visible="false" runat="server" PageSize="100"></asp:GridView>
 </ContentTemplate>
     <Triggers>
         <asp:PostBackTrigger  ControlID="btnOK2"/>
     </Triggers>
 </asp:UpdatePanel>
</asp:Content>


