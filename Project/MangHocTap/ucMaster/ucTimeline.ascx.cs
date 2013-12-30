using MangHocTap.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.UC
{
    public partial class ucTimeline : System.Web.UI.UserControl
    {
        IEnumerable<SuKienThoiGianBieu> tgb;
        protected void Page_Load(object sender, EventArgs e)
        {
            tgb = SuKienTKB.Import(SuKienTKB.GetDaySchedule(DateTime.Now, (int)Session["ID"]));
        }


        public void BuildTimelineEvents()
        {



            foreach (var item in tgb)
            {
                //string percent = "13.7";
                string tooltip = string.Format("<b>{0}</b></br>Nội dung: <b>{1}</b></br>Thời gian: <b>{2} - {3}</b></br>Địa điểm: <b>{4}</b>"
                    , item.tensukien, item.noidung, item.batdau.TimeOfDay.ToString(@"hh\:mm"), item.ketthuc.TimeOfDay.ToString(@"hh\:mm"), item.diadiem);
                string eventHTML = string.Format("<div class=\"event tooltip\" id=\"{0}\" style=\"left: {1}%\" title=\"{2}\"  id=\"{3}\">&nbsp;</div>"
                    , item.ID.Trim(), postionPercent(item.batdau.TimeOfDay, 0.86), tooltip, item.ID);
                Response.Write(eventHTML);
                Response.Write(string.Format("<div id=\"{2}\" class=\"timerange\" style=\"left:{0}%;width:{1}%\"></div>", postionPercent(item.batdau.TimeOfDay)
                    , postionPercent(item.ketthuc - item.batdau)
                    , item.ID.Trim() + "_tr"));
            }
            string title = string.Format("<b>Hiện tại:  </b><span style='color:yellow;font-weight:800'>{0}</span>", DateTime.Now.TimeOfDay.ToString(@"hh\:mm"));
            string nowPos = string.Format("<div class=\"now tooltip\" title=\"{0}\" style=\"left:{1}%\"></div>", title, postionPercent(DateTime.Now.TimeOfDay, 0.6));
            Response.Write(nowPos);
        }

        /// <summary>
        /// trả về chuỗi số giá trị % với 4 chữ số thập phân của timeline.
        /// Tổng số phút của timeline 100% ~ 25*60=1500
        /// </summary>
        /// <param name="time">thời gian timeofday</param>
        /// <param name="subPercent">trừ đi một số % (đối với cục tròn event)</param>
        /// <returns></returns>
        string postionPercent(TimeSpan time, double subPercent = 0)
        {

            return (((time.TotalMinutes / 1500) * 100) - subPercent).ToString("0.0000", CultureInfo.InvariantCulture);

        }
        public void InsertToDay()
        {
            Response.Write(DateTime.Now.Date.ToShortDateString());
        }

        public void InsertTomorrow()
        {
            Response.Write(DateTime.Now.Date.AddDays(1).ToShortDateString());
        }


        

        protected void timer_Tick(object sender, EventArgs e)
        {
            try
            {
                var clstEv = tgb.Where(p => p.batdau > DateTime.Now).OrderBy(p => p.batdau).Last();
                var pTime = (int)((clstEv.batdau - DateTime.Now).TotalMinutes);

                if (pTime > 30) return;
                timer.Interval = 300000;
                string color = "orange";
                if (pTime <= 15)
                {
                    color = "red";
                    timer.Interval = 120000;
                }
                Page.ShowSuccessfulNotification(string.Format("Sự kiện \"{0}\" sẽ xảy ra trong vòng <span style=\"color:{1}\">{2}</span> phút nữa", clstEv.tensukien, color, pTime), 1700);
            }
            catch { }
        }
    }
}
