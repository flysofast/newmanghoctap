using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["iddncookie"] != null)
            {
                Session["ID"] = int.Parse(Request.Cookies["iddncookie"].Value);
            }

            if ((int)Session["ID"] == 0)
            {
                Response.Redirect("/DangNhap.aspx");
            }

        }

    }
}