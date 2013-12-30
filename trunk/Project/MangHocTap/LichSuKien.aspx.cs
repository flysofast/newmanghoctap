using MangHocTap.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public partial class LichSuKien : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        DateTime now = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string date = Request.QueryString["day"];
                if (!string.IsNullOrEmpty(date))
                {
                    now = DateTime.Parse(date);
                    dpcSchedule.Days = 1;
                    dpcSchedule.StartDate = now;
                    Calendar1.SelectedDate = now;
                    RadioButtonList1.SelectedValue = "1";
                }
                else
                {
                    RadioButtonList1.SelectedValue = "7";
                    dpcSchedule.Days = 7;
                    dpcSchedule.StartDate = DateTimeExtensions.GetStartDayOfThisWeek(now);
                }
                //Calendar1.SelectedDate = now;
                UpdateSchedule();
                string evID = Request.QueryString["ev"];//ID dạng SuKienThoiGianBieu skcn_45
                if (!string.IsNullOrEmpty(Request.QueryString["ev"]))
                {
                    string eventID = evID.Substring(5, evID.Length - 5);
                    if (evID.Substring(0, 5) == "skmh_")
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "UniqueKey", "if(confirm('Bạn có muốn chuyển đến trang thông tin môn học không?'))document.location='trangmonhoc.aspx?mm=" + eventID + "';", true);
                        return;
                    }
                    ShowEditEventPopup(eventID);
                }
            }
            else
            {
                //POSTBACK
                LoadViewStateVar();

            }
        }




        private bool isThereEvent(DateTime dateTime)
        {
            return db.sukiencanhans.Any(p => p.batdau.Date == dateTime.Date);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            now = Calendar1.SelectedDate;
            UpdateSchedule();
        }

        DateTime clickedScheDatetime;
        int editedEventID = -1;
        void SaveViewStateVar()
        {
            ViewState["editedEventID"] = editedEventID;
            ViewState["clickedScheDatetime"] = clickedScheDatetime;
        }
        void LoadViewStateVar()
        {
            try
            {
                editedEventID = (int)ViewState["editedEventID"];
                clickedScheDatetime = (DateTime)ViewState["clickedScheDatetime"];
            }
            catch { }
        }
        protected void dpcSchedule_TimeRangeSelected(object sender, DayPilot.Web.Ui.Events.TimeRangeSelectedEventArgs e)
        {
            editedEventID = -1; ;
            btXoa.Visible = false;
            clickedScheDatetime = e.Start;
            SaveViewStateVar();
            tbSH.Text = clickedScheDatetime.Hour.ToString();
            tbSM.Text = clickedScheDatetime.Minute.ToString();
            tbEH.Text = clickedScheDatetime.AddMinutes(30).Hour.ToString();
            tbEM.Text = clickedScheDatetime.AddMinutes(30).Minute.ToString();
            Popup();
        }

        protected void dpcSchedule_EventClick(object sender, DayPilot.Web.Ui.Events.EventClickEventArgs e)
        {

            string eventID = e.Value.Substring(5, e.Value.Length - 5);
            if (e.Value.Substring(0, 5) == "skmh_")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "UniqueKey", "if(confirm('Bạn có muốn chuyển đến trang thông tin môn học không?'))document.location='TrangMonHocGhiChep.aspx?mmh=" + eventID + "';", true);
                return;
            }
            ShowEditEventPopup(eventID);


        }

        void ShowEditEventPopup(string eventID)
        {

            btXoa.Visible = true;
            editedEventID = int.Parse(eventID);
            SaveViewStateVar();
            if (!db.sukiencanhans.Any(p => p.ID.ToString() == eventID))
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "NotFoundEvent", "alert('Không tìm thấy sự kiện này, vui lòng tải lại trang để cập nhật lại thời gian biểu!');", true);
                return;
            }
            var ev = db.sukiencanhans.Single(p => p.ID.ToString() == eventID);

            clickedScheDatetime = ev.batdau;


            tbSH.Text = ev.batdau.Hour.ToString();
            tbSM.Text = ev.batdau.Minute.ToString();
            tbEH.Text = ev.ketthuc.Hour.ToString();
            tbEM.Text = ev.ketthuc.Minute.ToString();
            tbDiadiem.Text = ev.diadiem;
            tbTenSK.Text = ev.tensukien;
            tbNoidung.Text = ev.noidung;
            Popup();
        }

        


        void ChangeViewMode()
        {
            if (RadioButtonList1.SelectedValue == "7")
                dpcSchedule.StartDate = DateTimeExtensions.GetStartDayOfThisWeek(now);
            else dpcSchedule.StartDate = now;
        }

        protected void btHuy_Click(object sender, EventArgs e)
        {
            Popup(false);
        }

        void Popup(bool show = true)
        {
            if (show)
            {
                pnlThemSuKien.Visible = true;
                pnlBackground.Visible = true;
                lbEventDatetime.Text = "Cập nhật sự kiện ngày " + clickedScheDatetime.ToShortDateString();
                lbError.Text = "";
                ShowXacNhan(false);
            }
            else
            {
                pnlThemSuKien.Visible = false;
                pnlBackground.Visible = false;
            }
        }



        protected void btOK_Click1(object sender, EventArgs e)
        {
            sukiencanhan sk;

            if (editedEventID != -1)
                sk = db.sukiencanhans.Single(p => p.ID == editedEventID);
            else
                sk = new sukiencanhan();


            DateTime startDate = clickedScheDatetime.Date;
            DateTime endDate = clickedScheDatetime.Date;
            try
            {
                sk.tensukien = tbTenSK.Text;
                sk.noidung = tbNoidung.Text;
                sk.batdau = startDate.AddHours(double.Parse(tbSH.Text)).AddMinutes(double.Parse(tbSM.Text));
                sk.ketthuc = endDate.AddHours(double.Parse(tbEH.Text)).AddMinutes(double.Parse(tbEM.Text));
                sk.SV_ID = (int)Session["ID"];
                if (sk.ketthuc < sk.batdau)
                {
                    lbError.Text = "Thời điểm kết thúc phải nằm sau thời điểm bắt đầu!";
                    return;
                }
                if (string.IsNullOrEmpty(tbTenSK.Text))
                {
                    lbError.Text = "Tên sự kiện không được bỏ trống!";
                    return;
                }
                //if (tbTenSK.Text.Length > 6 || string.IsNullOrEmpty(tbTenSK.Text))
                //{
                //    lbError.Text = "Tên sự kiện không được bỏ trống hoặc nhiều hơn 6 kí tự";
                //    return;
                //}
                if (tbNoidung.Text.Length > 200)
                {
                    lbError.Text = "Nội dung sự kiện không được nhiều hơn 200 kí tự";
                    return;
                }
                sk.diadiem = tbDiadiem.Text;
                sk.nguoithamgia = tbNguoiThamGia.Text;

                if (editedEventID == -1)
                    db.sukiencanhans.InsertOnSubmit(sk);

                db.SubmitChanges();
                //Response.Write("<script>alert('Đã thêm sựi kện mới!');");
                Popup(false);
                UpdateSchedule();

            }
            catch (Exception ex)
            {
                lbError.Text = "Vui lòng kiểm tra lại thông tin nhập!\r\n" + ex.Message;
            }

        }

        IEnumerable<sukiencanhan> GetWeekSchedule()
        {
            var events = db.sukiencanhans.Where(p => p.batdau.Date >= DateTimeExtensions.GetStartDayOfThisWeek(now)
               && p.batdau.Date <= DateTimeExtensions.GetEndDayOfThisWeek(now));
            return events;

        }
        void UpdateSchedule()
        {
            int svID = (int)Session["ID"];
            dpcSchedule.DataSource = SuKienTKB.GetWeekSchedule(now, svID);
            DataBind();
            ChangeViewMode();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            //string fontWeight = "normal";
            //if (isThereEvent(e.Day.Date))
            //    fontWeight = "bold";

            //string color = "black";
            //if (e.Day.IsOtherMonth)
            //    color = this.Calendar1.OtherMonthDayStyle.ForeColor.Name;

            //e.Cell.Text = String.Format("<span style=\"text-decoration:none;color:\"" + color + "\" font-weight:\""
            //    + fontWeight + "\"\">{1}</span>", e.Day.Date, e.Day.Date.Day);
        }

        protected void btXoa_Click(object sender, EventArgs e)
        {


            ShowXacNhan(true);
        }
        void ShowXacNhan(bool show)
        {
            if (show)
            {
                btXoaOK.Visible = true;
                btXoaCancel.Visible = true;
                lbXacNhan.Visible = true;
            }
            else
            {
                btXoaOK.Visible = false;
                btXoaCancel.Visible = false;
                lbXacNhan.Visible = false;
            }
        }

        protected void btXoaCancel_Click(object sender, EventArgs e)
        {
            ShowXacNhan(false);
        }

        protected void btXoaOK_Click(object sender, EventArgs e)
        {
            var sk = db.sukiencanhans.Single(p => p.ID == editedEventID);
            db.sukiencanhans.DeleteOnSubmit(sk);
            db.SubmitChanges();
            UpdateSchedule();
            Popup(false);
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            dpcSchedule.Days = int.Parse(RadioButtonList1.SelectedValue);

            ChangeViewMode();
        }





    }

}