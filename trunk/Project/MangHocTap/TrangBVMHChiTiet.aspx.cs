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
            var q = from p1 in db.BaiVietMonHocs
                    join p2 in db.SinhViens on p1.nguoiviet equals p2.id
                    where p1.mabaiviet == int.Parse(Request.QueryString["mbv"])
                    select new { p2.hoten, p2.avatar, p2.diemconghien, p1.tenbaiviet, p1.noidung };
            avatar.ImageUrl = q.FirstOrDefault().avatar;
            lbten.Text = q.FirstOrDefault().hoten;
            lbtieudebv.Text = q.FirstOrDefault().tenbaiviet;
            lbnoidungbv.Text = q.FirstOrDefault().noidung;
            

        }
        public void laymamonhoc()
        {
            Response.Write("/TrangMonHocBaiViet.aspx?mmh=" + Request.QueryString["mmh"]);
        }
        public void laytieude()
        {
            BaiVietMonHoc bv = db.BaiVietMonHocs.Single(p => p.mabaiviet == int.Parse(Request.QueryString["mbv"]));
            Response.Write(" >>" + bv.tenbaiviet);
        }
    }
}