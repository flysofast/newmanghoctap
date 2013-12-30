using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class QLTaikhoansv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                var dtsv = from sv in db.SinhViens
                           join tr in db.Truongs on sv.matruong equals tr.matruong
                           join kh in db.Khoas on sv.makhoa equals kh.makhoa
                           join ng in db.Nganhs on sv.manganh equals ng.manganh
                           join lop in db.Lops on sv.malop equals lop.malop
                           select new { sv.avatar, sv.id, sv.email, sv.hoten, sv.matkhau, sv.nienkhoa, tr.matruong, tr.tentruong, kh.tenkhoa, lop.tenlop, ng.tennganh };
                GridViewTaikhoanuser.DataSource = dtsv;
                GridViewTaikhoanuser.DataBind();

                LoadTruonghoc();
                ddlChontruong.SelectedValue = dtsv.FirstOrDefault().matruong;
                LoaddtKhoa();
            }
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

        public void LoadTruonghoc()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            ddlChontruong.DataSource = db.Truongs;
            ddlChontruong.DataTextField = "tentruong";
            ddlChontruong.DataValueField = "matruong";
            ddlChontruong.DataBind();
            ddlChontruong.Items.Insert(0, new ListItem("--Chọn Trường--", "0"));
            ddlChontruong.SelectedIndex = 0;
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
                lblThongbaoloi.Text = ex.Message;
            }
        }

        public int GetNamhoc(int khoahoc)
        {
            if (khoahoc > 34)
                return 2010 + (khoahoc - 34);
            else
                return 2010 - (34 - khoahoc);
        }

        protected void GridViewTaikhoanuser_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int id = e.NewSelectedIndex;
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dt = from sv in db.SinhViens
                     where sv.email == Server.HtmlDecode(GridViewTaikhoanuser.Rows[id].Cells[1].Text)
                     select sv;
            txtEmail.Text = Server.HtmlDecode(GridViewTaikhoanuser.Rows[id].Cells[1].Text);
            txtHoten.Text = Server.HtmlDecode(GridViewTaikhoanuser.Rows[id].Cells[2].Text);
            txtMatkhau.Text = Classes.CMahoa.GiaiMa("prmkey", dt.First().matkhau);
            lblTieudesptaikhoan.Text = "Chỉnh sửa thông tin sinh viên";
            PanelSupostTaikhoan.Visible = true;
        }

        protected void GridViewTaikhoanuser_SelectedIndexChanged(object sender, EventArgs e)
        {
            PanelSupostTaikhoan.Visible = false;
        }

        protected void ImgbtnCloseForm_Click(object sender, ImageClickEventArgs e)
        {
            PanelSupostTaikhoan.Visible = false;
        }
    }
}