using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MangHocTap.ucMaster
{
    public partial class ucThongBaoKy : System.Web.UI.UserControl
    {
        public string sotinnhan = "";
        public string solmketbban = "";
        public string sothongbao = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            loadTbtinnhan();
            LoadLoimoikb();
            Loadthongbao();
        }

        public void loadTbtinnhan()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dttbtn = from tn in db.TinNhans
                         join sv in db.SinhViens on tn.nguoigui equals sv.id
                         where tn.trangthai == 0 && tn.nguoinhan == (int)Session["ID"]
                         group tn by new { tn.nguoigui, sv.hoten, sv.avatar, sv.gioitinh } into kq
                         select new { kq.Key.nguoigui, kq.Key.avatar, kq.Key.hoten, kq.Key.gioitinh, sotin = kq.Count() };
            if (dttbtn.Count() > 0)
            {
                DataTable dttn1 = new DataTable();
                dttn1.Columns.Add("nguoigui");
                dttn1.Columns.Add("avatar");
                dttn1.Columns.Add("hoten");
                dttn1.Columns.Add("gioitinh");
                dttn1.Columns.Add("sotin");
                dttn1.Columns.Add("ngaynhan");
                dttn1.Columns.Add("noidung");
                foreach (var dt in dttbtn)
                {
                    var tnn = from p in db.TinNhans where p.nguoigui == dt.nguoigui && p.nguoinhan == (int)Session["ID"] && p.trangthai == 0 orderby p.ngaynhan descending select p;
                    string noidung = SetLenString(tnn.First().noidung);
                    dttn1.Rows.Add(dt.nguoigui, dt.avatar, dt.hoten, dt.gioitinh, dt.sotin, tnn.First().ngaynhan, noidung);
                }
                sotinnhan = dttbtn.Count().ToString();
                RepeaterTBTinnhan.DataSource = dttn1;
                RepeaterTBTinnhan.DataBind();
            }
            else
            {
                sotinnhan = "";
                Thongbaotn.Visible = true;
            }
        }

        public string laysotinnhan(string sotin)
        {
            return sotin;
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

        public string Getsotin(int sotin)
        {
            if (sotin > 0)
                return "(" + sotin + ")";
            else
                return "";
        }

        public string SetLenString(string s)
        {
            if (s.Length >= 30)
            {
                string st = s.Substring(0, 29);
                return st + "...";
            }
            return s;
        }

        public void LoadLoimoikb()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtkb = from kb in db.MoiKetBans
                       join sv in db.SinhViens on kb.id1 equals sv.id
                       where kb.id2 == (int)Session["ID"]
                       select sv;
            if (dtkb.Count() > 0)
            {
                solmketbban = dtkb.Count().ToString();
                Repeaterlmketban.DataSource = dtkb;
                Repeaterlmketban.DataBind();
            }
            else
            {
                solmketbban = "";
                lblThongbaolmkb.Visible = true;
            }
        }

        public void Loadthongbao()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dttb = from tb in db.ThongBaoBinhLuans
                       join sv in db.SinhViens on tb.ID equals sv.id
                       where tb.ID == (int)Session["ID"]
                       select new { sv.hoten, tb.Link, tb.NoiDung };
            if (dttb.Count() > 0)
            {
                sothongbao = dttb.Count().ToString();
                RepeaterThongbao.DataSource = dttb;
                RepeaterThongbao.DataBind();
            }
            else
            {
                sothongbao = "";
                lblThongbaocuatb.Visible = true;
            }
            
        }

        protected void Repeaterlmketban_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            if (e.CommandName == "Xacnhan")
            {
                int nggui = int.Parse(e.CommandArgument.ToString());
                //them ban be
                BanBe bb1 = new BanBe();
                bb1.id1 = (int)Session["ID"];
                bb1.id2 = nggui;
                bb1.quanhe = 1;
                db.BanBes.InsertOnSubmit(bb1);
                BanBe bb2 = new BanBe();
                bb2.id1 = nggui;
                bb2.id2 = (int)Session["ID"];
                bb2.quanhe = 1;
                db.BanBes.InsertOnSubmit(bb2);
                db.SubmitChanges();
                //xoa moi ban be
                MoiKetBan mkb = new MoiKetBan();
                mkb = db.MoiKetBans.Single(t => t.id1 == nggui && t.id2 == (int)Session["ID"]);
                db.MoiKetBans.DeleteOnSubmit(mkb);
                db.SubmitChanges();
            }

            if (e.CommandName == "Huybo")
            {
                int nggui1 = int.Parse(e.CommandArgument.ToString());
                //xoa moi ban be
                MoiKetBan mkb = db.MoiKetBans.Single(t => t.id1 == nggui1 && t.id2 == (int)Session["ID"]);
                db.MoiKetBans.DeleteOnSubmit(mkb);
                db.SubmitChanges();
            }
            LoadLoimoikb();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            loadTbtinnhan();
            LoadLoimoikb();
        }
    }
}