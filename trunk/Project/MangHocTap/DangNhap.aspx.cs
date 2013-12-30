using MangHocTap.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Xử lý khi đã đăng nhập:
            if (Request.Cookies["iddncookie"] != null)
            {
                Session["ID"] = int.Parse(Request.Cookies["iddncookie"].Value.Trim());
                Response.Redirect("/Default.aspx");
                return;
            }
            if (Session["ID"] != null && (int)Session["ID"] != 0)
            {
                Response.Redirect("/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadBirthDay();

                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                ddlChontruong.DataSource = db.Truongs;
                ddlChontruong.DataTextField = "tentruong";
                ddlChontruong.DataValueField = "matruong";
                ddlChontruong.DataBind();
                ddlChontruong.Items.Insert(0, new ListItem("--Chọn Trường--", "0"));
                ddlChontruong.SelectedIndex = 0;
            }
        }

        public void LoadBirthDay()
        {
            for (int i = 1; i <= 31; i++)
                ddlNgay.Items.Add(i.ToString());
            ddlNgay.SelectedIndex = DateTime.Now.Day - 1;
            for (int i = 1; i <= 12; i++)
                ddlThang.Items.Add(i.ToString());
            ddlThang.SelectedIndex = DateTime.Now.Month - 1;
            for (int i = DateTime.Now.Year; i >= 1985; i--)
                ddlNam.Items.Add(i.ToString());
        }

        public void LoaddtKhoa()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtk = from p in db.Khoas where p.matruong == ddlChontruong.SelectedValue select p;
            ddlChonKhoa.DataSource = dtk;
            ddlChonKhoa.DataValueField = "makhoa";
            ddlChonKhoa.DataTextField = "tenkhoa";
            ddlChonKhoa.DataBind();
            ddlChonKhoa.Items.Insert(0, new ListItem("--Chọn Khoa--", "0"));
            ddlChonKhoa.SelectedIndex = 0;
        }

        public void LoaddtNganh()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtng = from p in db.Nganhs where p.makhoa == ddlChonKhoa.SelectedValue select p;
            ddlChonNganh.DataSource = dtng;
            ddlChonNganh.DataValueField = "manganh";
            ddlChonNganh.DataTextField = "tennganh";
            ddlChonNganh.DataBind();
            ddlChonNganh.Items.Insert(0, new ListItem("--Chọn Ngành học--", "0"));
            ddlChonNganh.SelectedIndex = 0;
        }

        public void LoadKhoahoc()
        {
            try
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                var dtkbd = from p in db.Nganhs where p.manganh == ddlChonNganh.SelectedValue select p;
                int khoabd = 0;
                if (dtkbd.Count() > 0)
                    khoabd = int.Parse(dtkbd.First().khoabd.ToString());
                for (int i = 0; GetNamhoc(khoabd) <= DateTime.Now.Year; i++)
                {
                    string nienkhoa = GetNamhoc(khoabd).ToString() + GetNamhoc(khoabd + int.Parse(dtkbd.First().sonamdaotao.ToString()));
                    ddlChonKhoahoc.Items.Add(new ListItem(khoabd.ToString(), khoabd.ToString() + nienkhoa));
                    khoabd++;
                }
                ddlChonKhoahoc.Items.Insert(0, new ListItem("--Chọn khóa học--", "0"));
                ddlChonKhoahoc.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                lblThongbaodky.Text = ex.Message;
            }
        }

        public int GetNamhoc(int khoahoc)
        {
            if (khoahoc > 34)
                return 2010 + (khoahoc - 34);
            else
                return 2010 - (34 - khoahoc);
        }

        public void LoaddtLopHoc()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtlop = from p in db.Lops where p.manganh == ddlChonNganh.SelectedValue && p.malop.Contains(ddlChonKhoahoc.SelectedItem.Text.Trim()) select p;
            ddlChonLop.DataSource = dtlop;
            ddlChonLop.DataValueField = "malop";
            ddlChonLop.DataTextField = "tenlop";
            ddlChonLop.DataBind();
            ddlChonLop.Items.Insert(0, new ListItem("--Chọn lớp học--", "0"));
            ddlChonLop.SelectedIndex = 0;
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var ktdn = from p in db.SinhViens
                       where p.email == txtEmaildangnhap.Text.Trim() && p.matkhau == CMahoa.MaHoa("prmkey", txtMatkhau.Text.Trim())
                       select p;

            if (ktdn.Count() > 0)
            {
                Session["ID"] = ktdn.First().id;
                //chơi cookies
                if (ckbNhotaikhoan.Checked == true)
                {
                    Response.Cookies["iddncookie"].Value = ktdn.First().id.ToString();
                    Response.Cookies["iddncookie"].Expires = DateTime.Now.AddDays(10);
                }
                lblThongbao.Text = "";
                //Chuyen trang thai
                SinhVien sv = new SinhVien();
                ktdn.First().trangthai = 1;
                db.SubmitChanges();
                Response.Redirect("/Default.aspx");
            }
            else
                lblThongbao.Text = "Mật khẩu hoặc tài khoản của bạn không chính xác!!!";

        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            try
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();

                var dtkt = from p in db.SinhViens where p.email == txtEmail.Text.Trim() select p;
                if (dtkt.Count() > 0)
                {
                    lblThongbaodky.Text = "Email đã tồn tại!!!";
                    return;
                }
                //Tao id:
                int idsv;
                if (db.SinhViens.Count() == 0)
                    idsv = 0;
                else
                    idsv = db.SinhViens.Max(p => p.id);

                SinhVien sv = new SinhVien();
                sv.id = idsv + 1;
                sv.email = txtEmail.Text.Trim();
                sv.hoten = txtHoten.Text;
                sv.matkhau = CMahoa.MaHoa("prmkey", txtMatkhaudk.Text.Trim());
                sv.sodt = txtSodienthoai.Text;
                string stdate = ddlNgay.Text + "-" + ddlThang.Text + "-" + ddlNam.Text;
                DateTime brday = new DateTime();
                brday = brday.AddDays(int.Parse(ddlNgay.Text) - 1).AddMonths(int.Parse(ddlThang.Text) - 1).AddYears(int.Parse(ddlNam.Text) - 1);
                sv.ngaysinh = brday;
                sv.gioitinh = Gioitinhnam.Checked;
                sv.diemconghien = 0;
                sv.nienkhoa = ddlChonKhoahoc.Text;
                sv.matruong = ddlChontruong.SelectedValue;
                sv.makhoa = ddlChonKhoa.SelectedValue;
                sv.manganh = ddlChonNganh.SelectedValue;
                sv.malop = ddlChonLop.SelectedValue;
                if (Gioitinhnam.Checked == true)
                    sv.avatar = "ImagesAcc/Avatar/default_avatar_boy.jpg";
                else
                    sv.avatar = "ImagesAcc/Avatar/default_avatar_girl.png";
                db.SinhViens.InsertOnSubmit(sv);
                db.SubmitChanges();
                Response.Redirect("/DangNhap.aspx");
            }
            catch (Exception ex)
            {
                lblThongbaodky.Text = ex.Message;
            }
        }

        protected void ddlChontruong_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoaddtKhoa();
            if (ddlChontruong.SelectedIndex == 0)
            {
                Panelchonkhoa.Visible = false;
                PanelChonNganh.Visible = false;
                PanelChonLop.Visible = false;
                PanelChonkhoahoc.Visible = false;
            }
            else
                Panelchonkhoa.Visible = true;
        }

        protected void ddlChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoaddtNganh();
            PanelChonNganh.Visible = true;
        }

        protected void ddlChonNganh_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKhoahoc();
            PanelChonkhoahoc.Visible = true;
        }

        protected void ddlChonKhoahoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoaddtLopHoc();
            PanelChonLop.Visible = true;
        }
    }
}