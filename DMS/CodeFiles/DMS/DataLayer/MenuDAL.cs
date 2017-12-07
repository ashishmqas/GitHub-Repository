using Microsoft.Practices.EnterpriseLibrary.Data;
using ModelEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class MenuDAL
    {
        Database objDB = null;
        public MenuDAL()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }

        public List<MenuEntity> GetMenus(string empId, string role)
        {
            return GetMenusFromDb(empId, role);
        }

        private List<MenuEntity> GetMenusFromDb(string empId, string role)
        {
            var table = new DataTable();
            try
            {
                DataSet ds = null;
                using (DbCommand oCMD = objDB.GetStoredProcCommand("GetMenus"))
                {
                    objDB.AddInParameter(oCMD, "@EmpId", DbType.String, empId);
                    objDB.AddInParameter(oCMD, "@Role", DbType.Int32, role);                    
                    ds = objDB.ExecuteDataSet(oCMD);
                }
                if(ds!=null && ds.Tables.Count>0)
                {
                    table = ds.Tables[0];
                }                
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return DataTableToList(table);
        }

        private List<MenuEntity> DataTableToList(DataTable dt)
        {
            var list = new List<MenuEntity>();
            MenuEntity entity = null;
            if (dt != null && dt.Rows != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    list.Add(
                        new MenuEntity
                        {
                            Id = Convert.ToInt32(row["id"]),
                            MenuName = row["menu_desc"] == DBNull.Value ? string.Empty : Convert.ToString(row["menu_desc"]),
                            PageName = row["screen_name"] == DBNull.Value ? string.Empty : Convert.ToString(row["screen_name"]),
                            Url = row["URL"] == DBNull.Value ? string.Empty : Convert.ToString(row["URL"]),
                            ParentMenuId = row["ParentId"] == DBNull.Value ? 0 : Convert.ToInt32(row["ParentId"]),
                            IsActive = row["IsActive"] == DBNull.Value ? false : Convert.ToBoolean(row["IsActive"])
                        }
                        );
                }
            }
            return list;
        }
    }
}
