<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucKinhNghiem.ascx.cs" Inherits="MangHocTap.UC_HocKy.ucKinhNghiem" %>
<div id="kinhnghiem" class="uchk">
    <div id="img" style="text-align:left;margin-left:0px;margin-bottom:-22px;"><asp:Image ID="Image1"  runat="server" ImageUrl="~/Images/chopkhungKNHK.png" /></div>
    <div style="text-align:right;color:red; height:20px"><asp:Label ID="lberror" runat="server"  Visible="false" Text="Dữ liệu không hợp lệ !"></asp:Label></div>
    <div id="baogv">
    <div id="tieude">
        <asp:Label ID="lbtieude" runat="server" Text="KINH NGHIỆM HỌC KỲ"></asp:Label>
    </div>     
    <div class="kqmh">
         <div style="line-height: 20px;">
                            - Đây là nơi chứa các bài viết về kinh nghiệm học tập trong 1 học kỳ được những người đi trước để lại
                    <br />
                            - Bạn cũng có thể là người tạo ra chúng                    
                        </div>
                        <div class="mucbvht">
                            <div class="tdmuc">>> Kình nghiệm học tập</div>
                            <div class="bodermuc">
                                <div class="menumuc">
                                    <div class="new">
                                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" ImageUrl="~/Images/thembaiviet.jpg" runat="server" />
                                    </div>
                                    <div class="order">
                                        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dlbvmh" runat="server" Height="25px" Width="80px">
                                            <asp:ListItem>Điểm số</asp:ListItem>
                                            <asp:ListItem>Thời gian</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="search">
                                        <asp:TextBox ID="TextBox1" CssClass="tbbvmh" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true" placeholder="Tìm kiếm bài viết ở đây" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div>
                                    <asp:Panel ID="Panel1" runat="server">
                                        <div class="pnchuaco">Chưa có bài viết nào cả !</div>
                                    </asp:Panel>
                                    <div style="width: 800px; float: left;">
                                        <asp:GridView ID="gvkt" runat="server" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Tiêu đề">
                                                    <EditItemTemplate>

                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tenbaiviet") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <a href='<%# "TrangBVMHChiTiet.aspx?mmh="+ Request.QueryString["mmh"] +"&mbv="+ Eval("mabaiviet") %>'>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("tenbaiviet") %>'></asp:Label></a>
                                                    </ItemTemplate>
                                                    <ItemStyle ForeColor="#993333" Width="400px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ngayviet" HeaderText="Thời gian">
                                                    <ItemStyle Width="180px" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="tennguoiviet" HeaderText="Người viết">
                                                    <ItemStyle Width="150px" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="danhgia" HeaderText="Điểm">
                                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
    </div>
    </div>
</div>