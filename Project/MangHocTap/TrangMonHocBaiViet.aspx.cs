using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TrangMonHocBaiViet : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var q1 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 1 && p1.monhoc == Request.QueryString["mmh"]
                         orderby p1.danhgia descending
                         select p1;
                if (q1.FirstOrDefault() == null)
                    Panel1.Visible = true;
                else
                {
                    Panel1.Visible = false;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
                var q2 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 2 && p1.monhoc == Request.QueryString["mmh"]
                         select p1;
                if (q2.FirstOrDefault() == null)
                    Panel2.Visible = true;
                else
                {
                    Panel2.Visible = false;
                    gvch.DataSource = q2;
                    gvch.DataBind();
                }
                var q3 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 3 && p1.monhoc == Request.QueryString["mmh"]
                         select p1;
                if (q3.FirstOrDefault() == null)
                    Panel3.Visible = true;
                else
                {
                    Panel3.Visible = false;
                    gvtl.DataSource = q3;
                    gvtl.DataBind();
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/TrangTaoBVMH.aspx?mmh=" + Request.QueryString["mmh"]);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/TrangTaoBVMH2.aspx?mmh=" + Request.QueryString["mmh"]);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/TrangTaoBVMH3.aspx?mmh=" + Request.QueryString["mmh"]);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Điểm số")
            {
                var q1 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 1 && p1.monhoc == Request.QueryString["mmh"]
                         orderby p1.danhgia descending
                         select p1;
                if (q1.FirstOrDefault() == null)
                    Panel1.Visible = true;
                else
                {
                    Panel1.Visible = false;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
            }
            else
            {
                var q1 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 1 && p1.monhoc == Request.QueryString["mmh"]
                         orderby p1.ngayviet descending
                         select p1;
                if (q1.FirstOrDefault() == null)
                    Panel1.Visible = true;
                else
                {
                    Panel1.Visible = false;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Điểm số")
            {
                var q1 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 1 && p1.tenbaiviet.Contains(TextBox1.Text) && p1.monhoc == Request.QueryString["mmh"]
                         orderby p1.danhgia descending
                         select p1;
                if (q1.FirstOrDefault() == null)
                {
                    Panel1.Visible = true;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
                else
                {
                    Panel1.Visible = false;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
            }
            else
            {
                var q1 = from p1 in db.BaiVietMonHocs
                         where p1.loaibai == 1 && p1.tenbaiviet.Contains(TextBox1.Text) && p1.monhoc == Request.QueryString["mmh"]
                         orderby p1.ngayviet descending
                         select p1;
                if (q1.FirstOrDefault() == null)
                {
                    Panel1.Visible = true;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
                else
                {
                    Panel1.Visible = false;
                    gvkt.DataSource = q1;
                    gvkt.DataBind();
                }
            }
     
        }
    }
}