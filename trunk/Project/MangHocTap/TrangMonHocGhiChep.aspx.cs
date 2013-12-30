using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TrangMonHocGhiChep : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            //CKEditorControl1.Focus();
            if (!IsPostBack)
            {
                homnay();
                var r = from gc in db.BaiVietGhiChus
                        where gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                        orderby gc.tenbaiviet descending
                        select gc;
                lboxgc.DataSource = r;
                lboxgc.DataValueField = "mabaiviet";
                lboxgc.DataTextField = "tenbaiviet";
                lboxgc.DataBind();
                if (r.FirstOrDefault() != null)
                    lboxgc.SelectedIndex = 0;
                
            }
        }
        public void taolist()
        {
            var q = from gc in db.BaiVietGhiChus
                    where gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    orderby gc.tenbaiviet descending
                    select gc;
            lboxgc.DataSource = q;
            lboxgc.DataValueField = "mabaiviet";
            lboxgc.DataTextField = "tenbaiviet";
            lboxgc.DataBind();
            if (q.FirstOrDefault() != null)
                lboxgc.SelectedIndex = 0;
        }
        public void homnay()
        {
            var q = from gc in db.BaiVietGhiChus
                    where gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    && gc.tenbaiviet.Substring(8, gc.tenbaiviet.Length - 8) == DateTime.Now.ToLongDateString()
                    orderby gc.tenbaiviet descending
                    select gc;
            if (q.FirstOrDefault() == null)
            {
                var r = from gc in db.BaiVietGhiChus
                        where gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                        orderby gc.tenbaiviet descending
                        select gc.tenbaiviet;
                if (r.FirstOrDefault() == null)
                    lbngayghichep.Text = "Bài 01. " + DateTime.Now.ToLongDateString();
                else
                {
                    string s = r.First().Substring(4,2);
                    int so = int.Parse(s);
                    if (so >= 9)
                        lbngayghichep.Text = "Bài " + (so + 1).ToString() + ". " + DateTime.Now.ToLongDateString();
                    else
                        lbngayghichep.Text = "Bài 0" + (so + 1).ToString() + ". " + DateTime.Now.ToLongDateString();
                }
                CKEditorControl1.Text = "";
            }
            else
            {
                lbngayghichep.Text = q.FirstOrDefault().tenbaiviet;
                CKEditorControl1.Text = q.FirstOrDefault().noidung;
                lboxgc.SelectedIndex = 0;
            }
        }
        protected void btnhomnay_Click(object sender, EventArgs e)
        {
            homnay();
        }

        protected void btnluu_Click(object sender, EventArgs e)
        {
            var q = from gc in db.BaiVietGhiChus
                    where gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    && gc.tenbaiviet == lbngayghichep.Text
                    select gc;
            if (q.FirstOrDefault() == null)
            {
                BaiVietGhiChu bvgc = new BaiVietGhiChu();
                bvgc.tenbaiviet = lbngayghichep.Text;
                bvgc.noidung = CKEditorControl1.Text;
                bvgc.nguoiviet = (int)Session["ID"];
                bvgc.monhoc = Request.QueryString["mmh"];
                db.BaiVietGhiChus.InsertOnSubmit(bvgc);
                db.SubmitChanges();
                taolist();
            }
            else
            {
                BaiVietGhiChu bvgc = db.BaiVietGhiChus.Single(gc => gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    && gc.tenbaiviet == lbngayghichep.Text);
                bvgc.noidung = CKEditorControl1.Text;
                db.SubmitChanges();
            }
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            var q = from gc in db.BaiVietGhiChus
                    where gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    && gc.tenbaiviet == lbngayghichep.Text
                    select gc;
            if (q.FirstOrDefault() == null)
            {
               
            }
            else
            {
                BaiVietGhiChu bvgc = db.BaiVietGhiChus.Single(gc => gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    && gc.tenbaiviet == lbngayghichep.Text);
                db.BaiVietGhiChus.DeleteOnSubmit(bvgc);
                db.SubmitChanges();
                taolist();
                homnay();
            }
        }

        protected void lboxgc_SelectedIndexChanged(object sender, EventArgs e)
        {
            BaiVietGhiChu bvgc = db.BaiVietGhiChus.Single(gc => gc.monhoc == Request.QueryString["mmh"] && gc.nguoiviet == (int)Session["ID"]
                    && gc.tenbaiviet == lboxgc.SelectedItem.Text);
            CKEditorControl1.Text = bvgc.noidung;
            lbngayghichep.Text = bvgc.tenbaiviet;
        }
    }
}