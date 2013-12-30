<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMonHoc.master" AutoEventWireup="true" CodeBehind="TrangBVMHChiTiet.aspx.cs" Inherits="MangHocTap.TrangBVMHChiTiet" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/MonHoc/taobaiviet.css" rel="stylesheet" />
    <link href="/CSS/MonHoc/chitiet.css" rel="stylesheet" />
    <script src="/JQuery/jquery-ui.js.js"></script>

    <script>
        $(function () {

            $('#s2').click(function () {
                $('#blnhanh').hide(function () {
                    $('#blnhubv').show('slow');
                });

                $('#s1 div').removeClass('active');
                $('#s1 div').addClass('nonactive');
                $('#s2 div').removeClass('nonactive');
                $('#s2 div').addClass('active');

            });

            $('#s1').click(function () {

                $('#blnhubv').hide(function () {

                    $('#blnhanh').show(1000);

                });

                $('#s2 div').removeClass('active');
                $('#s2 div').addClass('nonactive');
                $('#s1 div').removeClass('nonactive');
                $('#s1 div').addClass('active');

            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="submonhoc">
        <div class="imgheader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/chopkhungbvht.png" />
        </div>
        <div class="lbloi">
            <asp:Label ID="lbloi" runat="server" Visible="false" Text=""></asp:Label>
        </div>
        <div class="bodermonhoc">
            <div class="tieudeheader">
                <a style="float: left;" href="<% laymamonhoc(); %>">
                    <asp:Label ID="lbtieude" runat="server" Visible="true" Text="Tất cả bài viết"></asp:Label></a>
                <div><% laytieude();%></div>
            </div>
            <div class="kqmh">
                <div style="float: left; width: 99%; margin-bottom: -50px; position: absolute;">
                    <div style="float: left; margin-left: 30px; padding: 2px; border: 1px solid #0094ff; background-color: white;">
                        <asp:Image ID="avatar" Width="70px" Height="80px" runat="server" />
                    </div>
                    <div style="float: left; margin-top: 50px; margin-left: 10px; font-weight: 800; color: #3B5998;">
                        <asp:Label ID="lbten" runat="server" Text="Label"></asp:Label>
                        <div style="font-weight:normal;">
                            <asp:Label ID="lbthoigian" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                </div>
                <div style="border: 1px solid #0094ff; float: left; padding: 5px; width: 99%; margin-top: 45px;">
                    <div>
                        <div style="border: 1px solid #3B5998; background-color: #0094ff; margin-top: 45px; font-weight: 800; padding: 10px;">
                            <asp:Label ID="lbtieudebv" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div style="border: 1px solid #808080; background-color: #f4f5e7; padding: 10px;">
                            <asp:Label ID="lbnoidungbv" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div style="border: 1px solid #808080; background-color: #e5ebf2; padding: 5px; border-top: none; height: 10px;">
                        </div>
                        <div id="tabmenu">
                            <div id="s1">
                                <div class="active">Bình luận nhanh</div>
                            </div>
                            <div id="s2">
                                <div class="nonactive">Bình luận như một bài viết</div>
                            </div>
                              <div style="padding:10px;float:left;color:#ff0000;">
                                <asp:Label ID="lbloibl" Visible="false" runat="server" Text="Nội dung bình luận quá ngắn!"></asp:Label>
                            </div>
                        </div>
                        <div id="blnhanh" style="border: 1px solid #808080; background-color: #f4f5e7; padding: 5px; margin-top: 45px; height: 70px;">
                            <div style="float: left;">
                                <asp:TextBox ID="TextBox1" Height="68px" Width="710px" runat="server" TextMode="MultiLine"></asp:TextBox></div>
                            <div style="float: left;">
                                <asp:Button ID="Button1" OnClick="Button1_Click" Width="90px" Height="70px" runat="server" Text="Gửi bình luận" />
                            </div>                         
                        </div>
                        <div id="blnhubv" style="border: 1px solid #808080; background-color: #f4f5e7; padding: 5px; margin-top: 45px; height: 225px; display: none;">
                            <CKEditor:CKEditorControl ID="CKEditorControl1" Height="150px" runat="server"></CKEditor:CKEditorControl>
                            <asp:Button ID="Button2" OnClick="Button2_Click" Width="90px" Height="30px" runat="server" Text="Gửi bình luận" />
                        </div>
                        <div style="margin-top:10px;float:left;">
                            <asp:DataList ID="DataList1" runat="server">
                                <ItemTemplate>
                                    <div style="border: 1px solid #808080;padding: 5px;float:left;width:810px;margin-top:10px;">
                                        <div style="float:left;">
                                            <div style="float:left;">
                                                <asp:Image ID="Image2" ImageUrl='<%# Eval("avatar") %>' Height="60px" Width="50px" runat="server" />
                                            </div>
                                            
                                            <div style="float:left;padding-top:15px;color:#156197;margin-left:15px;">
                                                <div style="font-weight:800;margin-bottom:5px;color:#3B59A9;"><asp:Label ID="lbtenbl" runat="server" Text='<%# Eval("hoten") %>'></asp:Label></div>
                                                <div style="font-weight:100;""><asp:Label ID="lbtgbl" runat="server" Text='<%# Eval("ngayviet") %>'></asp:Label></div>
                                            </div>
                                        </div>
                                        <div  style="border: 1px solid #808080; background-color: #f4f5e7;padding: 15px;float:left;width:780px;" >
                                            <asp:Label ID="lbndbl" Text='<%# Eval("noidung") %>' runat="server"></asp:Label>
                                        </div>
                                        <div  style="float:left;border: 1px solid #808080; background-color: #e5ebf2; padding: 5px; border-top: none; height: 10px; width:800px;" ></div>
                                    </div>                                  
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

