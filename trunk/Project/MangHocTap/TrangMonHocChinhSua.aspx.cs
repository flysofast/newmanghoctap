using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Collections;

namespace MangHocTap
{
    public partial class TrangMonHocChinhSua : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbthongbaosua.Visible = false;
            pncalendar1.Visible = false;
            pncalendar2.Visible = false;
            txtmmh.Attributes.Add("ReadOnly", "ReadOnly");
            txttmh.Attributes.Add("ReadOnly", "ReadOnly");
            txtcld1.Attributes.Add("ReadOnly", "ReadOnly");
            txtcld2.Attributes.Add("ReadOnly", "ReadOnly");
            if (!IsPostBack)
            {
                dlhocky.Enabled = false;               
                dlheso.Enabled = false;
                dlstc.Enabled = false;
                txtcld1.Enabled = false;
                txtcld2.Enabled = false;
                DropDownList1.Enabled = false;
                DropDownList2.Enabled = false;
                DropDownList3.Enabled = false;
                DropDownList4.Enabled = false;
                DropDownList5.Enabled = false;
                DropDownList6.Enabled = false;
                DropDownList7.Enabled = false;
                DropDownList8.Enabled = false;
                DropDownList9.Enabled = false;
                txtdqt.Enabled = false;
                txtdt.Enabled = false;
               

                dlhocky.CssClass = "tb1chinhsuamh";
                dlheso.CssClass = "tb1chinhsuamh";
                dlstc.CssClass = "tb1chinhsuamh";
                txtcld1.CssClass = "tb1chinhsuamh";
                txtcld2.CssClass = "tb1chinhsuamh";
                DropDownList1.CssClass = "tb1chinhsuamh";
                DropDownList2.CssClass = "tb1chinhsuamh";
                DropDownList3.CssClass = "tb1chinhsuamh";
                DropDownList4.CssClass = "tb1chinhsuamh";
                DropDownList5.CssClass = "tb1chinhsuamh";
                DropDownList6.CssClass = "tb1chinhsuamh";
                DropDownList7.CssClass = "tb1chinhsuamh";
                DropDownList8.CssClass = "tb1chinhsuamh";
                DropDownList9.CssClass = "tb1chinhsuamh";
                txtdqt.CssClass = "tb1chinhsuamh";
                txtdt.CssClass = "tb1chinhsuamh";
                txtphong1.Enabled = false;
                txtphong2.Enabled = false;
                txtphong3.Enabled = false;
                txtphong1.CssClass = "tb1chinhsuamh";
                txtphong2.CssClass = "tb1chinhsuamh";
                txtphong3.CssClass = "tb1chinhsuamh";

                btnCancel.Visible = false;
                btnOK.Visible = false;
                btnsua.Visible = true;

                for (int j = 1; j <= 11; j++)
                {
                    DropDownList1.Items.Add(j.ToString());
                    DropDownList2.Items.Add(j.ToString());
                    DropDownList4.Items.Add(j.ToString());
                    DropDownList5.Items.Add(j.ToString());
                    DropDownList7.Items.Add(j.ToString());
                    DropDownList8.Items.Add(j.ToString());

                }
                var q = from sv in db.SinhViens
                        join n in db.Nganhs on sv.manganh equals n.manganh
                        where sv.id == (int)Session["ID"]
                        select n.sonamdaotao;
                for (int k = 1; k <= q.FirstOrDefault().Value * 2; k++)
                    dlhocky.Items.Add(k.ToString());
                MonSinh ms = db.MonSinhs.Single(gc => gc.mamonhoc == Request.QueryString["mmh"] && gc.id == (int)Session["ID"]);
                MonHoc mh = db.MonHocs.Single(p => p.mamonhoc == ms.mamonhoc);
                txtmmh.Text = ms.mamonhoc;
                txttmh.Text = mh.tenmonhoc;
                dlstc.SelectedValue = ms.stc.ToString();
                dlheso.SelectedValue = ms.heso.ToString();
                txtcld1.Text = ms.batdau.Date.ToString("d", new CultureInfo("fr-FR"));
                txtcld2.Text = ms.ketthuc.Date.ToString("d", new CultureInfo("fr-FR"));
                txtdqt.Text = ms.diemquatrinh.ToString();
                txtdt.Text = ms.diemthi.ToString();
                dlhocky.SelectedValue = ms.hocky.ToString();
                if (ms.thoikhoabieu == "")
                {
                    pnb1.Visible = false;
                    pnb2.Visible = false;
                    pnb3.Visible = false;
                }
                else
                {
                    if (ms.thoikhoabieu == null || ms.thoikhoabieu == "")
                    {
                        pnb1.Visible = false;
                        pnb2.Visible = false;
                        pnb3.Visible = false;
                    }
                    else
                    {
                        string[] al = ms.thoikhoabieu.Split(';');
                        if (al.Length > 3)
                        {
                            pnb1.Visible = true;
                            pnb2.Visible = true;
                            pnb3.Visible = true;
                            string thu = al[0].Substring(4, 1);
                            string phong = al[0].Split(',')[1];
                            string tkt = al[0].Split('-')[1].Substring(0);
                            tkt = tkt.Split(']')[0];
                            string tbd = al[0].Split(',')[0].Substring(6);
                            tbd = tbd.Split('-')[0];
                            DropDownList1.SelectedValue = tbd;
                            DropDownList2.SelectedValue = tkt;
                            DropDownList3.SelectedValue = thu;
                            txtphong1.Text = phong;

                            thu = al[1].Substring(4, 1);
                            phong = al[1].Split(',')[1];
                            tkt = al[1].Split('-')[1].Substring(0);
                            tkt = tkt.Split(']')[0];
                            tbd = al[1].Split(',')[0].Substring(6);
                            tbd = tbd.Split('-')[0];
                            DropDownList4.SelectedValue = tbd;
                            DropDownList5.SelectedValue = tkt;
                            DropDownList6.SelectedValue = thu;
                            txtphong2.Text = phong;

                            thu = al[2].Substring(4, 1);
                            phong = al[2].Split(',')[1];
                            tkt = al[2].Split('-')[1].Substring(0);
                            tkt = tkt.Split(']')[0];
                            tbd = al[2].Split(',')[0].Substring(6);
                            tbd = tbd.Split('-')[0];
                            DropDownList7.SelectedValue = tbd;
                            DropDownList8.SelectedValue = tkt;
                            DropDownList9.SelectedValue = thu;
                            txtphong3.Text = phong;
                        }
                        else
                            if (al.Length > 2)
                            {
                                pnb1.Visible = true;
                                pnb2.Visible = true;
                                pnb3.Visible = false;
                                string thu = al[0].Substring(4, 1);
                                string phong = al[0].Split(',')[1];
                                string tkt = al[0].Split('-')[1].Substring(0);
                                tkt = tkt.Split(']')[0];
                                string tbd = al[0].Split(',')[0].Substring(6);
                                tbd = tbd.Split('-')[0];
                                DropDownList1.SelectedValue = tbd;
                                DropDownList2.SelectedValue = tkt;
                                DropDownList3.SelectedValue = thu;
                                txtphong1.Text = phong;

                                thu = al[1].Substring(4, 1);
                                phong = al[1].Split(',')[1];
                                tkt = al[1].Split('-')[1].Substring(0);
                                tkt = tkt.Split(']')[0];
                                tbd = al[1].Split(',')[0].Substring(6);
                                tbd = tbd.Split('-')[0];
                                DropDownList4.SelectedValue = tbd;
                                DropDownList5.SelectedValue = tkt;
                                DropDownList6.SelectedValue = thu;
                                txtphong2.Text = phong;
                            }
                            else
                            {
                                pnb1.Visible = true;
                                pnb2.Visible = false;
                                pnb3.Visible = false;
                                string thu = al[0].Substring(4, 1);
                                string phong = al[0].Split(',')[1];
                                string tkt = al[0].Split('-')[1].Substring(0);
                                tkt = tkt.Split(']')[0];
                                string tbd = al[0].Split(',')[0].Substring(6);
                                tbd = tbd.Split('-')[0];
                                DropDownList1.SelectedValue = tbd;
                                DropDownList2.SelectedValue = tkt;
                                DropDownList3.SelectedValue = thu;
                                txtphong1.Text = phong;
                            }
                    }
                }
            }
        }
        protected void imgbtncld1_Click(object sender, ImageClickEventArgs e)
        {
            if (txtcld1.Enabled == true)
            {
                pncalendar1.Visible = true;
                lbthongbaosua.Visible = false;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            pncalendar1.Visible = false;
            txtcld1.Text = Calendar1.SelectedDate.Date.ToString("d", new CultureInfo("fr-FR"));
            lbthongbaosua.Visible = false;
        }

        protected void imgbtncld2_Click(object sender, ImageClickEventArgs e)
        {
            if (txtcld2.Enabled == true)
            {
                pncalendar2.Visible = true;
                lbthongbaosua.Visible = false;
            }
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            pncalendar2.Visible = false;
            txtcld2.Text = Calendar2.SelectedDate.Date.ToString("d", new CultureInfo("fr-FR"));
            lbthongbaosua.Visible = false;
        }

        protected void imgbtnb1_Click(object sender, ImageClickEventArgs e)
        {
            if (txtcld2.Enabled == true)
            {
                if (pnb3.Visible == true)
                    pnb3.Visible = false;
                else
                    if (pnb2.Visible == true)
                        pnb2.Visible = false;
                    else
                        pnb1.Visible = false;
                lbthongbaosua.Visible = false;
            }     
        }

        protected void imgbtnb2_Click(object sender, ImageClickEventArgs e)
        {
            if (txtcld2.Enabled == true)
            {
                if (pnb3.Visible == true)
                    pnb3.Visible = false;
                else
                    if (pnb2.Visible == true)
                        pnb2.Visible = false;
                    else
                        pnb1.Visible = false;
                lbthongbaosua.Visible = false;
            }
        }

        protected void imgbtnb3_Click(object sender, ImageClickEventArgs e)
        {
            if (txtcld2.Enabled == true)
            {
                if (pnb3.Visible == true)
                    pnb3.Visible = false;
                else
                    if (pnb2.Visible == true)
                        pnb2.Visible = false;
                    else
                        pnb1.Visible = false;
                lbthongbaosua.Visible = false;
            }
        }

        protected void imgbtnthembuoi_Click(object sender, ImageClickEventArgs e)
        {
            if (txtcld2.Enabled == true)
            {
                if (pnb1.Visible == false)
                    pnb1.Visible = true;
                else
                    if (pnb2.Visible == false)
                        pnb2.Visible = true;
                    else
                        pnb3.Visible = true;
                lbthongbaosua.Visible = false;
            }
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            btnCancel.Visible = true;
            btnOK.Visible = true;
            btnsua.Visible = false;

            dlhocky.Enabled = true;
            
            dlheso.Enabled = true;
            dlstc.Enabled = true;
            txtcld1.Enabled = true;
            txtcld2.Enabled = true;

            DropDownList1.Enabled = true;
            DropDownList2.Enabled = true;
            DropDownList3.Enabled = true;
            DropDownList4.Enabled = true;
            DropDownList5.Enabled = true;
            DropDownList6.Enabled = true;
            DropDownList7.Enabled = true;
            DropDownList8.Enabled = true;
            DropDownList9.Enabled = true;

            txtdqt.Enabled = true;
            txtdt.Enabled = true;

            dlhocky.CssClass = "tb2chinhsuamh";
            dlheso.CssClass = "tb2chinhsuamh";
            dlstc.CssClass = "tb2chinhsuamh";
            txtcld1.CssClass = "tb2chinhsuamh";
            txtcld2.CssClass = "tb2chinhsuamh";
            DropDownList1.CssClass = "tb2chinhsuamh";
            DropDownList2.CssClass = "tb2chinhsuamh";
            DropDownList3.CssClass = "tb2chinhsuamh";
            DropDownList4.CssClass = "tb2chinhsuamh";
            DropDownList5.CssClass = "tb2chinhsuamh";
            DropDownList6.CssClass = "tb2chinhsuamh";
            DropDownList7.CssClass = "tb2chinhsuamh";
            DropDownList8.CssClass = "tb2chinhsuamh";
            DropDownList9.CssClass = "tb2chinhsuamh";
            txtdqt.CssClass = "tb2chinhsuamh";
            txtdt.CssClass = "tb2chinhsuamh";

            txtphong1.Enabled = true;
            txtphong2.Enabled = true;
            txtphong3.Enabled = true;
            txtphong1.CssClass = "tb2chinhsuamh";
            txtphong2.CssClass = "tb2chinhsuamh";
            txtphong3.CssClass = "tb2chinhsuamh";
        }

        protected void txtdqt_TextChanged(object sender, EventArgs e)
        {
            lbthongbaosua.Visible = false;
        }

        protected void txtdt_TextChanged(object sender, EventArgs e)
        {
            lbthongbaosua.Visible = false;

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            MonSinh ms = db.MonSinhs.Single(gc => gc.mamonhoc == Request.QueryString["mmh"] && gc.id == (int)Session["ID"]);
            try
            {
                ms.stc = int.Parse(dlstc.Text);
                ms.heso = int.Parse(dlheso.Text);
                string dqt = txtdqt.Text == "" ? "0" : txtdqt.Text;
                string dthi = txtdt.Text == "" ? "0" : txtdt.Text;
                ms.diemquatrinh = Math.Round(double.Parse(dqt),1);
                ms.diemthi = Math.Round(double.Parse(dthi), 1);
                if (ms.diemquatrinh > 10 || ms.diemquatrinh < 0)
                {
                    lbthongbaosua.Visible = true;
                    lbthongbaosua.Text = "Điểm quá trình phải nằm trong khoản 0 đến 10 !";
                }
                else
                    if (ms.diemthi > 10 || ms.diemthi < 0)
                    {
                        lbthongbaosua.Visible = true;
                        lbthongbaosua.Text = "Điểm thi phải nằm trong khoản 0 đến 10 !";
                    }
                    else
                    {

                        ms.batdau = DateTime.Parse(txtcld1.Text, new CultureInfo("fr-FR"));
                        ms.ketthuc = DateTime.Parse(txtcld2.Text, new CultureInfo("fr-FR"));
                        //thứ 2[1-2],H023;thứ 6[5-8],H023;
                        string tkb = "";
                        if (pnb1.Visible == true)
                        {
                            if (int.Parse(DropDownList1.SelectedValue) > int.Parse(DropDownList2.SelectedValue))
                            {
                                lbthongbaosua.Visible = true;
                                lbthongbaosua.Text = "Tiết học buổi 1 của bạn không hợp lệ !";
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
                                lbthongbaosua.Visible = true;
                                lbthongbaosua.Text = "Tiết học buổi 2 của bạn không hợp lệ !";
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
                                lbthongbaosua.Visible = true;
                                lbthongbaosua.Text = "Tiết học buổi 3 của bạn không hợp lệ !";
                                return;
                            }
                            else
                                tkb = tkb + "thứ " + DropDownList9.SelectedValue.Trim() + "[" +
                                    DropDownList7.SelectedValue.Trim() + "-" + DropDownList8.SelectedValue.Trim()
                                    + "]," + txtphong3.Text + ";";
                        }

                        ms.thoikhoabieu = tkb;
                        ms.trangthai = 0;
                        ms.hocky = int.Parse(dlhocky.SelectedValue);
                        db.SubmitChanges();
                        Response.Redirect(Request.RawUrl);
                        //lbthongbaosua.Visible = true;
                        //lbthongbaosua.Text = "Đã cập nhật sửa chữa !";

                        //btnCancel.Visible = false;
                        //btnOK.Visible = false;
                        //btnsua.Visible = true;

                        //dlhocky.Enabled = false;
                        //dlheso.Enabled = false;
                        //dlstc.Enabled = false;
                        //txtcld1.Enabled = false;
                        //txtcld2.Enabled = false;
                        //DropDownList1.Enabled = false;
                        //DropDownList2.Enabled = false;
                        //DropDownList3.Enabled = false;
                        //DropDownList4.Enabled = false;
                        //DropDownList5.Enabled = false;
                        //DropDownList6.Enabled = false;
                        //DropDownList7.Enabled = false;
                        //DropDownList8.Enabled = false;
                        //DropDownList9.Enabled = false;
                        //txtdqt.Enabled = false;
                        //txtdt.Enabled = false;

                        //dlhocky.CssClass = "tb1chinhsuamh";
                        //dlheso.CssClass = "tb1chinhsuamh";
                        //dlstc.CssClass = "tb1chinhsuamh";
                        //txtcld1.CssClass = "tb1chinhsuamh";
                        //txtcld2.CssClass = "tb1chinhsuamh";
                        //DropDownList1.CssClass = "tb1chinhsuamh";
                        //DropDownList2.CssClass = "tb1chinhsuamh";
                        //DropDownList3.CssClass = "tb1chinhsuamh";
                        //DropDownList4.CssClass = "tb1chinhsuamh";
                        //DropDownList5.CssClass = "tb1chinhsuamh";
                        //DropDownList6.CssClass = "tb1chinhsuamh";
                        //DropDownList7.CssClass = "tb1chinhsuamh";
                        //DropDownList8.CssClass = "tb1chinhsuamh";
                        //DropDownList9.CssClass = "tb1chinhsuamh";
                        //txtdqt.CssClass = "tb1chinhsuamh";
                        //txtdt.CssClass = "tb1chinhsuamh";
                        //txtphong1.Enabled = false;
                        //txtphong2.Enabled = false;
                        //txtphong3.Enabled = false;
                        //txtphong1.CssClass = "tb1chinhsuamh";
                        //txtphong2.CssClass = "tb1chinhsuamh";
                        //txtphong3.CssClass = "tb1chinhsuamh";
                    }
            }
            catch
            {
                lbthongbaosua.Visible = true;
                lbthongbaosua.Text = "Điểm số không hợp lệ !";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnCancel.Visible = false;
            btnOK.Visible = false;
            btnsua.Visible = true;
            dlhocky.Enabled = false;
            dlheso.Enabled = false;
            dlstc.Enabled = false;
            txtcld1.Enabled = false;
            txtcld2.Enabled = false;
            DropDownList1.Enabled = false;
            DropDownList2.Enabled = false;
            DropDownList3.Enabled = false;
            DropDownList4.Enabled = false;
            DropDownList5.Enabled = false;
            DropDownList6.Enabled = false;
            DropDownList7.Enabled = false;
            DropDownList8.Enabled = false;
            DropDownList9.Enabled = false;
            txtdqt.Enabled = false;
            txtdt.Enabled = false;

            dlhocky.CssClass = "tb1chinhsuamh";
            dlheso.CssClass = "tb1chinhsuamh";
            dlstc.CssClass = "tb1chinhsuamh";
            txtcld1.CssClass = "tb1chinhsuamh";
            txtcld2.CssClass = "tb1chinhsuamh";
            DropDownList1.CssClass = "tb1chinhsuamh";
            DropDownList2.CssClass = "tb1chinhsuamh";
            DropDownList3.CssClass = "tb1chinhsuamh";
            DropDownList4.CssClass = "tb1chinhsuamh";
            DropDownList5.CssClass = "tb1chinhsuamh";
            DropDownList6.CssClass = "tb1chinhsuamh";
            DropDownList7.CssClass = "tb1chinhsuamh";
            DropDownList8.CssClass = "tb1chinhsuamh";
            DropDownList9.CssClass = "tb1chinhsuamh";
            txtdqt.CssClass = "tb1chinhsuamh";
            txtdt.CssClass = "tb1chinhsuamh";
            txtphong1.Enabled = false;
            txtphong2.Enabled = false;
            txtphong3.Enabled = false;
            txtphong1.CssClass = "tb1chinhsuamh";
            txtphong2.CssClass = "tb1chinhsuamh";
            txtphong3.CssClass = "tb1chinhsuamh";
            for (int j = 1; j <= 11; j++)
            {
                DropDownList1.Items.Add(j.ToString());
                DropDownList2.Items.Add(j.ToString());
                DropDownList4.Items.Add(j.ToString());
                DropDownList5.Items.Add(j.ToString());
                DropDownList7.Items.Add(j.ToString());
                DropDownList8.Items.Add(j.ToString());

            }
            var q = from sv in db.SinhViens
                    join n in db.Nganhs on sv.manganh equals n.manganh
                    where sv.id == (int)Session["ID"]
                    select n.sonamdaotao;
            for (int k = 1; k <= q.FirstOrDefault().Value * 2; k++)
                dlhocky.Items.Add(k.ToString());
            MonSinh ms = db.MonSinhs.Single(gc => gc.mamonhoc == Request.QueryString["mmh"] && gc.id == (int)Session["ID"]);
            MonHoc mh = db.MonHocs.Single(p => p.mamonhoc == ms.mamonhoc);
            txtmmh.Text = ms.mamonhoc;
            txttmh.Text = mh.tenmonhoc;
            dlstc.SelectedValue = ms.stc.ToString();
            dlheso.SelectedValue = ms.heso.ToString();
            txtcld1.Text = ms.batdau.Date.ToString("d", new CultureInfo("fr-FR"));
            txtcld2.Text = ms.ketthuc.Date.ToString("d", new CultureInfo("fr-FR"));
            txtdqt.Text = ms.diemquatrinh.ToString();
            txtdt.Text = ms.diemthi.ToString();
            dlhocky.SelectedValue = ms.hocky.ToString();
            if (ms.thoikhoabieu == "")
            {
                pnb1.Visible = false;
                pnb2.Visible = false;
                pnb3.Visible = false;
            }
            else
            {
                if (ms.thoikhoabieu == null || ms.thoikhoabieu == "")
                {
                    pnb1.Visible = false;
                    pnb2.Visible = false;
                    pnb3.Visible = false;
                }
                else
                {
                    string[] al = ms.thoikhoabieu.Split(';');
                    if (al.Length > 3)
                    {
                        pnb1.Visible = true;
                        pnb2.Visible = true;
                        pnb3.Visible = true;
                        string thu = al[0].Substring(4, 1);
                        string phong = al[0].Split(',')[1];
                        string tkt = al[0].Split('-')[1].Substring(0);
                        tkt = tkt.Split(']')[0];
                        string tbd = al[0].Split(',')[0].Substring(6);
                        tbd = tbd.Split('-')[0];
                        DropDownList1.SelectedValue = tbd;
                        DropDownList2.SelectedValue = tkt;
                        DropDownList3.SelectedValue = thu;
                        txtphong1.Text = phong;

                        thu = al[1].Substring(4, 1);
                        phong = al[1].Split(',')[1];
                        tkt = al[1].Split('-')[1].Substring(0);
                        tkt = tkt.Split(']')[0];
                        tbd = al[1].Split(',')[0].Substring(6);
                        tbd = tbd.Split('-')[0];
                        DropDownList4.SelectedValue = tbd;
                        DropDownList5.SelectedValue = tkt;
                        DropDownList6.SelectedValue = thu;
                        txtphong2.Text = phong;

                        thu = al[2].Substring(4, 1);
                        phong = al[2].Split(',')[1];
                        tkt = al[2].Split('-')[1].Substring(0);
                        tkt = tkt.Split(']')[0];
                        tbd = al[2].Split(',')[0].Substring(6);
                        tbd = tbd.Split('-')[0];
                        DropDownList7.SelectedValue = tbd;
                        DropDownList8.SelectedValue = tkt;
                        DropDownList9.SelectedValue = thu;
                        txtphong3.Text = phong;
                    }
                    else
                        if (al.Length > 2)
                        {
                            pnb1.Visible = true;
                            pnb2.Visible = true;
                            pnb3.Visible = false;
                            string thu = al[0].Substring(4, 1);
                            string phong = al[0].Split(',')[1];
                            string tkt = al[0].Split('-')[1].Substring(0);
                            tkt = tkt.Split(']')[0];
                            string tbd = al[0].Split(',')[0].Substring(6);
                            tbd = tbd.Split('-')[0];
                            DropDownList1.SelectedValue = tbd;
                            DropDownList2.SelectedValue = tkt;
                            DropDownList3.SelectedValue = thu;
                            txtphong1.Text = phong;

                            thu = al[1].Substring(4, 1);
                            phong = al[1].Split(',')[1];
                            tkt = al[1].Split('-')[1].Substring(0);
                            tkt = tkt.Split(']')[0];
                            tbd = al[1].Split(',')[0].Substring(6);
                            tbd = tbd.Split('-')[0];
                            DropDownList4.SelectedValue = tbd;
                            DropDownList5.SelectedValue = tkt;
                            DropDownList6.SelectedValue = thu;
                            txtphong2.Text = phong;
                        }
                        else
                        {
                            pnb1.Visible = true;
                            pnb2.Visible = false;
                            pnb3.Visible = false;
                            string thu = al[0].Substring(4, 1);
                            string phong = al[0].Split(',')[1];
                            string tkt = al[0].Split('-')[1].Substring(0);
                            tkt = tkt.Split(']')[0];
                            string tbd = al[0].Split(',')[0].Substring(6);
                            tbd = tbd.Split('-')[0];
                            DropDownList1.SelectedValue = tbd;
                            DropDownList2.SelectedValue = tkt;
                            DropDownList3.SelectedValue = thu;
                            txtphong1.Text = phong;
                        }
                }
            }
        }
    }
}