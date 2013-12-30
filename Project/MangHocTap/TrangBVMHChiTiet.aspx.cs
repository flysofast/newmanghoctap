using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TrangBVMHChiTiet : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var q = from p1 in db.BaiVietMonHocs
                        join p2 in db.SinhViens on p1.nguoiviet equals p2.id
                        where p1.mabaiviet == int.Parse(Request.QueryString["mbv"])
                        select new { p2.hoten, p2.avatar, p2.diemconghien, p1.tenbaiviet, p1.noidung, p1.ngayviet };
                avatar.ImageUrl = q.FirstOrDefault().avatar;
                lbten.Text = q.FirstOrDefault().hoten;
                lbtieudebv.Text = q.FirstOrDefault().tenbaiviet;
                lbnoidungbv.Text = q.FirstOrDefault().noidung;
                lbthoigian.Text = q.FirstOrDefault().ngayviet.ToString();
                var r = from p in db.BinhLuanBVMHs
                        join sv in db.SinhViens on p.nguoiviet equals sv.id
                        where p.baivietmonhoc == int.Parse(Request.QueryString["mbv"])
                        select new
                        {
                            p.mabaiviet,
                            p.noidung,
                            p.ngayviet,
                            sv.hoten,
                            sv.avatar
                        };
                DataList1.DataSource = r;
                DataList1.DataBind();
            }

        }
        public void laymamonhoc()
        {
            Response.Write("/TrangMonHocBaiViet.aspx?mmh=" + Request.QueryString["mmh"]);
        }
        public void laytieude()
        {
            BaiVietMonHoc bv = db.BaiVietMonHocs.Single(p => p.mabaiviet == int.Parse(Request.QueryString["mbv"]));
            Response.Write("  >>" + bv.tenbaiviet);
        }
        public void taodtlist()
        {
            var r = from p in db.BinhLuanBVMHs
                    join sv in db.SinhViens on p.nguoiviet equals sv.id
                    where p.baivietmonhoc == int.Parse(Request.QueryString["mbv"])
                    select new
                    {
                        p.mabaiviet,
                        p.noidung,
                        p.ngayviet,
                        sv.hoten,
                        sv.avatar
                    };
            DataList1.DataSource = r;
            DataList1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.Length < 6 )
            {
                lbloibl.Visible = true;
                lbloibl.Text = "Nội dung bình luận quá ngắn";
            }
            else
            {
                try
                {

                    lbloibl.Visible = false;
                    BinhLuanBVMH bl = new BinhLuanBVMH();
                    bl.ngayviet = DateTime.Now;
                    bl.haynhat = false;
                    bl.nguoiviet = (int)Session["ID"];
                    bl.noidung = TextBox1.Text;
                    bl.baivietmonhoc = int.Parse(Request.QueryString["mbv"]);
                    bl.danhgia = 0;
                    db.BinhLuanBVMHs.InsertOnSubmit(bl);
                    db.SubmitChanges();
                    taodtlist();
                }
                catch
                {
                    lbloibl.Visible = true;
                    lbloibl.Text = "Lỗi!";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CKEditorControl1.Text.Length < 6)
            {
                lbloibl.Visible = true;
                lbloibl.Text = "Nội dung bình luận quá ngắn";
            }
            else
            {
                try
                {

                    lbloibl.Visible = false;
                    BinhLuanBVMH bl = new BinhLuanBVMH();
                    bl.ngayviet = DateTime.Now;
                    bl.haynhat = false;
                    bl.nguoiviet = (int)Session["ID"];
                    bl.noidung = CKEditorControl1.Text;
                    bl.baivietmonhoc = int.Parse(Request.QueryString["mbv"]);
                    bl.danhgia = 0;
                    db.BinhLuanBVMHs.InsertOnSubmit(bl);
                    db.SubmitChanges();
                    taodtlist();
                }
                catch
                {
                    lbloibl.Visible = true;
                    lbloibl.Text = "Lỗi!";
                }
            }
        }
    }
}