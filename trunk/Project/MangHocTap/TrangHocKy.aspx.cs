using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TrangHocKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnhk.Text = "Học kỳ " + ((Request.QueryString["hk"] == null || Request.QueryString["hk"] == "") ? "1" : Request.QueryString["hk"]);
                if ((int)Session["tab"] == 1)
                {
                    btnhk.Enabled = false;
                    btntmh.Enabled = true;
                    btnknht.Enabled = true;
                    ucHK.Visible = true;
                    ucTaoMonHoc.Visible = false;
                    ucKinhNghiem.Visible = false;
                    btnhk.CssClass = "btnkh";
                    btntmh.CssClass = "btn";
                    btnknht.CssClass = "btn";
                }
                else
                    if ((int)Session["tab"] == 2)
                    {
                        btnhk.Enabled = true;
                        btntmh.Enabled = false;
                        btnknht.Enabled = true;
                        btnhk.CssClass = "btn";
                        btntmh.CssClass = "btnkh";
                        btnknht.CssClass = "btn";
                        ucHK.Visible = false;
                        ucTaoMonHoc.Visible = true;
                        ucKinhNghiem.Visible = false;
                    }
                    else
                    {
                        btnhk.Enabled = true;
                        btntmh.Enabled = true;
                        btnknht.Enabled = false;
                        btnhk.CssClass = "btn";
                        btntmh.CssClass = "btn";
                        btnknht.CssClass = "btnkh";
                        ucHK.Visible = false;
                        ucTaoMonHoc.Visible = false;
                        ucKinhNghiem.Visible = true;
                    }
            }
        }
        protected void btnhk_Click(object sender, EventArgs e)
        {
            Session["tab"] = 1;
            btnhk.CssClass = "btnkh";
            btntmh.CssClass = "btn";
            btnknht.CssClass = "btn";

            btnhk.Enabled = false;
            btntmh.Enabled = true;
            btnknht.Enabled = true;

            ucHK.Visible = true;
            ucTaoMonHoc.Visible = false;
            ucKinhNghiem.Visible = false;


        }

        protected void btntmh_Click(object sender, EventArgs e)
        {
            Session["tab"] = 2;
            btnhk.CssClass = "btn";
            btntmh.CssClass = "btnkh";
            btnknht.CssClass = "btn";

            btnhk.Enabled = true;
            btntmh.Enabled = false;
            btnknht.Enabled = true;

            ucHK.Visible = false;
            ucTaoMonHoc.Visible = true;
            ucKinhNghiem.Visible = false;


        }

        protected void btnknht_Click(object sender, EventArgs e)
        {
            Session["tab"] = 3;
            btnhk.CssClass = "btn";
            btntmh.CssClass = "btn";
            btnknht.CssClass = "btnkh";

            btnhk.Enabled = true;
            btntmh.Enabled = true;
            btnknht.Enabled = false;

            ucHK.Visible = false;
            ucTaoMonHoc.Visible = false;
            ucKinhNghiem.Visible = true;


        }
    }
}