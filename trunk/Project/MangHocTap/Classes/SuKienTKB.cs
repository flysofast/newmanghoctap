using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MangHocTap.Classes
{
    public class SuKienTKB
    {
        static DataTable dt;
        public SuKienTKB()
        {

            BuildTable();
        }

        public SuKienTKB(DayOfWeek d)
        {
            BuildTable();
        }

        static void BuildTable()
        {
            dt = new DataTable();
            dt.Columns.Add("ID", typeof(string));
            dt.Columns.Add("tensukien", typeof(string));
            dt.Columns.Add("noidung", typeof(string));
            dt.Columns.Add("batdau", typeof(DateTime));
            dt.Columns.Add("ketthuc", typeof(DateTime));
            dt.Columns.Add("diadiem", typeof(string));
        }

        //static MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        /// <summary>
        /// Lấy thời gian biểu sau khi đã tổng hợp của tuần đó
        /// </summary>
        /// <param name="now">ngày bất kì của tuần cần lấy</param>
        /// <param name="svID">mã sinh viên</param>
        /// <returns></returns>
        public static DataTable GetWeekSchedule(DateTime now, int svID)
        {
            BuildTable();
            AddSuKienCaNhan(now, svID);
            AddMonHoc(now, svID);
            return dt;
        }
        /// <summary>
        /// Chuyển data từ dạng datatable thành IEnumerable để dùng LINQ được
        /// </summary>
        /// <param name="dt">biến datatable</param>
        /// <returns>trả về collection đối tượng SuKienThoiGianBieu, dùng hạn chế hơn so với sukiencanhan,
        /// chưa biết cách dùng thẳng cho datasource</returns>


        public static IEnumerable<SuKienThoiGianBieu> Import(DataTable dt)
        {
            List<SuKienThoiGianBieu> events = new List<SuKienThoiGianBieu>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                SuKienThoiGianBieu item = new SuKienThoiGianBieu();
                item.ID = dr["ID"].ToString();
                item.tensukien = dr["tensukien"].ToString();
                item.noidung = dr["noidung"].ToString();
                item.batdau = (DateTime)dr["batdau"];
                item.ketthuc = (DateTime)dr["ketthuc"];
                item.diadiem = dr["diadiem"].ToString();
                events.Add(item);
            }
            return events;
        }
        /// <summary>
        /// Lấy thời gian biểu sau khi đã tổng hợp của ngày nào đó
        /// </summary>
        /// <param name="now">ngày bất kì của tuần cần lấy</param>
        /// <param name="svID">mã sinh viên</param>
        /// <returns></returns>
        public static DataTable GetDaySchedule(DateTime now, int svID)
        {
            BuildTable();
            AddSuKienCaNhan(now, svID, true);
            AddMonHoc(now, svID, true);
            return dt;
        }
        /// <summary>
        /// Lấy thời gian biểu sau khi đã tổng hợp của một ngày trong tuần
        /// </summary>
        /// <param name="now">ngày bất kì của tuần cần lấy</param>
        /// <param name="svID">mã sinh viên</param>
        /// <param name="dow">ngày thứ mấy</param>
        /// <returns></returns>
        public static DataTable GetDayOfWeekSchedule(DateTime now, int svID, DayOfWeek dow)
        {
            BuildTable();
            AddSuKienCaNhan(now, svID, dow);
            AddMonHoc(now, svID, dow);
            return dt;
        }



        static void AddSuKienCaNhan(DateTime now, int svID, bool oneday = false)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var events = db.sukiencanhans.Where(p => p.SV_ID == svID && p.batdau.Date >= DateTimeExtensions.GetStartDayOfThisWeek(now)
              && p.batdau.Date <= DateTimeExtensions.GetEndDayOfThisWeek(now)).OrderBy(p => p.batdau);
            if (oneday) events = events.Where(p => p.batdau.Date == now.Date).OrderBy(p => p.batdau);

            foreach (var e in events)
            {
                DataRow dr = dt.NewRow();
                dr["ID"] = "skcn_" + e.ID.ToString();
                dr["tensukien"] = e.tensukien;
                dr["noidung"] = e.noidung;
                dr["batdau"] = e.batdau;
                dr["ketthuc"] = e.ketthuc;
                dr["diadiem"] = e.diadiem;
                dt.Rows.Add(dr);
            }
        }

        static void AddSuKienCaNhan(DateTime now, int svID, DayOfWeek dow)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var events = db.sukiencanhans.Where(p => p.SV_ID == svID && p.batdau.Date >= DateTimeExtensions.GetStartDayOfThisWeek(now)
              && p.batdau.Date <= DateTimeExtensions.GetEndDayOfThisWeek(now) && p.batdau.DayOfWeek == dow).OrderBy(p => p.batdau);


            foreach (var e in events)
            {
                DataRow dr = dt.NewRow();
                dr["ID"] = "skcn_" + e.ID.ToString();
                dr["tensukien"] = e.tensukien;
                dr["noidung"] = e.noidung;
                dr["batdau"] = e.batdau;
                dr["ketthuc"] = e.ketthuc;
                dr["diadiem"] = e.diadiem;
                dt.Rows.Add(dr);
            }
        }

        /// <summary>
        /// Lấy lịch học của tất cả các môn học còn trong thời gian học trong tuần này từ dữ liệu CSDL
        /// </summary>
        /// <param name="now"></param>
        /// <param name="svID"></param>
        /// <returns></returns>
        static List<SuKienThoiGianBieu> getWeekSubjectSchedule(DateTime now, int svID)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            var allSubjects = from ms in db.MonSinhs
                              join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                              where ms.id == svID && ms.thoikhoabieu != ""
                              select new
                              {
                                  mh.mamonhoc,
                                  mh.tenmonhoc,
                                  ms.thoikhoabieu,//Ngày học, phòng học, giờ học

                                  ms.ketthuc,//Đang học hay không
                                  ms.batdau,//
                              };

            //Chuyển thành danh sách sự kiện
            List<SuKienThoiGianBieu> lst = new List<SuKienThoiGianBieu>();
            foreach (var s in allSubjects)
            {
                string[] ngayhoc = s.thoikhoabieu.Split(';');
                foreach (var nh in ngayhoc)
                {
                    if (string.IsNullOrEmpty(nh)) continue;
                    var sk = new SuKienThoiGianBieu();
                    sk.ID = s.mamonhoc;
                    sk.tensukien = s.tenmonhoc;
                    sk.diadiem = nh.Substring(nh.IndexOf(',') + 1).Trim();
                    sk.SV_ID = svID;
                    string timerange = nh.Substring(nh.IndexOf('[') + 1, nh.IndexOf(']') - nh.IndexOf('[') - 1).Trim();

                    string[] start_end = timerange.Split('-');

                    TimeSpan time = getTime(start_end[0], true);
                    sk.batdau = DateTimeExtensions.GetDateOfThisWeek(getDayofWeek(nh.Substring(0, nh.IndexOf('['))), now).Date.AddHours(time.Hours).AddMinutes(time.Minutes);

                    time = getTime(start_end[1], false);
                    sk.ketthuc = DateTimeExtensions.GetDateOfThisWeek(getDayofWeek(nh.Substring(0, nh.IndexOf('['))), now).Date.AddHours(time.Hours).AddMinutes(time.Minutes);

                    if (sk.batdau.Date >= s.batdau.Date && sk.batdau.Date <= s.ketthuc.Date)//Đang học
                        lst.Add(sk);
                }

            }
            return lst;
        }

        static void AddMonHoc(DateTime now, int svID, bool oneday = false)
        {
            var events = getWeekSubjectSchedule(now, svID).OrderBy(p => p.batdau);
            if (oneday) events = events.Where(p => p.batdau.Date == now.Date).OrderBy(p => p.batdau);

            foreach (var e in events)
            {
                DataRow dr = dt.NewRow();
                dr["ID"] = "skmh_" + e.ID.ToString();
                dr["tensukien"] = e.tensukien;
                dr["noidung"] = e.noidung;
                dr["batdau"] = e.batdau;
                dr["ketthuc"] = e.ketthuc;
                dr["diadiem"] = e.diadiem;
                dt.Rows.Add(dr);
            }
        }

        static void AddMonHoc(DateTime now, int svID, DayOfWeek dow)
        {
            var events = getWeekSubjectSchedule(now, svID).Where(p => p.batdau.DayOfWeek == dow).OrderBy(p => p.batdau);


            foreach (var e in events)
            {
                DataRow dr = dt.NewRow();
                dr["ID"] = "skmh_" + e.ID.ToString();
                dr["tensukien"] = e.tensukien;
                dr["noidung"] = e.noidung;
                dr["batdau"] = e.batdau;
                dr["ketthuc"] = e.ketthuc;
                dr["diadiem"] = e.diadiem;
                dt.Rows.Add(dr);
            }
        }

        /// <summary>
        /// Trả về ngày thứ mấy
        /// </summary>
        /// <param name="s">chuỗi ngày thứ mấy, vd: "Thứ 2"</param>
        /// <returns></returns>
        static DayOfWeek getDayofWeek(string s)
        {
            if (s.Trim().ToUpper() == "THỨ 2")
                return DayOfWeek.Monday;
            if (s.Trim().ToUpper() == "THỨ 3")
                return DayOfWeek.Tuesday;
            if (s.Trim().ToUpper() == "THỨ 4")
                return DayOfWeek.Wednesday;
            if (s.Trim().ToUpper() == "THỨ 5")
                return DayOfWeek.Thursday;
            if (s.Trim().ToUpper() == "THỨ 6")
                return DayOfWeek.Friday;
            if (s.Trim().ToUpper() == "THỨ 7")
                return DayOfWeek.Saturday;

            return DayOfWeek.Sunday;
        }

        /// <summary>
        /// Trả về giờ học hoặc giờ ra về
        /// </summary>
        /// <param name="s">số tiết</param>
        /// <param name="startTime">có phải là giờ vào học hay không</param>
        /// <returns>giờ trong ngày</returns>
        static TimeSpan getTime(string s, bool startTime)
        {
            int tiet = int.Parse(s.Trim());
            if (startTime)//Giờ vào học
            {
                if (tiet <= 4) return new TimeSpan(tiet + 6, 0, 0);
                if (tiet <= 8) return new TimeSpan(tiet + 8, 0, 0);
                return new TimeSpan(tiet + 8, 30, 0);

            }
            else//Giờ ra về
            {
                if (tiet <= 4) return new TimeSpan(tiet + 6, 50, 0);
                if (tiet <= 8) return new TimeSpan(tiet + 8, 50, 0);
                return new TimeSpan(tiet + 8, 30 + 50, 0);
            }
        }
    }
}