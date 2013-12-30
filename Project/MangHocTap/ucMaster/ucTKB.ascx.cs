using MangHocTap.Classes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.UC
{
    public partial class ucTKB : System.Web.UI.UserControl
    {
        DateTime now = DateTime.Now;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void GenerateTable()
        {
            //** CÁC HÀNG
            for (int i = 0; i < 3; i++)
            {
                // **HÀNG
                Response.Write("<tr>");

                //**CÁC CỘT NGÀY

                var dow = DayOfWeek.Monday; // Vì mặc định của enum dayofweek thì Chủ nhật xếp đầu tiên

                do
                {
                    List<List<SuKienThoiGianBieu>> sk = DayEvents(dow);
                    Response.Write("<td class=\"cell1\" align=\"center\" style=\"height: 30px; width: 14%;\">");

                    //**CÁC SỰ KIỆN TRONG NGÀY
                    foreach (var isk in sk[i])
                    {
                        const int tenSKLengthLimit = 5;

                        string linkSK = "/LichSuKien.aspx?day=" + isk.batdau.Date.ToShortDateString()+"&ev="+isk.ID;
                        string tgSK = string.Format("{0}-{1}", isk.batdau.ToString("HH:mm"), isk.ketthuc.ToString("HH:mm"));
                        string tenSK = isk.tensukien.Length > tenSKLengthLimit ? ShortenString(getBeginningLetters(isk.tensukien), tenSKLengthLimit) : isk.tensukien;
                        string tooltip = string.Format("onmouseover=\"Tip('Tên sự kiện: <b>{0}</b></br>Nội dung: <b>{1}</b></br>Thời gian: <b>{2}</b></br>Địa điểm: <b>{3}</b>')\" onmouseout=\"UnTip()\"", isk.tensukien, isk.noidung, tgSK, isk.diadiem);
                        string sukien = string.Format("<a style=\"display:block\" href=\"{0}\" {2}>{1}<br></a>", linkSK, tenSK, tooltip);

                        Response.Write(sukien);

                    }
                    //CÁC SỰ KIỆN TRONG NGÀY**
                    Response.Write("</td>");
                    dow++;
                    if (dow > DayOfWeek.Saturday) dow = 0;
                } while (dow != DayOfWeek.Monday);
                //CÁC CỘT NGÀY**
                Response.Write("</tr>");
                // HÀNG** 
            }
            // CÁC HÀNG**
        }

        string getBeginningLetters(string s)
        {
            string result = "";
            string[] words = s.Trim().Split(' ');
            foreach (var word in words)
                result += word.ToUpper()[0];

            return result;
        }
        string ShortenString(string s, int length)
        {
            if (s.Length > length)
            {
                s = s.Substring(0, length);
            }
            return s;
        }
        /// <summary>
        /// trả về các sự kiện trong ngày thứ dow của tuần có ngày now (now là biến toàn cục, mặc định là ngày hiện tại của hệ thống)
        /// Trong đó: 
        /// - DayEnvents[0]: các sự kiện buổi sáng
        /// - DayEnvents[1]: các sự kiện buổi chiều
        /// - DayEnvents[2]: các sự kiện buổi tối
        /// </summary>
        /// <param name="dow">ngày thứ mấy</param>
        /// <returns></returns>
        List<List<SuKienThoiGianBieu>> DayEvents(DayOfWeek dow)
        {

            //MangHocTapDBDataContext db = new MangHocTapDBDataContext();


            //var events = db.sukiencanhans.Where(p => p.batdau.Date >= DateTimeExtensions.GetStartDayOfThisWeek(now)
            //    && p.batdau.Date <= DateTimeExtensions.GetEndDayOfThisWeek(now)
            //    && p.batdau.DayOfWeek == dow).OrderBy(p => p.batdau);
            int svID = (int)Session["ID"];
            var events = SuKienTKB.GetDayOfWeekSchedule(now, svID, dow);


            List<List<SuKienThoiGianBieu>> data = new List<List<SuKienThoiGianBieu>>();
            List<SuKienThoiGianBieu> sang = new List<SuKienThoiGianBieu>();
            List<SuKienThoiGianBieu> chieu = new List<SuKienThoiGianBieu>();
            List<SuKienThoiGianBieu> toi = new List<SuKienThoiGianBieu>();
            for (int i = 0; i < events.Rows.Count; i++)
            {
                DataRow dr = events.Rows[i];
                SuKienThoiGianBieu item = new SuKienThoiGianBieu();
                item.tensukien = dr["tensukien"].ToString();
                item.noidung = dr["noidung"].ToString();
                item.batdau = (DateTime)dr["batdau"];
                item.ketthuc = (DateTime)dr["ketthuc"];
                item.diadiem = dr["diadiem"].ToString();
                item.ID = dr["ID"].ToString();

                //[0h-12h) Sáng
                //[12h-17h30) Chiều
                //[17h30 - 0h) Tối

                if (item.batdau.TimeOfDay >= TimeSpan.FromHours(17).Add(TimeSpan.FromMinutes(30)))
                {
                    toi.Add(item);
                    continue;
                }
                if (item.batdau.TimeOfDay >= TimeSpan.FromHours(12))
                {
                    chieu.Add(item);
                    if (item.ketthuc.TimeOfDay >= TimeSpan.FromHours(17).Add(TimeSpan.FromMinutes(30)))
                        toi.Add(item);

                    continue;
                }

                sang.Add(item);
                if (item.ketthuc.TimeOfDay >= TimeSpan.FromHours(12))
                {
                    chieu.Add(item);
                    if (item.ketthuc.TimeOfDay >= TimeSpan.FromHours(17).Add(TimeSpan.FromMinutes(30)))
                    {
                        toi.Add(item);
                    }
                }

            }

            data.Add(sang);
            data.Add(chieu);
            data.Add(toi);
            //var events = weekEvents.Where(p => p.batdau.DayOfWeek == dow);
            return data;
        }
    }
}