using Microsoft.Practices.EnterpriseLibrary.Data;
using ModelEntity;
using ModelEntity.Model;
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
    public class AuditorTimeDAL
    {
        Database objDB = null;
        public AuditorTimeDAL()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }




        public DataSet GetAuditorTime(AuditorTimeModel at)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_time"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, at.Condition);
                    objDB.AddInParameter(oCMD, "@id", DbType.Int32, at.Id);
                    objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, at.Audit_Program_Id);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public int SaveAuditorTime(AuditorTimeModel at)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_time"))
                    {
                        objDB.AddInParameter(oCMD, "@id", DbType.Int32, at.Id);
                        objDB.AddInParameter(oCMD, "@audit_program_id   ", DbType.String, at.Audit_Program_Id);
                        objDB.AddInParameter(oCMD, "@auditplanning   ", DbType.String, at.AuditPlanning);
                        objDB.AddInParameter(oCMD, "@onsiteaudit   ", DbType.String, at.OnsiteAudit);
                        objDB.AddInParameter(oCMD, "@condition", DbType.String, at.Condition);
                        i = (int)objDB.ExecuteScalar(oCMD, trans);
                    }
                    trans.Commit();
                }
                catch (Exception ex)
                {
                    GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                    trans.Rollback();
                }
                conn.Close();
            }
            return i;
        }
    }
}
