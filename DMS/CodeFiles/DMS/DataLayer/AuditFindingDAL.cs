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
    public class AuditFindingDAL
    {
        Database objDB = null;
        public AuditFindingDAL()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }

        public DataSet GetALLAuditor()
        {
            DataSet ds = null;
            try
            {
                string query = "SELECT  email, name FROM vw_users";
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


        public DataSet GetALLAuditFinding(AuditFindingModel af)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_finding"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, af.condition);
                    objDB.AddInParameter(oCMD, "@id", DbType.Int32, af.id);
                    objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, af.audit_program_id);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public int SaveAuditFinding(AuditFindingModel af)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_finding"))
                    {
                        objDB.AddInParameter(oCMD, "@id", DbType.Int32, af.id);
                        objDB.AddInParameter(oCMD, "@site_loc   ", DbType.String, af.site_loc);
                        objDB.AddInParameter(oCMD, "@auditor_emailid   ", DbType.String, af.auditor_emailid);
                        objDB.AddInParameter(oCMD, "@auditee_name   ", DbType.String, af.auditee_name);
                        objDB.AddInParameter(oCMD, "@proj_name", DbType.String, af.proj_name);
                        objDB.AddInParameter(oCMD, "@iso_9001", DbType.String, af.iso_9001);
                        objDB.AddInParameter(oCMD, "@iso_27001", DbType.String, af.iso_27001);
                        objDB.AddInParameter(oCMD, "@iso_20000", DbType.String, af.iso_20000);
                        objDB.AddInParameter(oCMD, "@type_id", DbType.Int32, af.type_id);
                        objDB.AddInParameter(oCMD, "@description", DbType.String, af.description);
                        objDB.AddInParameter(oCMD, "@root_cause", DbType.String, af.root_cause);
                        objDB.AddInParameter(oCMD, "@corrective_action", DbType.String, af.corrective_action);
                        objDB.AddInParameter(oCMD, "@preventive_actions", DbType.String, af.preventive_actions);
                        objDB.AddInParameter(oCMD, "@date_implementing_corrective_action", DbType.String, af.date_implementing_corrective_action);
                        objDB.AddInParameter(oCMD, "@verification_dtl_corrective_action", DbType.String, af.verification_dtl_corrective_action);
                        objDB.AddInParameter(oCMD, "@Initials_of_mqas_auditor_reviewing_ca_proposed", DbType.String, af.Initials_of_mqas_auditor_reviewing_ca_proposed);
                        objDB.AddInParameter(oCMD, "@date_proposed_ca_accepted_by_mqas", DbType.String, af.date_proposed_ca_accepted_by_mqas);
                        objDB.AddInParameter(oCMD, "@initials_mqas_auditor_verify_effect_of_corrective_action", DbType.String, af.initials_mqas_auditor_verify_effect_of_corrective_action);
                        objDB.AddInParameter(oCMD, "@date_ca_verified_by_mqas", DbType.String, af.date_ca_verified_by_mqas);
                        objDB.AddInParameter(oCMD, "@mqas_auditor_comments_on_ca_verification", DbType.String, af.mqas_auditor_comments_on_ca_verification);
                        objDB.AddInParameter(oCMD, "@date_for_closure_of_non_conformity", DbType.String, af.date_for_closure_of_non_conformity);
                        objDB.AddInParameter(oCMD, "@date", DbType.String, af.date);
                        objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, af.audit_program_id);
                        objDB.AddInParameter(oCMD, "@condition", DbType.String, af.condition);
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
        public DataSet GetAuditFinding(AuditFindingModel af,string Condition)
        {
            DataSet ds = null;
            try
            {
                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_getaudit_finding"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, Condition);
                    objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, af.audit_program_id);
                    objDB.AddInParameter(oCMD, "@type_id", DbType.Int32, af.type_id);
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
