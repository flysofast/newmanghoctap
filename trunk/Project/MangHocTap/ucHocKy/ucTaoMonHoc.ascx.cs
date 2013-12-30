using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace MangHocTap.UC_HocKy
{
    public partial class ucTaoMonHoc : System.Web.UI.UserControl
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
        
            txtmmh.Attributes.Add("ReadOnly", "ReadOnly");
            txttmh.Attributes.Add("ReadOnly", "ReadOnly");
            txtcld1.Attributes.Add("ReadOnly", "ReadOnly");
            txtcld2.Attributes.Add("ReadOnly", "ReadOnly");
            if(!IsPostBack)
            {
                pncalendar1.Visible = false;
                pncalendar2.Visible = false;
                var iqmh = from mh in db.MonHocs
                           from sv in db.SinhViens
                           where sv.id == (int)Session["ID"] && mh.manganh == sv.manganh
                           select mh;
                ListBox1.DataSource = iqmh;
                ListBox1.DataValueField = "mamonhoc";
                ListBox1.DataTextField = "tenmonhoc";
                ListBox1.DataBind();

                //DataTable dt = new DataTable();
                //dt.Columns.Add("1", typeof(string));
                //dt.Columns.Add("2", typeof(string));
                //dt.Columns.Add("3", typeof(DropDownList));
                //DropDownList ddl = new DropDownList();
                for (int j = 1; j <= 11; j++)
                {
                    DropDownList1.Items.Add(j.ToString());
                    DropDownList2.Items.Add(j.ToString());
                    DropDownList4.Items.Add(j.ToString());
                    DropDownList5.Items.Add(j.ToString());
                    DropDownList7.Items.Add(j.ToString());
                    DropDownList8.Items.Add(j.ToString());

                }

               
               
            }
             
        }
        public void taotkb()
        {

        }
        protected void txttk_TextChanged(object sender, EventArgs e)
        {
            var q = from mh in db.MonHocs
                    where mh.tenmonhoc.Contains(txttk.Text.Trim()) || mh.mamonhoc.Contains(txttk.Text.Trim())
                    select mh;
            ListBox1.DataSource = q;
            ListBox1.DataValueField = "mamonhoc";
            ListBox1.DataTextField = "tenmonhoc";
            ListBox1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            var q = from mh in db.MonHocs
                    where mh.tenmonhoc.Contains(txttk.Text.Trim()) || mh.mamonhoc.Contains(txttk.Text.Trim())
                    select mh;
            ListBox1.DataSource = q;
            ListBox1.DataValueField = "mamonhoc";
            ListBox1.DataTextField = "tenmonhoc";
            ListBox1.DataBind();
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            pncalendar1.Visible = true;
           
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            pncalendar1.Visible = false;
            txtcld1.Text = Calendar1.SelectedDate.Date.ToString("d", new CultureInfo("fr-FR"));
           
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            pncalendar2.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            pncalendar2.Visible = false;
            txtcld2.Text = Calendar2.SelectedDate.Date.ToString("d", new CultureInfo("fr-FR"));
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            MonHoc mh = db.MonHocs.Single(p => p.mamonhoc == ListBox1.SelectedValue.ToString());
            txtmmh.Text = mh.mamonhoc;
            txttmh.Text = mh.tenmonhoc;
            dlstc.Text = mh.stc.ToString();
            dlheso.Text = mh.heso.ToString();
            txtcld1.Text = DateTime.Now.Date.ToString("d",new CultureInfo("fr-FR"));
            txtcld2.Text = DateTime.Now.AddMonths(5).Date.ToString("d",new CultureInfo("fr-FR"));
        }

        protected void imgbtnthembuoi_Click(object sender, ImageClickEventArgs e)
        {
            if (pnb1.Visible == false)
                pnb1.Visible = true;
            else
                if (pnb2.Visible == false)
                    pnb2.Visible = true;
                else
                    pnb3.Visible = true;
        }

        protected void imgbtnb3_Click(object sender, ImageClickEventArgs e)
        {
            if (pnb3.Visible == true)
                pnb3.Visible = false;
            else
                if (pnb2.Visible == true)
                    pnb2.Visible = false;
                else
                    pnb1.Visible =false;
        }

        protected void imgbtnb2_Click(object sender, ImageClickEventArgs e)
        {
            if (pnb3.Visible == true)
                pnb3.Visible = false;
            else
                if (pnb2.Visible == true)
                    pnb2.Visible = false;
                else
                    pnb1.Visible = false;
        }

        protected void imgbtnb1_Click(object sender, ImageClickEventArgs e)
        {
            if (pnb3.Visible == true)
                pnb3.Visible = false;
            else
                if (pnb2.Visible == true)
                    pnb2.Visible = false;
                else
                    pnb1.Visible = false;
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedIndex < 0)
            {
                pnthongbao.Visible = true;
                lbthongbao.Text = "Bạn chưa chọn môn học nào cả !";
            }
            else
            {
                var q = from ms in db.MonSinhs
                        where ms.id == (int)Session["ID"] && ms.mamonhoc == ListBox1.SelectedValue
                        select ms;
                if (q.FirstOrDefault() != null)
                {
                    pnthongbao.Visible = true;
                    lbthongbao.Text = "Bạn đã có môn học này rồi !";
                }
                else
                {
                    try
                    {
                        MonSinh m1 = new MonSinh();
                        m1.id = (int)Session["ID"];
                        m1.mamonhoc = ListBox1.SelectedValue;
                        m1.stc = int.Parse(dlstc.Text);
                        m1.heso = int.Parse(dlheso.Text);
                        string dqt = txtdqt.Text == "" ? "0" : txtdqt.Text;
                        string dthi = txtdt.Text == "" ? "0" : txtdt.Text;
                        m1.diemquatrinh = Math.Round(double.Parse(dqt), 1);
                        m1.diemthi = Math.Round(double.Parse(dthi), 1);
                        if (m1.diemquatrinh > 10 || m1.diemquatrinh < 0)
                        {
                            pnthongbao.Visible = true;
                            lbthongbao.Text = "Điểm quá trình phải nằm trong khoản 0 đến 10 !";
                        }
                        else
                            if (m1.diemthi > 10 || m1.diemthi < 0)
                            {
                                pnthongbao.Visible = true;
                                lbthongbao.Text = "Điểm thi phải nằm trong khoản 0 đến 10 !";
                            }
                            else
                            {

                                m1.batdau = DateTime.Parse(txtcld1.Text, new CultureInfo("fr-FR"));
                                m1.ketthuc = DateTime.Parse(txtcld2.Text, new CultureInfo("fr-FR"));
                                //thứ 2[1-2],H023;thứ 6[5-8],H023;
                                string tkb = "";
                                if (pnb1.Visible == true)
                                {
                                    if (int.Parse(DropDownList1.SelectedValue) > int.Parse(DropDownList2.SelectedValue))
                                    {
                                        pnthongbao.Visible = true;
                                        lbthongbao.Text = "Tiết học buổi 1 của bạn không hợp lệ !";
                                        return;
                                    }
                                    else
                                        tkb = "thứ " + DropDownList3.SelectedValue.Trim() + "[" +
                                            DropDownList1.SelectedValue.Trim() + "-" + DropDownList2.SelectedValue.Trim()
                                            + "]," + txtphong1.Text + ";";
                                }
                                if (pnb2.Visible == true)
                                {
                                    if (int.Parse(DropDownList4.SelectedValue) > int.Parse(DropDownList5.SelectedValue))
                                    {
                                        pnthongbao.Visible = true;
                                        lbthongbao.Text = "Tiết học buổi 2 của bạn không hợp lệ !";
                                        return;
                                    }
                                    else
                                        tkb = tkb + "thứ " + DropDownList6.SelectedValue.Trim() + "[" +
                                            DropDownList4.SelectedValue.Trim() + "-" + DropDownList5.SelectedValue.Trim() +
                                            "]," + txtphong2.Text + ";";
                                }
                                if (pnb3.Visible == true)
                                {
                                    if (int.Parse(DropDownList7.SelectedValue) > int.Parse(DropDownList8.SelectedValue))
                                    {
                                        pnthongbao.Visible = true;
                                        lbthongbao.Text = "Tiết học buổi 3 của bạn không hợp lệ !";
                                        return;
                                    }
                                    else
                                        tkb = tkb + "thứ " + DropDownList9.SelectedValue.Trim() + "[" +
                                            DropDownList7.SelectedValue.Trim() + "-" + DropDownList8.SelectedValue.Trim() 
                                            + "]," + txtphong3.Text + ";";
                                }
                                
                                m1.thoikhoabieu = tkb;
                                m1.trangthai = 0;
                                m1.hocky = int.Parse(((Request.QueryString["hk"] == null || Request.QueryString["hk"] == "") ? "1" : Request.QueryString["hk"]));
                                db.MonSinhs.InsertOnSubmit(m1);
                                db.SubmitChanges();
                                Session["tab"] = 1;
                                Response.Redirect("TrangHocKy.aspx?hk=" + Request.QueryString["hk"]);
                                //pnthongbao.Visible = true;
                                //lbthongbao.Text = "đã tạo môn học " + ListBox1.SelectedItem + " cho bạn !";
                                //for (int aa = 1; aa < 100000000; aa++)
                                   

                                
                            }
                    }
                    catch(Exception ex)
                    {
                        pnthongbao.Visible = true;
                        lbthongbao.Text = "Các cột điểm của bạn không hợp lệ !" + ex;
                    }                   
                }
            }
        }   

        protected void btntbOK_Click(object sender, EventArgs e)
        {
            pnthongbao.Visible = false;
            
        }

        protected void imgbtnclose_Click(object sender, ImageClickEventArgs e)
        {
            pnthongbao.Visible = false;
        }
        protected void imgbtnclose2_Click(object sender, ImageClickEventArgs e)
        {
            pnbaomonthieu.Visible = false;
        }

        protected void btngui2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Label10.Visible = true;
            }
            else
            {
                pnbaomonthieu.Visible = false;
                pnsautb.Visible = true;
            }
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            pnbaomonthieu.Visible = false;
        }
        protected void btnsautb_Click(object sender, EventArgs e)
        {
            pnsautb.Visible = false;
        }

        protected void lbtnthieumon_Click(object sender, EventArgs e)
        {
            pnbaomonthieu.Visible = true;
            Label10.Visible = false;
        }
        //public void taobang()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("1", typeof(string));
        //    dt.Columns.Add("2", typeof(string));
        //    dt.Columns.Add("3");
        //    DropDownList ddl = new DropDownList();
        //    for (int j = 1; j <= 11; j++)
        //        ddl.Items.Add(j.ToString());
        //    ddl.Selecteddex = 0;
        //    for (int i = 1; i <= 3; i++)
        //    {

        //        TextBox tb = new TextBox();
        //        DataRow drow = dt.NewRow();
        //        drow.ItemArray = new object[] { "Buổi " + i.ToString(), "Từ tiết", ddl };
        //        dt.Rows.Add(drow);
        //    }
        //    gvtkb.DataSource = dt;
        //    gvtkb.DataBind();      
        //}
        //protected void gvtkb_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gvtkb.EditIndex = e.NewEditIndex;
        //    taobang();
        //}
    }
}