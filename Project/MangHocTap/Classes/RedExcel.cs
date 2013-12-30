using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
namespace MangHocTap.Classes
{
    public class RedExcel
    {
        OleDbConnection _con;
        string _cn;
        string pathFile;
        DataTable _table;
        OleDbDataAdapter _da;
        public RedExcel(string pf)
        {
            pathFile = pf;
        }
        public OleDbConnection Connect()
        {

            if (pathFile.Contains("xlsx")) 
               _cn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + pathFile + ";" + "Extended Properties=Excel 12.0;";
            else
                _cn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + pathFile + ";" + "Extended Properties=Excel 8.0;";

            _con = new OleDbConnection(_cn);

            _con.Open();

            return _con;
        }
        public DataTable GetDataTable(String sql)
        {
            _table = new DataTable();

            try
            {
                _con = Connect();
                _da = new OleDbDataAdapter(sql, _con);
                _da.Fill(_table);
                _con.Close();
                return _table;
            }
            catch (OleDbException ex)
            {
                _con.Close();
                return _table;
            }
        }
    }
}