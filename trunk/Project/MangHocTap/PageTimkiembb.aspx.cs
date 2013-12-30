using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MangHocTap
{
    public partial class PageTimkiembb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string chuoitk = Request.QueryString["tukhoa"];
            if (string.IsNullOrEmpty(chuoitk))
            {
                Response.Redirect("/Default.aspx");
                return;
            }
            Timkiemchuabb();
            Timkiemlabb();
            Timkiemlmketban();
        }

        public void Timkiemchuabb()
        {
            string chuoitk = Request.QueryString["tukhoa"];
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dttkbb = from p in db.SinhViens
                       join tr in db.Truongs on p.matruong equals tr.matruong
                       join kh in db.Khoas on p.makhoa equals kh.makhoa
                       join ng in db.Nganhs on p.manganh equals ng.manganh
                       join lop in db.Lops on p.malop equals lop.malop
                       where (from bb in db.BanBes where bb.id1 == (int)Session["ID"] && bb.id2 == p.id select bb.id2).FirstOrDefault() == null
                       && (from kb in db.MoiKetBans where kb.id2 == (int)Session["ID"] && kb.id1 == p.id select kb.id1).FirstOrDefault() == null 
                       && p.id != (int)Session["ID"] && p.hoten.ToLower().Contains(chuoitk.ToLower())
                       select new { p.id, p.hoten, p.avatar, p.gioitinh, tr.tentruong, kh.tenkhoa, ng.tennganh, lop.tenlop };

            //var dttkbb = from p in db.Timkiembanbe((int)Session["ID"])
            //             where p.hoten.ToLower().Contains(chuoitk.ToLower())
            //             select p;

            try{
                
                DataListChuabb.DataSource = dttkbb;
                DataListChuabb.DataBind();
                int sodong = DataListChuabb.Items.Count;
                if (sodong > 0)
                    lblSobbtimdc.Text = "(" + sodong.ToString() + ")";
                else
                {
                    lblThongbaorong.Visible = true;
                    lblThongbaorong.Text = "Không tìm thấy người bạn cần tìm nào với từ khóa \"" + chuoitk + "\"";
                    lblSobbtimdc.Text = "(0)";
                }
            }
            catch(Exception ex)
            {
                lblThongbaorong.Visible = true;
                lblThongbaorong.Text = "Có lỗi xảy ra: \"" + chuoitk + ex.Message + "\"";
                lblSobbtimdc.Text = "(0)";
            }
        }

        public void Timkiemlabb()
        {
            string chuoitk = Request.QueryString["tukhoa"];
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtbb = from bb in db.BanBes
                       join sv in db.SinhViens on bb.id2 equals sv.id
                       join tr in db.Truongs on sv.matruong equals tr.matruong
                       join kh in db.Khoas on sv.makhoa equals kh.makhoa
                       join ng in db.Nganhs on sv.manganh equals ng.manganh
                       join lop in db.Lops on sv.malop equals lop.malop
                       where bb.id1 == (int)Session["ID"] && sv.hoten.Contains(chuoitk)
                       select new {sv.id, sv.avatar, sv.gioitinh, sv.hoten, tr.tentruong, kh.tenkhoa, ng.tennganh, lop.tenlop };
            if (dtbb.Count() > 0)
            {
                lblSobbcuaban.Text = "(" + dtbb.Count().ToString() + ")";
                DataListLabanbe.DataSource = dtbb;
                DataListLabanbe.DataBind();
            }
            else
            {
                lblThongbaokhongbb.Visible = true;
                lblThongbaokhongbb.Text = "Không tìm thấy người bạn nào với từ khóa \"" + chuoitk + "\"";
                lblSobbcuaban.Text = "(0)";
            }
        }

        public void Timkiemlmketban()
        {
            string chuoitk = Request.QueryString["tukhoa"];
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtkb = from lmkb in db.MoiKetBans
                       join sv in db.SinhViens on lmkb.id1 equals sv.id
                       join tr in db.Truongs on sv.matruong equals tr.matruong
                       join kh in db.Khoas on sv.makhoa equals kh.makhoa
                       join ng in db.Nganhs on sv.manganh equals ng.manganh
                       join lop in db.Lops on sv.malop equals lop.malop
                       where lmkb.id2 == (int)Session["ID"] && sv.hoten.Contains(chuoitk)
                       select new {sv.id, sv.avatar, sv.gioitinh, sv.hoten, tr.tentruong, kh.tenkhoa, ng.tennganh, lop.tenlop };
            if (dtkb.Count() > 0)
            {
                lblsolmkb.Text = "(" + dtkb.Count().ToString() + ")";
                DataListLoimoikb.DataSource = dtkb;
                DataListLoimoikb.DataBind();
            }
            else
            {
                lblThongbaokhcolmkb.Visible = true;
                lblThongbaokhcolmkb.Text = "Không tìm thấy lời mời kết bạn nào với từ khóa \"" + chuoitk + "\"";
                lblsolmkb.Text = "(0)";
            }
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

        public bool Setbuttonketban(int id)
        {
            Response.Write(id.ToString());
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtmkb = from p in db.MoiKetBans where p.id1 == (int)Session["ID"] && p.id2 == id select p;
            if (dtmkb.Count() > 0)
                return false;
            return true;
        }

        protected void DataListChuabb_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Ketban")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                MoiKetBan mkb = new MoiKetBan();
                mkb.id1 = (int)Session["ID"];
                mkb.id2 = id;
                db.MoiKetBans.InsertOnSubmit(mkb);
                db.SubmitChanges();
                Timkiemlabb();
                Response.Redirect(Request.Url.PathAndQuery.Replace("/", ""));
            }
        }

        protected void DataListLoimoikb_ItemCommand(object source, DataListCommandEventArgs e)
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
            Timkiemlmketban();
        }

        protected void DataListLabanbe_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Huyketban")
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                BanBe bb1 = db.BanBes.Single(p => p.id1 == (int)Session["ID"] && p.id2 == int.Parse(e.CommandArgument.ToString()));
                db.BanBes.DeleteOnSubmit(bb1);
                BanBe bb2 = db.BanBes.Single(q => q.id2 == (int)Session["ID"] && q.id1 == int.Parse(e.CommandArgument.ToString()));
                db.BanBes.DeleteOnSubmit(bb2);
                db.SubmitChanges();
                Timkiemlabb();
            }
        }

    } 
}