using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MangHocTap.Classes
{
    public class DateTimeExtensions
    {

        /// <summary>
        /// Trả về ngày thứ 2 của tuần được nhập vào
        /// </summary>
        /// <param name="dt">
        /// Ngày của tuần cần tìm
        /// <returns>Ngày đầu tiên của tuần đó</returns>
        public static DateTime GetStartDayOfThisWeek(DateTime dt)
        {
            int diff = dt.DayOfWeek - DayOfWeek.Monday;
            if (diff < 0)
            {
                diff += 7;
            }

            return dt.AddDays(-1 * diff).Date;
        }


        /// <summary>
        /// Trả về cuối tuần của tuần được nhập vào, thứ 2 là ngày đầu tuần
        /// </summary>
        /// <param name="dt">
        /// Ngày của tuần cần tìm
        /// <returns>Ngày cuối cùng của tuần đó</returns>
        public static DateTime GetEndDayOfThisWeek(DateTime dt)
        {
            return GetStartDayOfThisWeek(dt).Date.AddDays(6).Date;
        }

        public static DateTime GetDateOfThisWeek(DayOfWeek dow, DateTime now)
        {
            DateTime monday = GetStartDayOfThisWeek(now);

            if (dow != DayOfWeek.Sunday)
                return monday.AddDays((int)dow - 1);

            return monday.AddDays(6);
        }

        /// <summary>
        /// lấy ra chuỗi ngày giờ thông minh hơn: giờ trong ngày, giờ của ngày trong tuần
        /// </summary>
        /// <param name="date">ngày giờ cần lấy chuỗi</param>
        /// <param name="now">ngày giờ hiện tại làm chuẩn</param>
        /// <returns></returns>
        public static string GetSmartDateString(DateTime date, DateTime now)
        {
            if (date.Date == now.Date)
                return "Hôm nay, lúc " + date.ToShortTimeString();

            if (GetStartDayOfThisWeek(date) == GetStartDayOfThisWeek(now))
                return ConvertToDayofWeekString(date.DayOfWeek) + ", lúc " + date.ToShortTimeString();

            return date.ToLongDateString() + ", " + date.ToShortTimeString();
        }


        public static string ConvertToDayofWeekString(DayOfWeek s)
        {
            if (s == DayOfWeek.Monday)
                return "Thứ 2";
            if (s == DayOfWeek.Tuesday)
                return "Thứ 3";
            if (s == DayOfWeek.Wednesday)
                return "";
            if (s == DayOfWeek.Thursday)
                return "Thứ 5";
            if (s == DayOfWeek.Friday)
                return "Thứ 6";
            if (s == DayOfWeek.Saturday)
                return "Thứ 7";
            return "Chủ nhật";
        }
    }
}