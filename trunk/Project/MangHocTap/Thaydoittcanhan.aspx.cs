using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class Thaydoittcanhan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTTTaikhoan();
            }
        }

        public void LoadTTTaikhoan()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtttsv = from sv in db.SinhViens where sv.id == (int)Session["ID"] select sv;
            if (dtttsv.Count() > 0)
            {
                //ten sinh vien dn
                lblsvdangnhap.Text = "(" + dtttsv.First().hoten + ")";
                lblemailsvdn.Text = dtttsv.First().email;

                //Thong tin sv
                lblhoten.Text = txtedithoten.Text = dtttsv.First().hoten;
                lblMatkhaukh.Text = "**********";
                lblSodtsv.Text = txteditsdt.Text = dtttsv.First().sodt;
                DateTime birday = Convert.ToDateTime(dtttsv.First().ngaysinh);
                LoadBirthDay(birday.Day, birday.Month, birday.Year);
                lblNgaysinhsv.Text = birday.Date.ToShortDateString();

                bool gt = bool.Parse(dtttsv.First().gioitinh.ToString());
                if (gt == true)
                {
                    lblGioitinhsv.Text = "Nam";
                    RadioNam.Checked = true;
                }
                else
                {
                    lblGioitinhsv.Text = "Nữ";
                    RadioNu.Checked = true;
                }

                if (dtttsv.First().avatar == null)
                    imgThayavatar.ImageUrl = getavatar("", gt);
                else
                    imgThayavatar.ImageUrl = getavatar(dtttsv.First().avatar, gt);
            }
        }

        public void LoadBirthDay(int ngay,int thang,int nam)
        {
            for (int i = 1; i <= 31; i++)
                ddlChonngay.Items.Add(new ListItem(i.ToString(),i.ToString()));
            ddlChonngay.SelectedValue = ngay.ToString();
            for (int i = 1; i <= 12; i++)
                ddlChonthang.Items.Add(new ListItem(i.ToString(), i.ToString()));
            ddlChonthang.SelectedValue = thang.ToString();
            for (int i = DateTime.Now.Year; i >= 1985; i--)
                ddlChonnam.Items.Add(new ListItem(i.ToString(), i.ToString()));
            ddlChonnam.SelectedValue = nam.ToString();
        }

        public string getavatar(string imgavt, bool gt)
        {
            if (string.IsNullOrEmpty(imgavt))
            {
                if (gt == true)
                    return "~/ImagesAcc/Avatar/default_avatar_boy.jpg";
                else
                    return "~/ImagesAcc/Avatar/default_avatar_girl.png";
            }
            else
                return "~/" + imgavt;

        }

        protected void lnkbtntentk_Click(object sender, EventArgs e)
        {
            Panelhoten.Visible = true;
        }

        protected void btnHuyhoten_Click(object sender, EventArgs e)
        {
            Panelhoten.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panelavatar.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panelavatar.Visible = false;
        }

        protected void lnkbtnmatkhau_Click(object sender, EventArgs e)
        {
            Panelmatkhau.Visible = true;
        }

        protected void btnHuymatkhau_Click(object sender, EventArgs e)
        {
            Panelmatkhau.Visible = false;
        }

        protected void lnkbtnsdt_Click(object sender, EventArgs e)
        {
            Panelsdt.Visible = true;
        }

        protected void btnHuysdt_Click(object sender, EventArgs e)
        {
            Panelsdt.Visible = false;
        }

        protected void lnkbtnngaysinh_Click(object sender, EventArgs e)
        {
            Panelngsinh.Visible = true;
        }

        protected void btnHuyns_Click(object sender, EventArgs e)
        {
            Panelngsinh.Visible = false;
        }

        protected void lnkbtngtinh_Click(object sender, EventArgs e)
        {
            Panelgioitinh.Visible = true;
        }

        protected void btnHuygtinh_Click(object sender, EventArgs e)
        {
            Panelgioitinh.Visible = false;
        }

        protected void btnLuuhoten_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            if (dt.Count() > 0)
            {
                dt.First().hoten = txtedithoten.Text;
                db.SubmitChanges();
                lblhoten.Text = lblsvdangnhap.Text = dt.First().hoten;
                Panelhoten.Visible = false;
            }
        }

        protected void btnLuumatkhau_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            if (dt.Count() > 0)
            {
                if (Classes.CMahoa.MaHoa("prmkey", txteditmkcu.Text.Trim()) != dt.First().matkhau)
                {
                    lblThongbaoloi.Text = "Mật khẩu cũ không chính xác";
                    return;
                }
                dt.First().matkhau = Classes.CMahoa.MaHoa("prmkey", txteditmkmoi.Text.Trim());
                db.SubmitChanges();
                Panelmatkhau.Visible = false;
            }
        }

        protected void btnLuusdt_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            if (dt.Count() > 0)
            {
                dt.First().sodt = txteditsdt.Text.Trim();
                db.SubmitChanges();
                lblSodtsv.Text = dt.First().sodt.Trim();
                Panelsdt.Visible = false;
            }
        }

        protected void btnLuuns_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            if (dt.Count() > 0)
            {
                DateTime brday = new DateTime();
                brday = brday.AddDays(int.Parse(ddlChonngay.Text) - 1).AddMonths(int.Parse(ddlChonthang.Text) - 1).AddYears(int.Parse(ddlChonnam.Text) - 1);
                dt.First().ngaysinh = brday.Date;
                db.SubmitChanges();
                lblNgaysinhsv.Text = Convert.ToDateTime(dt.First().ngaysinh).Date.ToShortDateString();
                Panelngsinh.Visible = false;
            }
        }

        protected void btnLuugtinh_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            if (dt.Count() > 0)
            {
                dt.First().gioitinh = RadioNam.Checked;
                db.SubmitChanges();

                bool gt = bool.Parse(dt.First().gioitinh.ToString());
                if (gt == true) 
                    lblGioitinhsv.Text = "Nam";
                else
                    lblGioitinhsv.Text = "Nữ";
                Panelgioitinh.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from p in db.SinhViens where p.id == (int)Session["ID"] select p;
            if (dt.Count() > 0)
            {
                if (FileUploadavt.FileName != "")
                {
                    //Xóa ảnh cũ
                    if (dt.First().avatar != null)
                    {
                        string dd = Server.MapPath(dt.First().avatar);
                        System.IO.File.Delete(dd);
                    }
                    //UpLoad ảnh lên máy chủ
                    FileUploadavt.SaveAs(Server.MapPath(@"ImagesAcc/Avatar/"
                    + FileUploadavt.FileName));
                    dt.First().avatar = @"ImagesAcc/Avatar/" + FileUploadavt.FileName;
                    db.SubmitChanges();
                    imgThayavatar.ImageUrl = "~/" + dt.First().avatar;
                    Panelavatar.Visible = false;
                }
            }
        }

        

    }
}