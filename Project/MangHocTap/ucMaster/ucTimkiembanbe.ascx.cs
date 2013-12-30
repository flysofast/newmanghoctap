using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.ucMaster
{
    public partial class ucTimkiembanbe : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgbtnTimbanbe_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/PageTimkiembb.aspx?tukhoa=" + txtTimbanbe.Text);
        }

        protected void txtTimbanbe_TextChanged(object sender, EventArgs e)
        {

            Response.Redirect("/PageTimkiembb.aspx?tukhoa=" + txtTimbanbe.Text);
        }
    }
}