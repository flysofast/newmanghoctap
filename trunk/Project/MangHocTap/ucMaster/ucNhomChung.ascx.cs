using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.ucMaster
{
    public partial class ucNhomChung : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var sv = db.SinhViens.Single(p => p.id == (int)Session["ID"]);
            lbTruong.Text = db.Truongs.Single(p => p.matruong == sv.matruong).tentruong;
            lbKhoa.Text = db.Khoas.Single(p => p.makhoa == sv.makhoa).tenkhoa;
            lbKhoaK.Text = "Khóa K" + sv.nienkhoa.Substring(0, 2);
            lbLop.Text = db.Lops.Single(p => p.malop == sv.malop).tenlop;
        }
    }
}