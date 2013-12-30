<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PageTimkiembb.aspx.cs" Inherits="MangHocTap.PageTimkiembb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/PageTimkiembb.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="clssuattcn">
    <div class="header-ttcn">
        <h3>Tìm kiếm bạn bè</h3>
    </div>
    <div class="content-ttcn">
        <div class="clschangepf">
            <h3 align="center" style="color: #008000; margin-bottom:25px">Kết quả tìm kiếm</h3>
            
            <div class="tabcontrol">
                <div id="tabs">
                <ul>
                    <li>Chưa phải bạn bè <asp:Label ID="lblSobbtimdc" runat="server"></asp:Label> </li>
                    <li>Bạn bè <asp:Label ID="lblSobbcuaban" runat="server"></asp:Label></li>
                    <li>Lời mời kết bạn <asp:Label ID="lblsolmkb" runat="server"></asp:Label></li>
                </ul>
                
                <div class="contentab">
                    <div class="clsctketquatk">
                        <asp:DataList ID="DataListChuabb" runat="server" RepeatColumns="2" Width="100%" CellPadding="4" ForeColor="#333333" OnItemCommand="DataListChuabb_ItemCommand">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                <div class="divctbanbetk">
                                    <asp:Image ID="imgAvatarbb" CssClass="clsimgAvatarbb" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' Width="60px" Height="60px" runat="server" />
                                    <div class="clsTenbanbe">
                                        <asp:Label ID="lblTenbanbe" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                                    </div>
                                    <div class="divtttruonglop">
                                        <div class="divPhandong">
                                            <label class="lb1">Trường: </label>
                                            <asp:Label ID="lblTruongbb" CssClass="lb2" runat="server" Text='<%#Eval("tentruong") %>'></asp:Label>
                                        </div>
                                        <div class="divPhandong">
                                            <label class="lb1">Khoa: </label>
                                            <asp:Label ID="lblKhoabb"  CssClass="lb2" runat="server" Text='<%#Eval("tenkhoa") %>'></asp:Label>
                                        </div>
                                        <div class="divPhandong">
                                            <label class="lb1">Ngành: </label>
                                            <asp:Label ID="lblNganhbb"  CssClass="lb2" runat="server" Text='<%#Eval("tennganh") %>'></asp:Label>
                                            <label style="margin-left:2px;" class="lb1">Lớp: </label>
                                            <asp:Label ID="lblLopbb"  CssClass="lb2" runat="server" Text='<%#Eval("tenlop") %>'></asp:Label>
                                        </div>
                                        
                                    </div>
                                    <div class="btnketban">
                                        <asp:LinkButton ID="lbtnKetban" Visible='<%#Setbuttonketban((int)Eval("id")) %>' CommandName="Ketban" CommandArgument='<%#Eval("id") %>' runat="server"><img width="67" height="28" src="Images/btnKetban.png" alt="Loi anh" /></asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <div style="text-align:center">
                            <asp:Label ID="lblThongbaorong" runat="server" Visible="false" Font-Italic="True" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                </div>
                    <!-- end tab1 content -->
                <div class="contentab">
                    <div class="clsctketquatk">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                            
                        <asp:DataList ID="DataListLabanbe" runat="server" RepeatColumns="2" Width="100%" CellPadding="4" ForeColor="#333333" OnItemCommand="DataListLabanbe_ItemCommand">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                <div class="divctbanbetk">
                                    <asp:Image ID="imgAvatarbb" CssClass="clsimgAvatarbb" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' Width="60px" Height="60px" runat="server" />
                                    <div class="clsTenbanbe">
                                        <asp:Label ID="lblTenbanbe" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                                    </div>
                                    <div class="divtttruonglop">
                                        <div class="divPhandong">
                                            <label class="lb1">Trường: </label>
                                            <asp:Label ID="lblTruongbb" CssClass="lb2" runat="server" Text='<%#Eval("tentruong") %>'></asp:Label>
                                        </div>
                                        <div class="divPhandong">
                                            <label class="lb1">Khoa: </label>
                                            <asp:Label ID="lblKhoabb"  CssClass="lb2" runat="server" Text='<%#Eval("tenkhoa") %>'></asp:Label>
                                        </div>
                                        <div class="divPhandong">
                                            <label class="lb1">Ngành: </label>
                                            <asp:Label ID="lblNganhbb"  CssClass="lb2" runat="server" Text='<%#Eval("tennganh") %>'></asp:Label>
                                            <label style="margin-left:2px;" class="lb1">Lớp: </label>
                                            <asp:Label ID="lblLopbb"  CssClass="lb2" runat="server" Text='<%#Eval("tenlop") %>'></asp:Label>
                                        </div>
                                        
                                    </div>
                                    <div class="btnlabanbe">
                                        <asp:LinkButton ID="lbtnHuybanbe" CommandName="Huyketban" CommandArgument='<%#Eval("id") %>' runat="server"><img width="67" height="28" src="Images/Huyboloimoi.png" alt="Loi anh" /></asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                                </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="text-align:center">
                            <asp:Label ID="lblThongbaokhongbb" runat="server" Visible="false" Font-Italic="True" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                </div>
                    <!-- end tab2 content -->
                <div class="contentab">
                    <div class="clsctketquatk">
                        <asp:DataList ID="DataListLoimoikb" runat="server" RepeatColumns="2" Width="100%" CellPadding="4" ForeColor="#333333" OnItemCommand="DataListLoimoikb_ItemCommand">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                <div class="divctbanbetk">
                                    <asp:Image ID="imgAvatarbb" CssClass="clsimgAvatarbb" ImageUrl='<%#Eval("avatar")==null?getavatar("",bool.Parse(Eval("gioitinh").ToString())):getavatar(Eval("avatar").ToString(),bool.Parse(Eval("gioitinh").ToString())) %>' Width="60px" Height="60px" runat="server" />
                                    <div class="clsTenbanbe">
                                        <asp:Label ID="lblTenbanbe" runat="server" Text='<%#Eval("hoten") %>'></asp:Label>
                                    </div>
                                    <div class="divtttruonglop">
                                        <div class="divPhandong">
                                            <label class="lb1">Trường: </label>
                                            <asp:Label ID="lblTruongbb" CssClass="lb2" runat="server" Text='<%#Eval("tentruong") %>'></asp:Label>
                                        </div>
                                        <div class="divPhandong">
                                            <label class="lb1">Khoa: </label>
                                            <asp:Label ID="lblKhoabb"  CssClass="lb2" runat="server" Text='<%#Eval("tenkhoa") %>'></asp:Label>
                                        </div>
                                        <div class="divPhandong">
                                            <label class="lb1">Ngành: </label>
                                            <asp:Label ID="lblNganhbb"  CssClass="lb2" runat="server" Text='<%#Eval("tennganh") %>'></asp:Label>
                                            <label style="margin-left:2px;" class="lb1">Lớp: </label>
                                            <asp:Label ID="lblLopbb"  CssClass="lb2" runat="server" Text='<%#Eval("tenlop") %>'></asp:Label>
                                        </div>
                                        
                                    </div>
                                    <div class="btnllmketban">
                                        <asp:LinkButton ID="lbtnXacnhan" CommandName="Xacnhan" CommandArgument='<%#Eval("id") %>' runat="server"><img width="67" height="28" src="Images/Xacnhanbanbe.png" alt="Loi anh" /></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnHuyketban" CommandName="Huybo" CommandArgument='<%#Eval("id") %>' runat="server"><img width="67" height="28" src="Images/Huyboloimoi.png" alt="Loi anh" /></asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <div style="text-align:center">
                            <asp:Label ID="lblThongbaokhcolmkb" runat="server" Visible="false" Font-Italic="True" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                </div>
                    <!-- end tab3 content -->
                </div>
            </div>
        </div>
    </div>
    </div>


</asp:Content>
