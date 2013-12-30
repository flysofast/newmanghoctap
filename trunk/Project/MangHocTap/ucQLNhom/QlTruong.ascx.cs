using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.ucQLNhom
{
    public partial class QlTruong : System.Web.UI.UserControl
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                //var w = db.DangNhaps.Where(p => p.TenDangNhap == (Session["dn"]).ToString()).First();
                //if (!w.Quyen) Response.Redirect("Default.aspx");
            }
            catch
            {
                //Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                var q = db.Truongs;

                DropDownList1.DataSource = q;
                DropDownList1.DataBind();
                //drdDanhmuc.DataSource = db.danhmucs;
                //drdDanhmuc.DataBind();
                //drdDanhmuc.SelectedValue = q.First().madanhmuc;
                tbMa.Text = q.First().matruong;
                tbTen.Text = q.First().tentruong;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //var q = db.loais.Skip(DropDownList1.SelectedIndex).Take(1).First();
            var q = db.Truongs.Single(p => p.matruong == DropDownList1.SelectedValue);
            tbMa.Text = q.tentruong;
            tbTen.Text = q.tentruong;
            //drdDanhmuc.SelectedValue = q.madanhmuc;
            btSua.Enabled = true;
            btXoa.Enabled = true;
        }

        protected void drdDanhmuc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            lbTen.Visible = false;
            lbMa.Visible = false;
            if (btThem.Text == "Thêm mới...")
            {
                tbMa.Enabled = true;
                tbMa.Text = "";
                tbTen.Text = "";
                DropDownList1.Visible = false;
                Label1.Visible = false;
                btSua.Enabled = false;
                btXoa.Enabled = false;
                btThem.Text = "Thêm";
            }
            else
            {
                bool kt = true;
                if (tbTen.Text == "" || db.Truongs.Any(p => p.tentruong.ToUpper() == tbTen.Text.ToUpper()))
                {
                    lbTen.Visible = true;
                    kt = false;
                }
                if (tbMa.Text.Length != 3 || db.Truongs.Any(p => p.matruong.ToUpper() == tbMa.Text.ToUpper()))
                {
                    lbMa.Visible = true;
                    kt = false;
                }
                if (kt == true)
                {
                    Truong tr = new Truong();
                    tr.tentruong = tbTen.Text;
                    tr.matruong = tbMa.Text;
                    tr.sodt = tbSdt.Text;
                    tr.diachi = tbDiachi.Text;
                    tr.gioithieu = tbGioiThieu.Text;
                    //tr.madanhmuc = drdDanhmuc.SelectedValue;
                    db.Truongs.InsertOnSubmit(tr);
                    db.SubmitChanges();
                    //System.Windows.Forms.MessageBox.Show("Thêm loại mới thành công!");

                    // Gọi hàm ngay từ đầu để chạy ra đúng thứ tự lúc render ra page
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel)
                        , Guid.NewGuid().ToString(), "Thêm trường mới thành công!", true);
                    ThongBao("Thêm trường mới thành công!");
                    //Response.Redirect(Request.RawUrl);

                    lbTen.Visible = false;
                    lbMa.Visible = false;
                    tbMa.Enabled = false;

                    DropDownList1.Visible = true;
                    Label1.Visible = true;
                    btSua.Enabled = true;
                    btXoa.Enabled = true;
                    btThem.Text = "Thêm mới...";

                    DropDownList1.DataSource = db.Truongs;
                    DropDownList1.DataBind();
                    DropDownList1.SelectedValue = tbTen.Text;

                }

            }
        }

        protected void btSua_Click(object sender, EventArgs e)
        {
            Truong tr = db.Truongs.Single(p => p.matruong == DropDownList1.SelectedValue);
            if (!db.Truongs.Any(p => p.tentruong != tr.tentruong && p.tentruong == tbTen.Text))
            {
                tr.tentruong = tbTen.Text;
                tr.matruong = tbMa.Text;
                tr.sodt = tbSdt.Text;
                tr.diachi = tbDiachi.Text;
                tr.gioithieu = tbGioiThieu.Text;
                //q.madanhmuc = drdDanhmuc.SelectedValue;
                db.SubmitChanges();
                //System.Windows.Forms.MessageBox.Show("Sửa thành công!");
                ThongBao("Sửa thành công!");

                DropDownList1.DataSource = db.Truongs;
                DropDownList1.DataBind();
                DropDownList1.SelectedValue = tbTen.Text;
                //Response.Redirect(Request.RawUrl);
            }
            else
                lbTen.Visible = true;

        }

        void ThongBao(string tb)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel)
                        , Guid.NewGuid().ToString(), tb, true);

        }

        protected void btXoa_Click(object sender, EventArgs e)
        {
            Truong q = db.Truongs.Single(p => p.matruong == DropDownList1.SelectedValue);
            db.Truongs.DeleteOnSubmit(q);
            db.SubmitChanges();
            ThongBao("Xóa thành công!");
            //Response.Redirect(Request.RawUrl);

            DropDownList1.DataSource = db.Truongs;
            DropDownList1.DataBind();
            tbMa.Text = db.Truongs.First().matruong;
            tbTen.Text = db.Truongs.First().tentruong;
        }
    }
}