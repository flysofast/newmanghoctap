using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MangHocTap.Classes
{
    
    public class SuKienThoiGianBieu
    {
        public string ID { set; get; }
        public string tensukien { set; get; }
        public string noidung { set; get; }
        public string diadiem { set; get; }
        public int SV_ID { set; get; }
        public DateTime batdau=new DateTime();
        public DateTime ketthuc=new DateTime();
        public SuKienThoiGianBieu()
        {
            ID = tensukien = noidung = diadiem = "";
            batdau = ketthuc = DateTime.Now;
        }
        
    }
}