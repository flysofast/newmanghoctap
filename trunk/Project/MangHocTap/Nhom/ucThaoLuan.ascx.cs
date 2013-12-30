using MangHocTap.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.Nhom.NhomChung.Truong.uc
{
    public partial class ucThaoLuan : System.Web.UI.UserControl
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        int svID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            svID = (int)Session["ID"];


            if (!IsPostBack)
            {
                SinhVien sv = db.SinhViens.Single(p => p.id == svID);

                string path = Request.Path.Trim().ToUpper();

                switch (path)
                {
                    case "/NHOM/NHOMCHUNG/TRUONG/DEFAULT.ASPX": lbMaNhom.Text = sv.matruong; lbLoaiNhom.Text = "truong"; break;
                    case "/NHOM/NHOMCHUNG/KHOA/DEFAULT.ASPX": lbMaNhom.Text =  sv.makhoa; lbLoaiNhom.Text = "khoa"; break;
                    case "/NHOM/NHOMCHUNG/KHOAHOC/DEFAULT.ASPX": lbMaNhom.Text = sv.matruong + sv.nienkhoa; lbLoaiNhom.Text = "khoahoc"; break;
                    case "/NHOM/NHOMCHUNG/LOP/DEFAULT.ASPX": lbMaNhom.Text = sv.malop; lbLoaiNhom.Text = "lop"; break;
                }
                UpdatePostsContent();
            }


        }

        protected void lbtReply_Click(object sender, EventArgs e)
        {

            //LinkButton bt = (LinkButton)sender;
            //tbText.Text = bt.CommandArgument;
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            TextBox tbComment = (TextBox)item.FindControl("tbComment");
            int mabv = int.Parse(btn.CommandArgument);

            BinhLuanBaiVietNhom bl = new BinhLuanBaiVietNhom();
            bl.mabaiviet = mabv;
            bl.noidung = tbComment.Text;
            bl.ngaydang = DateTime.Now;
            bl.id = svID;
            db.BinhLuanBaiVietNhoms.InsertOnSubmit(bl);
            db.SubmitChanges();
            AddThongBaoBinhLuan(mabv);
            UpdatePostsContent();
        }

        void UpdatePostsContent()
        {
            List<GroupPost> lst = new List<GroupPost>();
            foreach (var baiviet in db.BaiVietNhoms.Where(p => p.manhom.Trim() == lbMaNhom.Text.Trim()).OrderByDescending(p => p.ngaydang))
            {
                if (baiviet == null) continue;
                GroupPost bv = new GroupPost(baiviet);
                lst.Add(bv);
            }

            dlQuestionPosts.DataSource = lst;
            dlQuestionPosts.DataBind();
        }

        protected void btNewPost_Click(object sender, EventArgs e)
        {
            pnlNewPost1.Visible = true;
        }

        protected void btCancel_Click(object sender, EventArgs e)
        {
            pnlNewPost1.Visible = false;
        }

        protected void btPostOK_Click(object sender, EventArgs e)
        {
            if (!db.SinhViens.Any(pnlNewPost => pnlNewPost.id == svID)) return;
            BaiVietNhom bv = new BaiVietNhom();
            bv.ID = svID;
            bv.manhom = lbMaNhom.Text;
            bv.noidung = CKEditorControl1.Text;
            bv.ngaydang = DateTime.Now;

            if (RadioButtonList1.SelectedValue == "tb")
            {
                bv.lathongbao = true;
            }
            db.BaiVietNhoms.InsertOnSubmit(bv);
            db.SubmitChanges();
            if (RadioButtonList1.SelectedValue == "tb")
                AddThongBaoNhom(db.BaiVietNhoms.Max(p => p.mabaiviet));
            UpdatePostsContent();
            pnlNewPost1.Visible = false;
        }

        void AddThongBaoNhom(int maBV)
        {
            IQueryable<SinhVien> svList;

            string tennhom;
            switch (lbLoaiNhom.Text)
            {

                case "khoa": svList = db.SinhViens.Where(p => p.makhoa.Trim() == lbMaNhom.Text.Trim());
                    tennhom = db.Khoas.Single(p => p.makhoa.Trim() == lbMaNhom.Text.Trim()).tenkhoa;
                    break;
                case "khoahoc": svList = db.SinhViens.Where(p => p.nienkhoa.Trim() == lbMaNhom.Text.Trim() && p.matruong.Trim() == db.SinhViens.Single(q => q.id == svID).matruong.Trim());
                    tennhom = "Khóa K" + lbMaNhom.Text.Substring(0, 2);
                    break;
                case "lop": svList = db.SinhViens.Where(p => p.malop.Trim() == lbMaNhom.Text.Trim());
                    tennhom = db.Lops.Single(p => p.malop.Trim() == lbMaNhom.Text.Trim()).tenlop.Trim();
                    break;

                //nhóm trường
                default: svList = db.SinhViens.Where(p => p.matruong.Trim() == lbMaNhom.Text.Trim());
                    tennhom = db.Truongs.Single(p => p.matruong.Trim() == lbMaNhom.Text.Trim()).tentruong.Trim();
                    break;
            }

            foreach (var sv in svList)
            {
                if (sv != null)
                {
                    ThongBaoBinhLuan tb = new ThongBaoBinhLuan();
                    tb.ID = sv.id;
                    tb.Link = "#";
                    tb.loai = 1;
                    tb.mabaiviet = maBV;
                    tb.NoiDung = "Bạn có một thông báo mới từ nhóm " + tennhom;
                    db.ThongBaoBinhLuans.InsertOnSubmit(tb);
                }
            }
            db.SubmitChanges();
        }
        void AddThongBaoBinhLuan(int maBV)
        {
            int IDPoster = db.BaiVietNhoms.Single(p => p.mabaiviet == maBV).ID;
            string commenters = "";
            var commentersIDList = db.BinhLuanBaiVietNhoms.Where(p => p.mabaiviet == maBV).OrderByDescending(p => p.ngaydang).Select(p => p.id).Distinct();
            foreach (var commenterID in commentersIDList)
            {
                if (string.IsNullOrEmpty(commenters))
                    commenters += db.SinhViens.Single(p => p.id == commenterID).hoten;
                else
                    commenters += ", " + db.SinhViens.Single(p => p.id == commenterID).hoten;
            }

            ThongBaoBinhLuan tb;
            if (db.ThongBaoBinhLuans.Any(p => p.loai == 1 && p.mabaiviet == maBV))
            {
                tb = db.ThongBaoBinhLuans.Single(p => p.loai == 1 && p.mabaiviet == maBV);
                tb.NoiDung = commenters + " đã bình luận vào bài viết của bạn";
            }
            else
            {
                tb = new ThongBaoBinhLuan();
                tb.ID = IDPoster;
                tb.Link = Request.Path;
                tb.loai = 1;
                tb.mabaiviet = maBV;
                tb.NoiDung = commenters + " đã bình luận vào bài viết của bạn";
                db.ThongBaoBinhLuans.InsertOnSubmit(tb);
            }

            db.SubmitChanges();

        }


    }
}