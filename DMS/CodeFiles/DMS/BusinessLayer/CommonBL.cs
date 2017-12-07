using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelEntity;
using System.Reflection;
using DataLayer;
namespace BusinessLayer
{
    public class CommonBL
    {
        CommonDAL oCommonDAL = null;
        public CommonBL()
        {
            oCommonDAL = new CommonDAL();
        }
        public DataTable GetMasterTableData(string tableName, string sortingColumn = null)
        {
            try
            {
                DataSet ds = oCommonDAL.GetMasterTableData(tableName, sortingColumn);
                if (ds != null)
                {
                    return ds.Tables[0];
                }
                else
                    return null;
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                return null;
            }
        }


        public bool IsBaselined(string AuditProgramId)
        {
            bool isSuccess = oCommonDAL.IsBaselined(AuditProgramId);
            return isSuccess;
        }



       
    }
}
