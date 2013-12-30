using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap.UC_Master
{
    public partial class DanhSachHocKy : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Taodanhsachhocky()
        {
            try
            {
                MangHocTapDBDataContext db = new MangHocTapDBDataContext();
                var q = from sv in db.SinhViens
                        join n in db.Nganhs on sv.manganh equals n.manganh
                        where sv.id == (int)Session["ID"]
                        select n.sonamdaotao;
                int k = 0;

                for (int i = 1; i <= int.Parse(q.FirstOrDefault().ToString()); i++)
                {
                    Response.Write("<div class='namhoc' > Năm " + i + ":</div>");
                    Response.Write("<div class='hocky'>");
                    //Response.Write("<ul>");
                    for (int j = 1; j <= 2; j++)
                    {
                        k++;
                        Response.Write("<li class='hockys'><a href='/TrangHocKy.aspx?hk=" + k.ToString() + "'> Học kỳ " + k + "</a>");
                        var r = from ms in db.MonSinhs
                                join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                where ms.id == (int)Session["ID"] && ms.hocky == k
                                select mh;
                        if (r.FirstOrDefault() != null)
                        {
                            Response.Write("<ul class='monhoc'>");
                            foreach (MonHoc mhs in r)
                            {
                                string s = mhs.tenmonhoc.Length > 20 ? mhs.tenmonhoc.Substring(0, 20) + "..." : mhs.tenmonhoc;
                                Response.Write("<li class='monhocs'><a href='/TrangMonHocGhiChep.aspx?mmh=" + mhs.mamonhoc + "'>" + s + "</a><ul class='luachon'>");
                                Response.Write("<li class='luachons'><a href='/TrangMonHocGhiChep.aspx?mmh=" + mhs.mamonhoc + "'>Sổ tay môn học</a></li>");
                                Response.Write("<li class='luachons'><a href='/TrangMonHocChinhSua.aspx?mmh=" + mhs.mamonhoc + "'>Thông tin môn học</a></li>");
                                Response.Write("<li class='luachons'><a href='/TrangMonHocBaiViet.aspx?mmh=" + mhs.mamonhoc + "'>Học tập - Chia sẻ</a></li>");
                                Response.Write("</ul></li>");
                            }
                            Response.Write("</ul>");
                        }
                        Response.Write("</li>");
                    }

                    //Response.Write("</ul>");
                    Response.Write("</div>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}