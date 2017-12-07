using Microsoft.Practices.EnterpriseLibrary.Data;
using ModelEntity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;

namespace DataLayer
{
    public class CommonDAL
    {
        Database objDB;
        //   static string ConnectionString;
        public CommonDAL()
        {
            // ConnectionString = ConfigurationManager.ConnectionStrings["DMS"].ToString();
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }

        public DataSet GetMasterTableData(string tableName, string sortingColumn = null)
        {

            try
            {
                //  objDB = new SqlDatabase(ConnectionString);
                using (DbCommand objcmd = objDB.GetStoredProcCommand("sp_get_master_data"))
                {
                    objDB.AddInParameter(objcmd, "@tableName", DbType.String, tableName);
                    if (sortingColumn != null)
                        objDB.AddInParameter(objcmd, "@columnName", DbType.String, sortingColumn);
                    return objDB.ExecuteDataSet(objcmd);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                return null;
            }
        }
        public bool IsBaselined(string AuditProgramId)
        {
            DataSet ds = null;
            bool isSuccess = false;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_checkbaseline"))
                {
                    objDB.AddInParameter(oCMD, "@programid", DbType.String, AuditProgramId);
                    ds = objDB.ExecuteDataSet(oCMD);
                    if (ds != null && ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0][0].ToString() != "")
                            {
                                isSuccess = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return isSuccess;

        }

       
        
    }
}
