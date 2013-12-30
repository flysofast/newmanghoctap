using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Configuration;


namespace MangHocTap
{
    public partial class TrangThongKeDiem : System.Web.UI.Page
    {
        MangHocTapDBDataContext db = new MangHocTapDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            if (!IsPostBack)
            {
                pnhoixoa.Visible = false;
                var q = from sv in db.SinhViens
                        join n in db.Nganhs on sv.manganh equals n.manganh
                        where sv.id == (int)Session["ID"]
                        select n.sonamdaotao;
                for (int i = 1; i <= q.FirstOrDefault().Value * 2; i++)
                    dlcachtk.Items.Insert(0, new ListItem("Học kỳ " + i.ToString()));
                for (int i = 1; i <= q.FirstOrDefault().Value; i++)
                    dlcachtk.Items.Insert(0, new ListItem("Năm " + i.ToString()));
                dlcachtk.Items.Insert(0, new ListItem("Toàn bộ"));
                dlcachtk.SelectedIndex = 0;
                int nk = int.Parse((from sv in db.SinhViens
                                    where sv.id == (int)Session["ID"]
                                    select sv.nienkhoa).FirstOrDefault().Substring(2, 4));

                var r = (nk <= 2012) ? (from ms in db.MonSinhs
                                        join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                        where ms.id == (int)Session["ID"]
                                        let dt = (double)ms.diemthi
                                        let dqt = (double)ms.diemquatrinh
                                        let hs = (double)ms.heso
                                        let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                        let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                        let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                        select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 }) :
                       (from ms in db.MonSinhs
                        join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                        where ms.id == (int)Session["ID"]
                        let dt = (double)ms.diemthi
                        let dqt = (double)ms.diemquatrinh
                        let hs = (double)ms.heso
                        let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                        let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                        let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                        d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                        select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 });
                GridView1.DataSource = r;
                GridView1.DataBind();
                if (r.FirstOrDefault() != null)
                {
                    float td10 = 0, td4 = 0;
                    int dtd = 0;
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        dtd += int.Parse(((Label)GridView1.Rows[i].Cells[2].FindControl("Label3")).Text);
                        td10 += float.Parse(((Label)GridView1.Rows[i].Cells[5].FindControl("Label4")).Text) * int.Parse(((Label)GridView1.Rows[i].Cells[2].FindControl("Label3")).Text);
                        td4 += float.Parse(((Label)GridView1.Rows[i].Cells[6].FindControl("Label5")).Text) * int.Parse(((Label)GridView1.Rows[i].Cells[2].FindControl("Label3")).Text);
                    }
                    lbh10.Text = Math.Round(td10 / dtd, 2).ToString();
                    lbh4.Text = Math.Round(td4 / dtd, 2).ToString();
                    double td4kq = Math.Round(td4 / dtd, 2);
                    lbxl.Text = td4kq >= 3.6 ? "Xuất sắc" : td4kq >= 3.2 ? "Giỏi" : td4kq >= 2.5 ? "Khá" : td4kq >= 2.0 ? "Trung bình" : "Không đạt";
                }
                else
                {
                    lbh10.Text = "--";
                    lbh4.Text = "--";
                    lbxl.Text = "--";
                }
            }
        }
        public void TinhKetQua()
        {
            float td10 = 0, td4 = 0;
            int dtd = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                dtd += int.Parse(((Label)GridView1.Rows[i].Cells[2].FindControl("Label3")).Text);
                td10 += float.Parse(((Label)GridView1.Rows[i].Cells[5].FindControl("Label4")).Text) * int.Parse(((Label)GridView1.Rows[i].Cells[2].FindControl("Label3")).Text);
                td4 += float.Parse(((Label)GridView1.Rows[i].Cells[6].FindControl("Label5")).Text) * int.Parse(((Label)GridView1.Rows[i].Cells[2].FindControl("Label3")).Text);
            }
            lbh10.Text = Math.Round(td10 / dtd, 2).ToString();
            lbh4.Text = Math.Round(td4 / dtd, 2).ToString();
            double td4kq = Math.Round(td4 / dtd, 2);
            lbxl.Text = td4kq >= 3.6 ? "Xuất sắc" : td4kq >= 3.2 ? "Giỏi" : td4kq >= 2.5 ? "Khá" : td4kq >= 2.0 ? "Trung bình" : "Không đạt";
        }
        public void TinhDiem()
        {
            int nk = int.Parse((from sv in db.SinhViens
                                where sv.id == (int)Session["ID"]
                                select sv.nienkhoa).FirstOrDefault().Substring(2, 4));

            var r = (nk <= 2012) ? (from ms in db.MonSinhs
                                    join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                    where ms.id == (int)Session["ID"]
                                    let dt = (double)ms.diemthi
                                    let dqt = (double)ms.diemquatrinh
                                    let hs = (double)ms.heso
                                    let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                    let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                    let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                    select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 }) :
                   (from ms in db.MonSinhs
                    join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                    where ms.id == (int)Session["ID"]
                    let dt = (double)ms.diemthi
                    let dqt = (double)ms.diemquatrinh
                    let hs = (double)ms.heso
                    let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                    let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                    let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                    d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                    select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 });
            GridView1.DataSource = r;
            GridView1.DataBind();
            if (r.FirstOrDefault() != null)
                TinhKetQua();
            else
            {
                lbh10.Text = "--";
                lbh4.Text = "--";
                lbxl.Text = "--";
            }
            
        }
        public void TinhDiem(int hk1, int hk2)
        {
            int nk = int.Parse((from sv in db.SinhViens
                                where sv.id == (int)Session["ID"]
                                select sv.nienkhoa).FirstOrDefault().Substring(2, 4));

            var r = (nk <= 2012) ? (from ms in db.MonSinhs
                                    join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                    where ms.id == (int)Session["ID"] && (ms.hocky == hk1 || ms.hocky == hk2)
                                    let dt = (double)ms.diemthi
                                    let dqt = (double)ms.diemquatrinh
                                    let hs = (double)ms.heso
                                    let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                    let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                    let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                    select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 }) :
                   (from ms in db.MonSinhs
                    join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                    where ms.id == (int)Session["ID"] && (ms.hocky == hk1 || ms.hocky == hk2)
                    let dt = (double)ms.diemthi
                    let dqt = (double)ms.diemquatrinh
                    let hs = (double)ms.heso
                    let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                    let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                    let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                    d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                    select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 });
            GridView1.DataSource = r;
            GridView1.DataBind();
            if (r.FirstOrDefault() != null)
                TinhKetQua();
            else
            {
                lbh10.Text = "--";
                lbh4.Text = "--";
                lbxl.Text = "--";
            }
        }
        public void TinhDiem(int hk)
        {
            int nk = int.Parse((from sv in db.SinhViens
                                where sv.id == (int)Session["ID"]
                                select sv.nienkhoa).FirstOrDefault().Substring(2, 4));

            var r = (nk <= 2012) ? (from ms in db.MonSinhs
                                    join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                                    where ms.id == (int)Session["ID"] && ms.hocky == hk
                                    let dt = (double)ms.diemthi
                                    let dqt = (double)ms.diemquatrinh
                                    let hs = (double)ms.heso
                                    let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                                    let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                                    let d4 = d10 >= 8.5 ? 4.0 : d10 >= 7.0 ? 3.0 : d10 >= 5.5 ? 2.0 : d10 >= 4.0 ? 1.0 : 0
                                    select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 }) :
                   (from ms in db.MonSinhs
                    join mh in db.MonHocs on ms.mamonhoc equals mh.mamonhoc
                    where ms.id == (int)Session["ID"] && ms.hocky == hk
                    let dt = (double)ms.diemthi
                    let dqt = (double)ms.diemquatrinh
                    let hs = (double)ms.heso
                    let d1 = Math.Round((dt * hs / 100 + dqt * (100 - hs) / 100) / 1000, 4, MidpointRounding.AwayFromZero) * 1000
                    let d10 = Math.Round(d1, 1, MidpointRounding.AwayFromZero)
                    let d4 = d10 >= 9.5 ? 4.0 : d10 >= 8.5 ? 3.8 : d10 >= 8.0 ? 3.5 :
                    d10 >= 7.0 ? 3.0 : d10 >= 6.5 ? 2.5 : d10 >= 5.5 ? 2.0 : d10 >= 5.0 ? 1.5 : d10 >= 4.0 ? 1.0 : 0
                    select new { ms.mamonhoc, mh.tenmonhoc, ms.stc, ms.diemquatrinh, ms.diemthi, d4, d10 });
            GridView1.DataSource = r;
            GridView1.DataBind();
            if (r.FirstOrDefault() != null)
                TinhKetQua();
            else
            {
                lbh10.Text = "--";
                lbh4.Text = "--";
                lbxl.Text = "--";
            }
        }
        protected void imgbtnclose2_Click(object sender, ImageClickEventArgs e)
        {
            pnmsbox.Visible = false;
        }

        protected void lbtnnhapexcel_Click(object sender, EventArgs e)
        {
            pnmsbox.Visible = true;
        }

        protected void dlcachtk_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dlcachtk.SelectedValue == "Toàn bộ")
                TinhDiem();
            else
                if (dlcachtk.SelectedValue.Contains("Năm"))
                {
                    TinhDiem(int.Parse(dlcachtk.SelectedValue.Substring(dlcachtk.SelectedValue.Length - 1, 1)) * 2 - 1,
                        int.Parse(dlcachtk.SelectedValue.Substring(dlcachtk.SelectedValue.Length - 1, 1)) * 2);
                }
                else
                    TinhDiem(int.Parse(dlcachtk.SelectedValue.Substring(dlcachtk.SelectedValue.Length - 1, 1)));
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            pnmsbox.Visible = false;
        }

        protected void btnOK2_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

                string FilePath = Server.MapPath(FolderPath + FileName);
                FileUpload1.SaveAs(FilePath);
                Import_To_Grid(FilePath, Extension, "YES");
                File.Delete(FilePath);
                pnmsbox.Visible = false;
            }      
        }
        private void Import_To_Grid(string FilePath, string Extension, string isHDR)
        {
            string conStr = "";
            switch (Extension)
            {
                case ".xls": //Excel 97-03
                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                             .ConnectionString;
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    break;
            }
            conStr = String.Format(conStr, FilePath, isHDR);
            OleDbConnection connExcel = new OleDbConnection(conStr);
            OleDbCommand cmdExcel = new OleDbCommand();
            OleDbDataAdapter oda = new OleDbDataAdapter();
            DataTable dt = new DataTable();
            cmdExcel.Connection = connExcel;

            //Get the name of First Sheet
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
            connExcel.Close();

            //Read Data from First Sheet
            connExcel.Open();
            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
            oda.SelectCommand = cmdExcel;
            oda.Fill(dt);
            connExcel.Close();

            //Bind Data to GridView
            GridView2.Caption = Path.GetFileName(FilePath);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            GhiDuLieu();
        }
        public void GhiDuLieu()
        {
            try
            {
                int hocky = 0;
                int kt = 0;
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    if (Server.HtmlDecode(GridView2.Rows[i].Cells[0].Text).Contains("Năm học"))
                    {
                        hocky++;
                        kt = 1;
                        continue;
                    }
                    if (kt == 1)
                    {
                        MonSinh ms = new MonSinh();
                        ms.hocky = hocky;
                        ms.id = (int)Session["ID"];
                        ms.mamonhoc = GridView2.Rows[i].Cells[0].Text;
                        ms.stc = int.Parse(GridView2.Rows[i].Cells[2].Text);
                        try
                        {
                            ms.diemquatrinh = Math.Round(double.Parse(GridView2.Rows[i].Cells[5].Text.Trim(),System.Globalization.NumberStyles.Number), 1);
                            ms.diemthi = Math.Round(double.Parse(Server.HtmlDecode(GridView2.Rows[i].Cells[6].Text), System.Globalization.NumberStyles.Number), 1);
                            if (ms.diemquatrinh > 10)
                            {
                                ms.diemquatrinh /= 10;
                                ms.diemthi /= 10;
                            }
                        }
                        catch
                        {
                            ms.diemquatrinh = Math.Round(double.Parse(GridView2.Rows[i].Cells[7].Text.Trim(), System.Globalization.NumberStyles.Number), 1);
                            ms.diemthi = Math.Round(double.Parse(Server.HtmlDecode(GridView2.Rows[i].Cells[7].Text), System.Globalization.NumberStyles.Number), 1);
                            if (ms.diemquatrinh > 10)
                            {
                                ms.diemquatrinh /= 10;
                                ms.diemthi /= 10;
                            }
                        }
                        MonHoc mh = db.MonHocs.Single(p => p.mamonhoc == GridView2.Rows[i].Cells[0].Text);
                        ms.heso = mh.heso;
                        db.MonSinhs.InsertOnSubmit(ms);
                    }
                }
                db.SubmitChanges();
                dlcachtk.SelectedIndex = 0;
                TinhDiem();
            }
            catch
            {

            }
        }

        protected void lbxohet_Click(object sender, EventArgs e)
        {
            pnhoixoa.Visible = true;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            pnhoixoa.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var q = from p in db.MonSinhs
                    where p.id == (int)Session["ID"]
                    select p;
            foreach (MonSinh ms in q)
                db.MonSinhs.DeleteOnSubmit(ms);
            db.SubmitChanges();
            dlcachtk.SelectedIndex = 0;
            TinhDiem();
            pnhoixoa.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            pnhoixoa.Visible = false;
        }
    }
}