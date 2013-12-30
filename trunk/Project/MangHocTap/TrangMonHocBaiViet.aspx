<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMonHoc.master" AutoEventWireup="true" CodeBehind="TrangMonHocBaiViet.aspx.cs" Inherits="MangHocTap.TrangMonHocBaiViet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/MonHoc/baiviet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="submonhoc">
        <div class="imgheader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungbvht.png" />
        </div>
        <div class="bodermonhoc">
            <div class="tieudeheader">
                <asp:Label ID="lbtieude" runat="server" Visible="true" Text="> Các bài viết liên quan đến môn học này"></asp:Label>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="kqmh">
                        <div style="line-height: 20px;">
                            - Nếu bạn cần tìm kiếm các bài thi, bài kiểm tra hay các tài liệu liên quan thì bạn có thể đến mục Tài Liệu.
                    <br />
                            - Nếu bạn đang thắc mắc hay cần hỏi vấn đề gì liên quan đến môn học này thì hãy đến mục Câu Hỏi.
                    <br />
                            - Nếu muốn chia sẻ, trao dồi kiến thức hay muốn giúp đỡ người khác hãy tìm đến mục Kiến Thức hoặc Câu Hỏi.
                    <br />
                            - Tất cả hoạt động của bạn trong mục Học Tập - Chia sẻ này sẻ được chúng tôi ghi nhận, và sẻ có những ưu tiên cho những người hoạt động tốt nhất! 
                     <br />
                            - Ngoài ra các bài viết, câu hỏi hay bình luận điều phải tuân thủ theo quy đinh của trang web, bạn có thể đọc chúng <a href="#">ở đây</a>
                        </div>
                        <div class="mucbvht">
                            <div class="tdmuc">>> Kiến Thức</div>
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
                        <div class="mucbvht">
                            <div class="tdmuc">>> Câu Hỏi</div>
                            <div class="bodermuc">
                                <div class="menumuc">
                                    <div class="new">
                                        <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" ImageUrl="~/Images/thembaiviet.jpg" runat="server" />
                                    </div>
                                    <div class="order">
                                        <asp:DropDownList ID="DropDownList2" AutoPostBack="true" CssClass="dlbvmh" runat="server" Height="25px" Width="80px">
                                            <asp:ListItem>Điểm số</asp:ListItem>
                                            <asp:ListItem>Thời gian</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="search">
                                        <asp:TextBox ID="TextBox2" CssClass="tbbvmh" placeholder="Tìm kiếm bài viết ở đây" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Panel ID="Panel2" runat="server">
                                    <div class="pnchuaco">Chưa có bài viết nào cả !</div>
                                </asp:Panel>
                                <div style="width: 800px; float: left;">
                                    <asp:GridView ID="gvch" runat="server" AutoGenerateColumns="False">
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
                        <div class="mucbvht">
                            <div class="tdmuc">>> Tài Liệu</div>
                            <div class="bodermuc">
                                <div class="menumuc">
                                    <div class="new">
                                        <asp:ImageButton ID="ImageButton3" OnClick="ImageButton3_Click" ImageUrl="~/Images/thembaiviet.jpg" runat="server" />
                                    </div>
                                    <div class="order">
                                        <asp:DropDownList ID="DropDownList3" AutoPostBack="true" CssClass="dlbvmh" runat="server" Height="25px" Width="80px">
                                            <asp:ListItem>Điểm số</asp:ListItem>
                                            <asp:ListItem>Thời gian</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="search">
                                        <asp:TextBox ID="TextBox3" CssClass="tbbvmh" placeholder="Tìm kiếm bài viết ở đây" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Panel ID="Panel3" runat="server">
                                    <div class="pnchuaco">Chưa có bài viết nào cả !</div>
                                </asp:Panel>
                                <div style="width: 800px; float: left;">
                                    <asp:GridView ID="gvtl" runat="server" AutoGenerateColumns="False">
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
                </ContentTemplate>
                <Triggers>
                    <%--<asp:PostBackTrigger ControlID="DropDownList1" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
