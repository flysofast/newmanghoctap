using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MangHocTap.Classes
{
    public class GroupPost
    {
        public List<GroupPostReply> traloi { set; get; }
        public int mabaiviet { set; get; }
        public string noidunghoi { set; get; }
        public string avnguoihoi { set; get; }

        public string nguoihoi { set; get; }
        public string ngayhoistring { set; get; }

        public GroupPost(BaiVietNhom bv)
        {
            MangHocTapDBDataContext db = new MangHocTapDBDataContext();
            mabaiviet = bv.mabaiviet;
            noidunghoi = bv.noidung;
            SinhVien sv = db.SinhViens.Single(p => p.id == bv.ID);
            nguoihoi = sv.hoten;
            if (string.IsNullOrEmpty(sv.avatar))
            {
                if (sv.gioitinh == true)
                    avnguoihoi = "~/ImagesAcc/Avatar/default_avatar_boy.jpg";
                else
                    avnguoihoi = "~/ImagesAcc/Avatar/default_avatar_girl.png";
            }
            else
                avnguoihoi = "~/" + sv.avatar;

            ngayhoistring = DateTimeExtensions.GetSmartDateString(bv.ngaydang, DateTime.Now);
            var binhluan = db.BinhLuanBaiVietNhoms.Where(p => p.mabaiviet == bv.mabaiviet).OrderBy(p => p.ngaydang);
            traloi = new List<GroupPostReply>();

            foreach (var bl in binhluan)
            {
                var bl1 = new GroupPostReply(bl);
                if (bl1 != null)
                    traloi.Add(bl1);
            }
        }
    }
}