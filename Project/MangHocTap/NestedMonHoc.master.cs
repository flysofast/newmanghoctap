using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class NestedMonHoc : System.Web.UI.MasterPage
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void taomenu()
        {
            MonHoc mh = db.MonHocs.Single(p => p.mamonhoc == Request.QueryString["mmh"]);
            string tenmon = mh.tenmonhoc.Length > 20 ? mh.tenmonhoc.Substring(0, 20) + " ..." : mh.tenmonhoc;
            Response.Write("<a class='hemenu' id='hemenu1' href='TrangMonHocGhiChep.aspx?mmh=" + Request.QueryString["mmh"] + "'>" + tenmon + "</a>");
            Response.Write("<a class='hemenu' id='hemenu2' href='TrangMonHocChinhSua.aspx?mmh=" + Request.QueryString["mmh"] + "'>Thông tin</a>");
            Response.Write("<a class='hemenu' id='hemenu3' href='TrangMonHocBaiViet.aspx?mmh=" + Request.QueryString["mmh"] + "'>Học tập - chia sẻ</a>");
        }
        protected void txttk_TextChanged(object sender, EventArgs e)
        {

        }

        protected void imgbtntimkiem_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}