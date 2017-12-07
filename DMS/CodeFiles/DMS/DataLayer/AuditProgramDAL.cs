using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ModelEntity;
using System.Reflection;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using ModelEntity.Model;

namespace DataLayer
{
    public class AuditProgramDAL
    {
        Database objDB = null;
        public AuditProgramDAL()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }

        public DataSet GetALLQuotationForm()
        {
            DataSet ds = null;
            try
            {
                string query = "SELECT * FROM vw_quotation_form";
                using (DbCommand oCMD = objDB.GetSqlStringCommand(query))
                {
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public DataSet GetALLAuditProgram(AuditProgramModel ap)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_program_select_statement"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, ap.condition);
                    objDB.AddInParameter(oCMD, "@id", DbType.Int32, (ap.id!=""?ap.id:null));
                    objDB.AddInParameter(oCMD, "@q_id", DbType.String, ap.q_id);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public int SaveAuditProgram(AuditProgramModel ap)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_program"))
                    {
                        objDB.AddInParameter(oCMD, "@id", DbType.Int32, ap.id);
                        objDB.AddInParameter(oCMD, "@q_id", DbType.String, ap.q_id);
                        objDB.AddInParameter(oCMD, "@stageid", DbType.Int32, ap.stageid);
                        objDB.AddInParameter(oCMD, "@nod", DbType.String, ap.nod);
                        objDB.AddInParameter(oCMD, "@stagename", DbType.String, ap.stagename);
                        objDB.AddInParameter(oCMD, "@frmdt", DbType.Date, ap.frmdt);
                        objDB.AddInParameter(oCMD, "@todt", DbType.Date, ap.todt);
                        objDB.AddInParameter(oCMD, "@remark", DbType.String, ap.remark);
                        objDB.AddInParameter(oCMD, "@condition", DbType.String, ap.condition); 
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

        public int SaveAssignAuditor(AssignAuditorModel aa)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_assign_auditor"))
                    {
                        objDB.AddInParameter(oCMD, "@id", DbType.Int32, aa.id);
                        objDB.AddInParameter(oCMD, "@aprogramid", DbType.String, aa.aprogramid);
                        objDB.AddInParameter(oCMD, "@auditorid", DbType.String, aa.auditorid);
                        objDB.AddInParameter(oCMD, "@auditornm", DbType.String, aa.auditornm);
                        objDB.AddInParameter(oCMD, "@auitor_type", DbType.Int32, aa.auitor_type);                       
                        objDB.AddInParameter(oCMD, "@condition", DbType.String, aa.condition);
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

        public DataSet AuditorAssignedTask(AssignAuditorModel aa)
        {
            DataSet ds = null;
            try
            {
                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_get_assigned_program"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, aa.condition);
                    objDB.AddInParameter(oCMD, "@user", DbType.String, aa.auditorid);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
             GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

    }
}
