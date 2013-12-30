<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHK.ascx.cs" Inherits="MangHocTap.ucHocKy.ucHK" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pnmsbox" Visible="false" CssClass="pmsbox" runat="server">
            <div class="msbox">
                <div class="mdtbtieude">
                    <div style="float: left;">Câu hỏi?</div>
                    <div style="text-align: right;">
                        <asp:ImageButton ID="imgbtnclose2" OnClick="imgbtnclose2_Click" ImageUrl="~/Images/btnclose.jpg" runat="server" />
                    </div>
                </div>

                <br />
                <div style="height: 40px;">
                    <asp:Label ID="Label10" runat="server" Text="Bạn có chắc chắn muốn xóa môn học này hay ko?"></asp:Label>
                </div>
                <asp:Button ID="btnOK2" runat="server" CssClass="thongbaoOK" OnClick="btnOK2_Click" Text="Ok" />
                <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="thongbaoOK" OnClick="btncancel_Click" />
                <div style="text-align:left;margin-left:30px;margin-top:10px;">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                   <div style="font-size:9px;color:#3a4157;font-style:italic;margin-left:20px;margin-top:-15px;"> Check vào đây nếu muốn xóa tất cả môn học của học kỳ này.</div>
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
                    <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>
                </div>
                <asp:Button ID="btntbOK" runat="server" CssClass="thongbaoOK" OnClick="btntbOK_Click" Text="Ok" />


            </div>
        </asp:Panel>
        <div id="hocky" class="uchk">
            <div id="img" style="text-align: left; margin-left: 0px; margin-bottom: -2px;">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungHK.png" />
            </div>
            <%--<div id="">
    <div style="text-align:right;color:red;margin-right:20px; height:20px"><asp:Label ID="lberror" runat="server"  Visible="false" Text="Dữ liệu không hợp lệ !"></asp:Label></div>
     </div>--%>
            <div id="">
                <div style="text-align: right; color: red; margin-right: 20px; margin-top: -20px; height: 18px"><a href="TrangThongKeDiem.aspx">Thống kê điểm</a></div>
            </div>
            <div id="baogv">
                <div id="tieude">
                    <asp:Label ID="lbhd" runat="server" Visible="false" Text="KẾT QUẢ HỌC TẬP"></asp:Label>
                    <asp:Label ID="lbkhongco1" runat="server" Visible="false" Text="KHÔNG CÓ MÔN HỌC NÀO CẢ !"></asp:Label>
                </div>


                <asp:GridView ID="gvhocky" runat="server" DataKeyNames="mamonhoc" CssClass="gvhk"
                    OnRowEditing="gvhocky_RowEditing" OnRowCancelingEdit="gvhocky_RowCancelingEdit" OnRowUpdating="gvhocky_RowUpdating"
                    OnRowDeleting="gvhocky_RowDeleting" HeaderStyle-CssClass="gvhk_header" BorderColor="#258CB9"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Mã môn học" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("mamonhoc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên môn học">
                            <ItemTemplate>
                                <div style="text-align: left;">
                                    <a href='<%# "TrangMonHocGhiChep.aspx?mmh="+Eval("mamonhoc") %>'>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("tenmonhoc") %>'></asp:Label></a>
                                </div>
                            </ItemTemplate>
                            <ItemStyle Width="338px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số TC">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>

                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("stc") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="40px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hệ số">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("heso") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("heso") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="40px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Điểm QTHT">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("diemquatrinh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("diemquatrinh") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="40px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Điểm Thi">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("diemthi") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("diemthi") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="40px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" Điểm Hệ 10">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("d10") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" Điểm Hệ 4">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("d4") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Điểm Chữ">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("dc") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" HeaderText="Sửa" ButtonType="Image" CancelImageUrl="~/Images/ic_dialog_cancel.png" EditImageUrl="~/Images/file_edit.png" UpdateImageUrl="~/Images/Update.png">
                            <ItemStyle Width="100px" />
                        </asp:CommandField>

                        <asp:CommandField ShowDeleteButton="True" HeaderText="Xóa" ButtonType="Image" DeleteImageUrl="~/Images/Delete_Icon.png">
                            <ItemStyle Width="50px" />
                        </asp:CommandField>
                        <%--<div style="background-image:url(<%# Eval("value") %>);width:300px;height:300px;background-repeat:no-repeat;"></div>--%>
                    </Columns>
                    <HeaderStyle BackColor="#A2CDED" ForeColor="#1854A8" />
                    <RowStyle BackColor="#E8F3FB" />
                </asp:GridView>

                <asp:Panel ID="Panel1" CssClass="kq" runat="server">
                    <asp:Label ID="lbtd" runat="server" Text="Tổng điểm:" Visible="False"></asp:Label>
                    <asp:Label CssClass="lb" ID="lbh10" runat="server" Text="0.00" Visible="False"></asp:Label>
                    <asp:Label ID="lbh4" CssClass="lb" runat="server" Text="0.00" Visible="False"></asp:Label>
                    <asp:Label ID="lbhc" CssClass="lb" runat="server" Text="I" Visible="False"></asp:Label>
                </asp:Panel>

            </div>

        </div>
        <asp:Label ID="Label11" Visible="false" runat="server" Text="Label"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
