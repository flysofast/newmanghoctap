using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.ucMaster
{
    public partial class ucDSBanBe : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                var dtbanbe = from bb in db.BanBes
                              join sv in db.SinhViens on bb.id2 equals sv.id
                              where bb.id1 == (int)Session["ID"]
                              select sv;
                if (dtbanbe.Count() > 0)
                {
                    RepeaterBanbe.DataSource = dtbanbe;
                    RepeaterBanbe.DataBind();
                }
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

        public string getTrangthai(int trangthai)
        {
            if (trangthai == 1)
                return "~/ImagesAcc/icon-onlinefr.png";
            else
                return "~/ImagesAcc/icon-offline.png";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var dtbanbe = from bb in db.BanBes
                          join sv in db.SinhViens on bb.id2 equals sv.id
                          where bb.id1 == (int)Session["ID"]
                          select sv;
            if (dtbanbe.Count() > 0)
            {
                RepeaterBanbe.DataSource = dtbanbe;
                RepeaterBanbe.DataBind();
            }
        }
    }
}