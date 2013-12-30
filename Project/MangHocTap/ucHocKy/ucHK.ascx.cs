using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MangHocTap.ucHocKy
{
    public partial class ucHK : System.Web.UI.UserControl
    {
        int hk;
        public string mamh;
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            hk = int.Parse((Request.QueryString["hk"] == null || Request.QueryString["hk"] == "") ? "1" : Request.QueryString["hk"]);
            if (!IsPostBack)
            {
                int nk = int.Parse((from sv in db.SinhViens
                                    where sv.id == (int)Session["ID"]
                                    select sv.nienkhoa).FirstOrDefault().Substring(2, 4));

                var q = (nk <= 2012) ? (from ms in db.MonSinhs
                                        join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                        where ms.id == (int)Session["ID"] && ms.hocky == hk
                                        let dt = (double)ms.diemthi
                                        let dqt = (double)ms.diemquatrinh
                                        let hs = (double)ms.heso
                                        let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                        let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                        let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                        let dc = d4 == 4.0 ? "A" : d4 == 3.0 ? "B" : d4 == 2.0 ? "C" : d4 == 1.0 ? "D" : "F"
                                        select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.heso, ms.diemquatrinh, ms.diemthi, d4, d10, dc }) :
                        (from ms in db.MonSinhs
                         join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                         where ms.id == (int)Session["ID"] && ms.hocky == hk
                         let dt = (double)ms.diemthi
                         let dqt = (double)ms.diemquatrinh
                         let hs = (double)ms.heso
                         let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                         let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                         let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                         d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                         let dc = d10 >= 9.5 ? "A+" : d10 >= 8.5 ? "A" : d10 >= 8.0 ? "B+" :
                         d10 >= 7.0 ? "B" : d10 >= 6.5 ? "C+" : d10 >= 5.5 ? "C" : d10 >= 5.0 ? "D+" : d10 >= 4.0 ? "D" : "F"
                         select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.heso, ms.diemquatrinh, ms.diemthi, d4, d10, dc });
                if (q.FirstOrDefault() == null)
                {
                    lbh10.Visible = false;
                    lbh4.Visible = false;
                    lbhc.Visible = false;
                    lbtd.Visible = false;
                    lbhd.Visible = false;
                    lbkhongco1.Visible = true;
                    Panel1.CssClass = "kq_no";
                }
                else
                {
                    lbkhongco1.Visible = false;
                    lbh10.Visible = true;
                    lbh4.Visible = true;
                    lbhc.Visible = true;
                    lbtd.Visible = true;
                    lbhd.Visible = true;
                    Panel1.CssClass = "kq";
                    gvhocky.DataSource = q;
                    gvhocky.DataBind();
                    float td10 = 0, td4 = 0;
                    int dtd = 0;
                    for (int i = 0; i < gvhocky.Rows.Count; i++)
                    {
                        dtd += int.Parse(((Label)gvhocky.Rows[i].Cells[2].FindControl("Label3")).Text);
                        td10 += float.Parse(((Label)gvhocky.Rows[i].Cells[6].FindControl("Label7")).Text) * int.Parse(((Label)gvhocky.Rows[i].Cells[2].FindControl("Label3")).Text);
                        td4 += float.Parse(((Label)gvhocky.Rows[i].Cells[7].FindControl("Label8")).Text) * int.Parse(((Label)gvhocky.Rows[i].Cells[2].FindControl("Label3")).Text);
                    }
                    lbh10.Text = Math.Round(td10 / dtd, 2).ToString();
                    lbh4.Text = Math.Round(td4 / dtd, 2).ToString();
                    double td4kq = Math.Round(td4 / dtd, 2);
                    lbhc.Text = td4kq >= 3.6 ? "Xuất sắc" : td4kq >= 3.2 ? "Giỏi" : td4kq >= 2.5 ? "Khá" : td4kq >= 2.0 ? "Trung bình" : "Không đạt";
                }
            }
        }
        public void taobangsua()
        {
            var q = (int.Parse((from sv in db.SinhViens
                                where sv.id == (int)Session["ID"]
                                select sv.nienkhoa).FirstOrDefault().Substring(2, 4)) <= 2012) ? (from ms in db.MonSinhs
                                                                                                  join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                                                                                  where ms.id == (int)Session["ID"] && ms.hocky == hk
                                                                                                  let dt = (double)ms.diemthi
                                                                                                  let dqt = (double)ms.diemquatrinh
                                                                                                  let hs = (double)ms.heso
                                                                                                  let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                                                                                  let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                                                                                  let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                                                                                  let dc = d4 == 4.0 ? "A" : d4 == 3.0 ? "B" : d4 == 2.0 ? "C" : d4 == 1.0 ? "D" : "F"
                                                                                                  select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.heso, ms.diemquatrinh, ms.diemthi, d4, d10, dc }) :
                       (from ms in db.MonSinhs
                        join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                        where ms.id == (int)Session["ID"] && ms.hocky == hk
                        let dt = (double)ms.diemthi
                        let dqt = (double)ms.diemquatrinh
                        let hs = (double)ms.heso
                        let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                        let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                        let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                        d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                        let dc = d10 >= 9.5 ? "A+" : d10 >= 8.5 ? "A" : d10 >= 8.0 ? "B+" :
                        d10 >= 7.0 ? "B" : d10 >= 6.5 ? "C+" : d10 >= 5.5 ? "C" : d10 >= 5.0 ? "D+" : d10 >= 4.0 ? "D" : "F"
                        select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.heso, ms.diemquatrinh, ms.diemthi, d4, d10, dc });
            gvhocky.DataSource = q;
            gvhocky.DataBind();
        }
        public void taobang()
        {
            var q = (int.Parse((from sv in db.SinhViens
                                where sv.id == (int)Session["ID"]
                                select sv.nienkhoa).FirstOrDefault().Substring(2, 4)) <= 2012) ? (from ms in db.MonSinhs
                                                                                                  join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                                                                                  where ms.id == (int)Session["ID"] && ms.hocky == hk
                                                                                                  let dt = (double)ms.diemthi
                                                                                                  let dqt = (double)ms.diemquatrinh
                                                                                                  let hs = (double)ms.heso
                                                                                                  let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                                                                                  let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                                                                                  let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                                                                                  let dc = d4 == 4.0 ? "A" : d4 == 3.0 ? "B" : d4 == 2.0 ? "C" : d4 == 1.0 ? "D" : "F"
                                                                                                  select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.heso, ms.diemquatrinh, ms.diemthi, d4, d10, dc }) :
                        (from ms in db.MonSinhs
                         join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                         where ms.id == (int)Session["ID"] && ms.hocky == hk
                         let dt = (double)ms.diemthi
                         let dqt = (double)ms.diemquatrinh
                         let hs = (double)ms.heso
                         let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                         let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                         let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                         d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                         let dc = d10 >= 9.5 ? "A+" : d10 >= 8.5 ? "A" : d10 >= 8.0 ? "B+" :
                         d10 >= 7.0 ? "B" : d10 >= 6.5 ? "C+" : d10 >= 5.5 ? "C" : d10 >= 5.0 ? "D+" : d10 >= 4.0 ? "D" : "F"
                         select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.heso, ms.diemquatrinh, ms.diemthi, d4, d10, dc });
            gvhocky.DataSource = q;
            gvhocky.DataBind();
            float td10 = 0, td4 = 0;
            int dtd = 0;
            for (int i = 0; i < gvhocky.Rows.Count; i++)
            {
                dtd += int.Parse(((Label)gvhocky.Rows[i].Cells[2].FindControl("Label3")).Text);
                td10 += float.Parse(((Label)gvhocky.Rows[i].Cells[6].FindControl("Label7")).Text) * int.Parse(((Label)gvhocky.Rows[i].Cells[2].FindControl("Label3")).Text);
                td4 += float.Parse(((Label)gvhocky.Rows[i].Cells[7].FindControl("Label8")).Text) * int.Parse(((Label)gvhocky.Rows[i].Cells[2].FindControl("Label3")).Text);
            }
            lbh10.Text = Math.Round(td10 / dtd, 2).ToString();
            lbh4.Text = Math.Round(td4 / dtd, 2).ToString();
            double td4kq = Math.Round(td4 / dtd, 2);
            lbhc.Text = td4kq >= 3.6 ? "Xuất sắc" : td4kq >= 3.2 ? "Giỏi" : td4kq >= 2.5 ? "Khá" : td4kq >= 2.0 ? "Trung bình" : "Không đạt";
        }
        protected void gvhocky_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvhocky.EditIndex = e.NewEditIndex;
            taobangsua();
        }

        protected void gvhocky_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvhocky.EditIndex = -1;
            taobang();
        }

        protected void gvhocky_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //string stc = ((TextBox)gvhocky.Rows[e.RowIndex].Cells[2].FindControl("TextBox1")).Text;
                string stc = ((TextBox)gvhocky.Rows[e.RowIndex].Cells[2].Controls[1]).Text;
                string heso = ((TextBox)gvhocky.Rows[e.RowIndex].Cells[3].Controls[1]).Text;
                string d1 = ((TextBox)gvhocky.Rows[e.RowIndex].Cells[4].Controls[1]).Text;
                string d2 = ((TextBox)gvhocky.Rows[e.RowIndex].Cells[5].Controls[1]).Text;
                if (d1 == "")
                    d1 = "0";
                if (d2 == "")
                    d2 = "0";
                string mmh = gvhocky.DataKeys[e.RowIndex].Value.ToString();
                MonSinh ms = db.MonSinhs.Single(p => p.mamonhoc == mmh && p.id == (int)Session["ID"] && p.hocky == hk);
                ms.stc = int.Parse(stc);
                ms.heso = int.Parse(heso);
                ms.diemquatrinh = Math.Round(double.Parse(d1), 1);
                ms.diemthi = Math.Round(double.Parse(d2), 2);
                db.SubmitChanges();
                gvhocky.EditIndex = -1;
                taobang();
            }
            catch
            {
                pnthongbao.Visible = true;
                lbthongbao.Text = "Dữ liệu không hợp lệ !";
            }
        }
               
        protected void gvhocky_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            pnmsbox.Visible = true;
            Label11.Text = gvhocky.DataKeys[e.RowIndex].Value.ToString();
            
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            pnmsbox.Visible = false;
        }
        
        protected void imgbtnclose_Click(object sender, ImageClickEventArgs e)
        {
            pnthongbao.Visible = false;
            
        }

        protected void btntbOK_Click(object sender, EventArgs e)
        {
            pnthongbao.Visible = false;
        }
        public void XoaDong()
        {
            MonSinh ms = db.MonSinhs.Single(p => p.id == (int)Session["ID"] && p.mamonhoc.Trim() == Label11.Text.Trim());
            //foreach (MonSinh ms in db.MonSinhs.Where(p => p.id == (int)Session["ID"] && p.mamonhoc.Trim() == mamh.Trim()))
            db.MonSinhs.DeleteOnSubmit(ms);
            db.SubmitChanges();
            Response.Redirect("TrangHocKy.aspx?hk=" + Request.QueryString["hk"]);
        }
        public void XoaHetDong() 
        {
            var q = from p in db.MonSinhs
                    where p.id == (int)Session["ID"] && p.hocky == hk
                    select p;
            foreach (MonSinh ms in q)
                db.MonSinhs.DeleteOnSubmit(ms);
            db.SubmitChanges();
            Response.Redirect("TrangHocKy.aspx?hk=" + Request.QueryString["hk"]);
        }
        protected void btnOK2_Click(object sender, EventArgs e)
        {
            pnmsbox.Visible = false;
            if (CheckBox1.Checked == false)
                XoaDong();
            else
                XoaHetDong();
        }

        protected void imgbtnclose2_Click(object sender, ImageClickEventArgs e)
        {
            pnmsbox.Visible = false;
        }
    }
}