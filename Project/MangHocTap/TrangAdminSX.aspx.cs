using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TrangAdminSX : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvmonhoc.DataSource = db.MonHocs;
            gvmonhoc.DataBind();
        }

        protected void gvmonhoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvmonhoc.EditIndex = e.NewEditIndex;
            gvmonhoc.DataSource = db.MonHocs;
            gvmonhoc.DataBind();
        }

        protected void gvmonhoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvmonhoc.EditIndex = -1;
            gvmonhoc.DataSource = db.MonHocs;
            gvmonhoc.DataBind();
        }

        protected void gvmonhoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            gvmonhoc.DataSource = db.MonHocs;
            gvmonhoc.DataBind();
        }

        protected void gvmonhoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            gvmonhoc.DataSource = db.MonHocs;
            gvmonhoc.DataBind();
        }

        protected void gvmonhoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvmonhoc.PageIndex = e.NewPageIndex;
            gvmonhoc.DataSource = db.MonHocs;
            gvmonhoc.DataBind();
        }
    }
}