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
    public class AuditReportDAL
    {
        Database objDB = null;
        public AuditReportDAL()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }
        public DataSet SelectAuditReportCheckList(AuditReportModel arm)
        {
            DataSet ds = null;
            try
            {
                string query = "SELECT * FROM vw_audit_report_checklist WHERE programid='" + arm.ProgramId + "'";
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

        public int SaveAuditorCheckList(AuditReportModel arm)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    string query = "DELETE FROM map_audit_report_checklist WHERE programid='" + arm.ProgramId + "'";
                    using (DbCommand oCMD = objDB.GetSqlStringCommand(query))
                    {
                        objDB.ExecuteDataSet(oCMD, trans);
                    }
                    foreach (AuditReportChecklistModel item in arm.Checklist)
                    {
                        using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_auditor_report_checklist"))
                        {
                            objDB.AddInParameter(oCMD, "@id", DbType.Int32, item.id);
                            objDB.AddInParameter(oCMD, "@programid", DbType.Int32, arm.ProgramId);
                            objDB.AddInParameter(oCMD, "@option", DbType.String, item.Option);
                            objDB.ExecuteDataSet(oCMD, trans);
                        }
                    }
                    trans.Commit();
                    i = 1;
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


        ///////////////////save Audit Report //////////////////////

        public DataSet GetAuditReport(AuditReportModel arm)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_report"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, arm.Condition);
                    objDB.AddInParameter(oCMD, "@id", DbType.Int32, arm.Id);
                    objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, arm.ProgramId);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public DataSet GetNextAuditStatement(AuditReportModel arm)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_report"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, arm.Condition);
                    objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, arm.ProgramId);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }
        public DataSet GetStageId(AuditReportModel arm)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_report"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, arm.Condition);
                    objDB.AddInParameter(oCMD, "@audit_program_id", DbType.String, arm.ProgramId);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public int SaveAuditReport(AuditReportModel arm)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_report"))
                    {
                        objDB.AddInParameter(oCMD, "@id", DbType.Int32, arm.Id);
                        objDB.AddInParameter(oCMD, "@audit_program_id   ", DbType.Int32, arm.ProgramId);
                        objDB.AddInParameter(oCMD, "@statutoryregulatoryrequirement   ", DbType.String, arm.Statutoryregulatoryrequirement);
                        objDB.AddInParameter(oCMD, "@exclusionsclaimedandaccepted   ", DbType.String, arm.Exclusionsclaimedandaccepted);
                        objDB.AddInParameter(oCMD, "@reference", DbType.String, arm.Reference);
                        objDB.AddInParameter(oCMD, "@internalauditprogramandmanagementreview", DbType.String, arm.Internalauditprogramandmanagementreview);

                        objDB.AddInParameter(oCMD, "@condition", DbType.String, arm.Condition);
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
        public int SaveAuditNextStatement(AuditReportModel arm)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_audit_report"))
                    {
                        objDB.AddInParameter(oCMD, "@audit_program_id   ", DbType.Int32, arm.ProgramId);
                        objDB.AddInParameter(oCMD, "@audit_statement", DbType.String, arm.lstAuditNextState[0].Statement);
                        objDB.AddInParameter(oCMD, "@statement_value", DbType.String, arm.lstAuditNextState[0].Val);
                        objDB.AddInParameter(oCMD, "@auditstatementid", DbType.String, arm.lstAuditNextState[0].Id);

                        objDB.AddInParameter(oCMD, "@condition", DbType.String, arm.Condition);
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
