using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TrangTaoBVMH3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void laymamonhoc()
        {
            Response.Write("/TrangMonHocBaiViet.aspx?mmh=" + Request.QueryString["mmh"]);
        }

        protected void btnguibai_Click(object sender, EventArgs e)
        {
            if (txttieude.Text == "")
            {
                lbloi.Visible = true;
                lbloi.Text = "Bạn chưa nhập tiêu đề bài viết";

            }
            else
                if (txttieude.Text.Length > 100)
                {
                    lbloi.Visible = true;
                    lbloi.Text = "Tiêu đề bài viết quá dài";
                }
                else
                    if (txttieude.Text.Length < 10)
                    {
                        lbloi.Visible = true;
                        lbloi.Text = "Tiêu đề bài viết quá ngắn";
                    }
                    else
                        if (CKEditorControl1.Text.Length < 100)
                        {
                            lbloi.Visible = true;
                            lbloi.Text = "Nội dung bài viết quá ngắn";
                        }
                        else
                            if (CKEditorControl1.Text.Length > 1000)
                            {
                                lbloi.Visible = true;
                                lbloi.Text = "Nội dung bài viết quá dài";
                            }
                            else
                            {
                                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                                BaiVietMonHoc bvmh = new BaiVietMonHoc();
                                bvmh.tenbaiviet = txttieude.Text;
                                bvmh.noidung = CKEditorControl1.Text;
                                bvmh.nguoiviet = (int)Session["ID"];
                                SinhVien sv = db.SinhViens.Single(p => p.id == (int)Session["ID"]);
                                bvmh.tennguoiviet = sv.hoten;
                                bvmh.monhoc = Request.QueryString["mmh"];
                                bvmh.ngayviet = DateTime.Now;
                                bvmh.loaibai = 3;
                                bvmh.danhgia = 0;
                                db.BaiVietMonHocs.InsertOnSubmit(bvmh);
                                db.SubmitChanges();
                                int bv = db.BaiVietMonHocs.Max(p => p.mabaiviet);
                                Response.Redirect("TrangBVMHChiTiet.aspx?mmh=" + Request.QueryString["mmh"] + "&mbv=" + bv.ToString());
                            }
        }
    }
}