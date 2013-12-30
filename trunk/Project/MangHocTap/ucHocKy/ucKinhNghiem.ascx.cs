using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.UC_HocKy
{
    public partial class ucKinhNghiem : System.Web.UI.UserControl
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                    Panel1.Visible = true;
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/TrangTaoBVKNHK.aspx?hk=" + Request.QueryString["hk"]);
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Điểm số")
            {
                //var q1 = from p1 in db.BaiVietMonHocs
                //         where p1.loaibai == 1 && p1.monhoc == Request.QueryString["mmh"]
                //         orderby p1.danhgia descending
                //         select p1;
                //if (q1.FirstOrDefault() == null)
                //    Panel1.Visible = true;
                //else
                //{
                //    Panel1.Visible = false;
                //    gvkt.DataSource = q1;
                //    gvkt.DataBind();
                //}
            }
            else
            {
                //var q1 = from p1 in db.BaiVietMonHocs
                //         where p1.loaibai == 1 && p1.monhoc == Request.QueryString["mmh"]
                //         orderby p1.ngayviet descending
                //         select p1;
                //if (q1.FirstOrDefault() == null)
                //    Panel1.Visible = true;
                //else
                //{
                //    Panel1.Visible = false;
                //    gvkt.DataSource = q1;
                //    gvkt.DataBind();
                //}
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Điểm số")
            {
                //var q1 = from p1 in db.BaiVietMonHocs
                //         where p1.loaibai == 1 && p1.tenbaiviet.Contains(TextBox1.Text) && p1.monhoc == Request.QueryString["mmh"]
                //         orderby p1.danhgia descending
                //         select p1;
                //if (q1.FirstOrDefault() == null)
                //{
                //    Panel1.Visible = true;
                //    gvkt.DataSource = q1;
                //    gvkt.DataBind();
                //}
                //else
                //{
                //    Panel1.Visible = false;
                //    gvkt.DataSource = q1;
                //    gvkt.DataBind();
                //}
            }
            else
            {
                //var q1 = from p1 in db.BaiVietMonHocs
                //         where p1.loaibai == 1 && p1.tenbaiviet.Contains(TextBox1.Text) && p1.monhoc == Request.QueryString["mmh"]
                //         orderby p1.ngayviet descending
                //         select p1;
                //if (q1.FirstOrDefault() == null)
                //{
                //    Panel1.Visible = true;
                //    gvkt.DataSource = q1;
                //    gvkt.DataBind();
                //}
                //else
                //{
                //    Panel1.Visible = false;
                //    gvkt.DataSource = q1;
                //    gvkt.DataBind();
                //}
            }

        }
    }
}