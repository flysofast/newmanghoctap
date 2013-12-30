using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MangHocTap.Classes
{
    public class GroupPostReply:BinhLuanBaiVietNhom
    {
        public string avatar { set; get; }
        public string hoten { set; get; }

        public string ngaydangstring { set; get; }
        public GroupPostReply(BinhLuanBaiVietNhom bl)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();

            id = bl.id;
            noidung = bl.noidung;
            ngaydangstring = DateTimeExtensions.GetSmartDateString(bl.ngaydang, DateTime.Now);
            this.mabaiviet = bl.mabaiviet;
            this.mabinhluan = bl.mabinhluan;
            this.noidung = bl.noidung;

            SinhVien sv = db.SinhViens.Single(p => p.id == bl.id);
            hoten = sv.hoten;
            if (string.IsNullOrEmpty(sv.avatar))
            {
                if (sv.gioitinh == true)
                    avatar = "~/ImagesAcc/Avatar/default_avatar_boy.jpg";
                else
                    avatar = "~/ImagesAcc/Avatar/default_avatar_girl.png";
            }
            else
                avatar = "~/" + sv.avatar;
        }

        //public GroupPostReply()
        //{
        //    MangHocTapDBDataContext db = new MangHocTapDBDataContext();

           
        //    avatar = db.SinhViens.Single(p => p.id == this.id).avatar;
        //}
    }
}