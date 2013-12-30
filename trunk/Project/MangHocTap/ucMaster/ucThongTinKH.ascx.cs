using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.ucMaster
{
    public partial class ucThongTinKH : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                var dttk = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
                if (dttk.Count() > 0)
                {
                    if (!string.IsNullOrEmpty(dttk.First().avatar))
                        imgAvatar.ImageUrl = "~/" + dttk.First().avatar;
                    else
                    {
                        if(dttk.First().gioitinh==true)
                            imgAvatar.ImageUrl = "~/ImagesAcc/Avatar/default_avatar_boy.jpg";
                        else
                            imgAvatar.ImageUrl = "~/ImagesAcc/Avatar/default_avatar_girl.png";
                    }
                        
                    lblTentaikhoan.Text = dttk.First().hoten;
                    //Hiển thị cấp độ:
                    var dtlv = from p in db.CapdoCHes where dttk.First().diemconghien <= p.diemch orderby p.diemch select p;
                    ImageLevel.ImageUrl = "~/" + dtlv.First().anhcapdo;
                    lblTencapdo.Text = dtlv.First().tencapdo;
                    hienthitruonglop();
                }
                
            }
        }

        public void hienthitruonglop()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dttl = from sv in db.SinhViens
                       join tr in db.Truongs on sv.matruong equals tr.matruong
                       join k in db.Khoas on sv.makhoa equals k.makhoa
                       join ng in db.Nganhs on sv.manganh equals ng.manganh
                       join lop in db.Lops on sv.malop equals lop.malop
                       where sv.id==(int)Session["ID"]
                       select new { sv.nienkhoa, tr.tentruong, k.tenkhoa, ng.tennganh, lop.tenlop };
            if (dttl.Count() > 0)
            {
                lblTruongtk.Text = dttl.First().tentruong;
                lblKhoatk.Text = dttl.First().tenkhoa;
                lblNganhtk.Text = dttl.First().tennganh;
                lblKhoahoctk.Text = "K" + dttl.First().nienkhoa.Substring(0, 2);
                lblLoptk.Text = dttl.First().tenlop;
            }
        }

        protected void btnDangxuat_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtdx = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            dtdx.First().trangthai = 0;
            db.SubmitChanges();
            Session["ID"] = 0;
            if (Request.Cookies["iddncookie"] != null)
            {
                Response.Cookies["iddncookie"].Expires = DateTime.Now.AddDays(-10);
            }
            //load lại trang đăng nhập
            Response.Redirect("/DangNhap.aspx");
        }
    }
}