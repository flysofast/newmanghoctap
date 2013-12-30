using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class PageBanbecuatoi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Getdsbanbe();
        }

        public void Getdsbanbe()
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtbb = from bb in db.BanBes
                       join sv in db.SinhViens on bb.id2 equals sv.id
                       join tr in db.Truongs on sv.matruong equals tr.matruong
                       join kh in db.Khoas on sv.makhoa equals kh.makhoa
                       join ng in db.Nganhs on sv.manganh equals ng.manganh
                       join lop in db.Lops on sv.malop equals lop.malop
                       where bb.id1 == (int)Session["ID"]
                       select new { sv.id, sv.avatar, sv.gioitinh, sv.hoten, tr.tentruong, kh.tenkhoa, ng.tennganh, lop.tenlop };
            if (dtbb.Count() > 0)
            {
                lblSobanbecuaban.Text = "Bạn có (" + dtbb.Count().ToString() + ") người bạn trong danh sách.";
                DataListBanbecuatoi.DataSource = dtbb;
                DataListBanbecuatoi.DataBind();
            }
            else
            {
                lblThongbaokhongcoban.Visible = true;
                lblThongbaokhongcoban.Text = "Bạn chưa có người bạn nào trong danh sách, hãy tìm kiếm bạn bè ngay !!!";
                lblSobanbecuaban.Text = "Hiện tại không có bạn bè nào.";
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

        protected void DataListBanbecuatoi_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Huyketban")
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                BanBe bb1 = db.BanBes.Single(p => p.id1 == (int)Session["ID"] && p.id2 == int.Parse(e.CommandArgument.ToString()));
                db.BanBes.DeleteOnSubmit(bb1);
                BanBe bb2 = db.BanBes.Single(q => q.id2 == (int)Session["ID"] && q.id1 == int.Parse(e.CommandArgument.ToString()));
                db.BanBes.DeleteOnSubmit(bb2);
                db.SubmitChanges();
                Getdsbanbe();
            }
        }
    }
}