using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class TinNhan1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idnhantin = Request.QueryString["idnt"];
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                var dtbanbe = from bb in db.BanBes
                              join sv in db.SinhViens on bb.id2 equals sv.id
                              where bb.id1 == (int)Session["ID"]
                              select sv;
                if (dtbanbe.Count() > 0)
                {
                    txtTinnhan.Enabled = true;
                    btnGui.Enabled = true;
                    DataListdsbanbe.DataSource = dtbanbe;
                    DataListdsbanbe.DataBind();
                    if (idnhantin != null && idnhantin != "")
                    {
                        lblIDBanbe.Text = idnhantin;
                        lblTenbangui.Text = getnamesv(int.Parse(idnhantin));
                    }
                    else
                    {
                        lblIDBanbe.Text = dtbanbe.First().id.ToString();
                        lblTenbangui.Text = getnamesv(dtbanbe.First().id);
                    }
                    Gettinnhan();
                    chuyentrangthaitn();
                }
                else
                    lblTenbangui.Text = "Bạn đang cô đơn hay kết bank ngay";
            }
        }

        public void chuyentrangthaitn()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtctt = from p in db.TinNhans
                       where (p.nguoigui == int.Parse(lblIDBanbe.Text) && p.nguoinhan == (int)Session["ID"])&&p.trangthai==0
                       select p;
            foreach (var ch in dtctt)
                ch.trangthai = 1;
            db.SubmitChanges();
        }

        public string getavatar(string imgavt, bool gt)
        {
            if (string.IsNullOrEmpty(imgavt))
            {
                if (gt == true)
                    return "~/ImagesAcc/Avatar/default_avatar_boy.jpg";
                else
                    return "~/ImagesAcc/Avatar/default_avatar_girl.png";
            }
            else
                return "~/" + imgavt;
        }

        public string getavatarsv(int idsv)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtav = from p in db.SinhViens where p.id == idsv select p;
            if (dtav.Count() > 0)
            {
                if (dtav.First().avatar == null || dtav.First().avatar == "")
                {
                    if (dtav.First().gioitinh == true)
                        return "~/ImagesAcc/Avatar/default_avatar_boy.jpg";
                    else
                        return "~/ImagesAcc/Avatar/default_avatar_girl.png";
                }
                else
                    return "~/" + dtav.First().avatar;
            }
            return "";
        }

        public string getnamesv(int idsv)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtav = from p in db.SinhViens where p.id == idsv select p;
            if (dtav.Count() > 0)
            {
                return dtav.First().hoten;
            }
            return "Lỗi tên";
        }

        public string getTrangthai(int trangthai)
        {
            if (trangthai == 1)
                return "~/ImagesAcc/icon-onlinefr.png";
            else
                return "~/ImagesAcc/icon-offline.png";
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            TinNhan tn = new TinNhan();
            tn.nguoigui = (int)Session["ID"];
            tn.nguoinhan = int.Parse(lblIDBanbe.Text);
            tn.noidung = txtTinnhan.Text;
            tn.ngaynhan = DateTime.Now;
            tn.trangthai = 0;
            db.TinNhans.InsertOnSubmit(tn);
            db.SubmitChanges();
            Gettinnhan();
            txtTinnhan.Text = "";
        }

        protected void txtTinnhan_TextChanged(object sender, EventArgs e)
        {
            if (ckbChonGui.Checked == true)
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                TinNhan tn = new TinNhan();
                tn.nguoigui = (int)Session["ID"];
                tn.nguoinhan = int.Parse(lblIDBanbe.Text);
                tn.noidung = txtTinnhan.Text;
                tn.ngaynhan = DateTime.Now;
                tn.trangthai = 0;
                db.TinNhans.InsertOnSubmit(tn);
                db.SubmitChanges();
                Gettinnhan();
                txtTinnhan.Text = "";
            }
        }

        public void Gettinnhan()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dttn = from p in db.TinNhans
                       where (p.nguoigui == int.Parse(lblIDBanbe.Text) && p.nguoinhan == (int)Session["ID"]) || (p.nguoigui == (int)Session["ID"] && p.nguoinhan == int.Parse(lblIDBanbe.Text))
                       orderby p.ngaynhan descending
                       select p;
            DataListTinnhan.DataSource = dttn;
            DataListTinnhan.DataBind();
        }

        protected void DataListdsbanbe_ItemCommand(object source, DataListCommandEventArgs e)
        {
            lblIDBanbe.Text = e.CommandName;
            lblTenbangui.Text = getnamesv(int.Parse(e.CommandName));
            Gettinnhan();
            chuyentrangthaitn();
        }

        protected void lbtnTimkiembb_Click(object sender, ImageClickEventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dttkbb = from bb in db.BanBes
                         join sv in db.SinhViens on bb.id2 equals sv.id
                         where bb.id1 == (int)Session["ID"] && sv.hoten.Contains(txtTimkiembb.Text)
                         select sv;
            DataListdsbanbe.DataSource = dttkbb;
            DataListdsbanbe.DataBind();
        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtbanbe = from bb in db.BanBes
                          join sv in db.SinhViens on bb.id2 equals sv.id
                          where bb.id1 == (int)Session["ID"]
                          select sv;
            DataListdsbanbe.DataSource = dtbanbe;
            DataListdsbanbe.DataBind();
            Gettinnhan();
        }
    }
}