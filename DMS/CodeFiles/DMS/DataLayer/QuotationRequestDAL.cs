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
    public class QuotationRequestDAL
    {
        Database objDB;
        // static string ConnectionString;
        public QuotationRequestDAL()
        {
            //ConnectionString = ConfigurationManager.ConnectionStrings["DMS"].ToString();
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }

        public DataSet SelectData(string condition, string qid = null)
        {
            try
            {
                //   objDB = new SqlDatabase(ConnectionString);
                using (DbCommand objCMD = objDB.GetStoredProcCommand("sp_quotation_select_statement"))
                {
                    objDB.AddInParameter(objCMD, "@condition", DbType.String, condition);
                    if (!string.IsNullOrEmpty(qid))
                        objDB.AddInParameter(objCMD, "@quotation_id", DbType.String, qid);
                    return objDB.ExecuteDataSet(objCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                return null;
            }
        }

        public int SaveQuotationRequestForm(QuotationRequestModel qrm)
        {
            int i = 0;

            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    string quotationid = string.Empty;
                    DbCommand quotaionDBcmd = objDB.GetStoredProcCommand("sp_quotation_request_form");
                    if (qrm.Id != null && qrm.Id != "")
                        objDB.AddInParameter(quotaionDBcmd, "@quotation_id", DbType.String, qrm.Id);
                    objDB.AddInParameter(quotaionDBcmd, "@custname", DbType.String, qrm.CompanyName);
                    objDB.AddInParameter(quotaionDBcmd, "@mr", DbType.String, qrm.MR);
                    objDB.AddInParameter(quotaionDBcmd, "@street", DbType.String, qrm.Street);
                    objDB.AddInParameter(quotaionDBcmd, "@phone", DbType.String, qrm.Phone);
                    objDB.AddInParameter(quotaionDBcmd, "@zip", DbType.String, qrm.Zip);
                    objDB.AddInParameter(quotaionDBcmd, "@email", DbType.String, qrm.Email);
                    objDB.AddInParameter(quotaionDBcmd, "@website", DbType.String, qrm.Website);
                    objDB.AddInParameter(quotaionDBcmd, "@fax", DbType.String, qrm.Fax);
                    objDB.AddInParameter(quotaionDBcmd, "@branch", DbType.String, qrm.Branch);
                    objDB.AddInParameter(quotaionDBcmd, "@industry", DbType.String, qrm.Industry);
                    objDB.AddInParameter(quotaionDBcmd, "@country", DbType.Int32, qrm.Country);
                    objDB.AddInParameter(quotaionDBcmd, "@otherinfo", DbType.String, qrm.OtherInfo);
                    objDB.AddInParameter(quotaionDBcmd, "@date", DbType.Date, qrm.Date);
                    objDB.AddInParameter(quotaionDBcmd, "@place", DbType.String, qrm.Place);
                    objDB.AddInParameter(quotaionDBcmd, "@name", DbType.String, qrm.PersonName);
                    objDB.AddInParameter(quotaionDBcmd, "@sponsor", DbType.String, qrm.sponsor);
                    objDB.AddOutParameter(quotaionDBcmd, "@id", DbType.String, 15);

                    objDB.ExecuteScalar(quotaionDBcmd, trans);
                    quotationid = objDB.GetParameterValue(quotaionDBcmd, "@id").ToString();

                    // Company Details 

                    List<CompanyDeatils> lstCompanyDeatils = qrm.CompanyDeatils;
                    if (lstCompanyDeatils.Count > 0)
                    {
                        foreach (CompanyDeatils item in lstCompanyDeatils)
                        {
                            DbCommand detailedScopeDBCmd = objDB.GetStoredProcCommand("sp_quotation_request_company_details");
                            objDB.AddInParameter(detailedScopeDBCmd, "@q_id", DbType.String, quotationid);
                            objDB.AddInParameter(detailedScopeDBCmd, "@caption", DbType.String, item.Caption);
                            objDB.AddInParameter(detailedScopeDBCmd, "@caption_id", DbType.Int32, item.id);
                            objDB.AddInParameter(detailedScopeDBCmd, "@data", DbType.String, item.Value);
                            objDB.ExecuteScalar(detailedScopeDBCmd, trans);
                        }
                    }


                    // Scope

                    List<Scope> lstScope = qrm.Scope;
                    if (lstScope.Count > 0)
                    {
                        foreach (Scope item in lstScope)
                        {
                            DbCommand scopeDBCmd = objDB.GetStoredProcCommand("sp_quotation_request_scope");
                            objDB.AddInParameter(scopeDBCmd, "@q_id", DbType.String, quotationid);
                            objDB.AddInParameter(scopeDBCmd, "@audit_id", DbType.Int32, item.id);
                            objDB.AddInParameter(scopeDBCmd, "@caption", DbType.String, item.Caption);
                            objDB.AddInParameter(scopeDBCmd, "@already", DbType.Int32, item.Already);
                            objDB.AddInParameter(scopeDBCmd, "@Certified", DbType.String, item.Certified);
                            objDB.ExecuteScalar(scopeDBCmd, trans);
                        }
                    }


                    List<DetailedScope> lstDetailedScope = qrm.DetailedScope;
                    if (lstDetailedScope.Count > 0)
                    {
                        foreach (DetailedScope item in lstDetailedScope)
                        {
                            if (item.scope != "")
                            {
                                DbCommand detailedscopeDBCmd = objDB.GetStoredProcCommand("sp_quotation_request_scope_details");
                                objDB.AddInParameter(detailedscopeDBCmd, "@q_id", DbType.String, quotationid);
                                objDB.AddInParameter(detailedscopeDBCmd, "@audit_type", DbType.Int32, item.audit_type);
                                objDB.AddInParameter(detailedscopeDBCmd, "@c_status", DbType.Int32, (item.c_status != "" ? item.c_status : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@scope", DbType.String, item.scope);
                                objDB.AddInParameter(detailedscopeDBCmd, "@siteaddress", DbType.String, item.siteaddress);
                                objDB.AddInParameter(detailedscopeDBCmd, "@workdesc", DbType.String, item.workdesc);
                                objDB.AddInParameter(detailedscopeDBCmd, "@empstrength", DbType.Int32, (item.empstrength != "" ? item.empstrength : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@managerial", DbType.Int32, (item.managerial != "" ? item.managerial : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@technical", DbType.Int32, (item.technical != "" ? item.technical : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@it", DbType.Int32, (item.it != "" ? item.it : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@business", DbType.Int32, (item.business != "" ? item.business : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@admin", DbType.Int32, (item.admin != "" ? item.admin : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@hr", DbType.Int32, (item.hr != "" ? item.hr : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@finance", DbType.Int32, (item.finance != "" ? item.finance : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@other", DbType.Int32, (item.other != "" ? item.other : null));
                                objDB.AddInParameter(detailedscopeDBCmd, "@offsite", DbType.String, item.offsite);
                                objDB.ExecuteScalar(detailedscopeDBCmd, trans);
                            }
                        }
                    }
                    // ISO Questions

                    List<QuestionISO9001> lstQuestionISO9001 = qrm.QuestionISO9001;
                    List<QuestionISO20000> lstQuestionISO20000 = qrm.QuestionISO20000;
                    List<QuestionISO27001> lstQuestionISO27001 = qrm.QuestionISO27001;
                    if (lstQuestionISO9001.Count > 0)
                    {
                        foreach (QuestionISO9001 item in lstQuestionISO9001)
                        {
                            DbCommand isoDBCmd = objDB.GetStoredProcCommand("sp_quotation_iso_question");
                            objDB.AddInParameter(isoDBCmd, "@q_id", DbType.String, quotationid);
                            objDB.AddInParameter(isoDBCmd, "@iso_audit_type", DbType.String, item.AuditType);
                            objDB.AddInParameter(isoDBCmd, "@caption", DbType.String, item.Caption);
                            objDB.AddInParameter(isoDBCmd, "@caption_id", DbType.String, item.id);
                            objDB.AddInParameter(isoDBCmd, "@data", DbType.String, item.Value);
                            objDB.ExecuteScalar(isoDBCmd, trans);
                        }
                    }
                    if (lstQuestionISO20000.Count > 0)
                    {
                        foreach (QuestionISO20000 item in lstQuestionISO20000)
                        {
                            DbCommand isoDBCmd = objDB.GetStoredProcCommand("sp_quotation_iso_question");
                            objDB.AddInParameter(isoDBCmd, "@q_id", DbType.String, quotationid);
                            objDB.AddInParameter(isoDBCmd, "@iso_audit_type", DbType.String, item.AuditType);
                            objDB.AddInParameter(isoDBCmd, "@caption", DbType.String, item.Caption);
                            objDB.AddInParameter(isoDBCmd, "@caption_id", DbType.String, item.id);
                            objDB.AddInParameter(isoDBCmd, "@data", DbType.String, item.Value);
                            objDB.ExecuteScalar(isoDBCmd, trans);
                        }
                    }
                    if (lstQuestionISO27001.Count > 0)
                    {
                        foreach (QuestionISO27001 item in lstQuestionISO27001)
                        {
                            DbCommand isoDBCmd = objDB.GetStoredProcCommand("sp_quotation_iso_question");
                            objDB.AddInParameter(isoDBCmd, "@q_id", DbType.String, quotationid);
                            objDB.AddInParameter(isoDBCmd, "@iso_audit_type", DbType.String, item.AuditType);
                            objDB.AddInParameter(isoDBCmd, "@caption", DbType.String, item.Caption);
                            objDB.AddInParameter(isoDBCmd, "@caption_id", DbType.String, item.id);
                            objDB.AddInParameter(isoDBCmd, "@data", DbType.String, item.Value);
                            objDB.ExecuteScalar(isoDBCmd, trans);
                        }
                    }
                    // 6.	Questions to Ascertain Overall Complexity

                    List<QuestionOverallComplexity> lstQuestionOverallComplexity = qrm.QuestionOverallComplexity;
                    if (lstQuestionOverallComplexity.Count > 0)
                    {
                        foreach (QuestionOverallComplexity item in lstQuestionOverallComplexity)
                        {
                            DbCommand complexityDBCmd = objDB.GetStoredProcCommand("sp_quotation_overall_complexity");
                            objDB.AddInParameter(complexityDBCmd, "@q_id", DbType.String, quotationid);
                            objDB.AddInParameter(complexityDBCmd, "@response", DbType.String, item.Response);
                            objDB.AddInParameter(complexityDBCmd, "@caption", DbType.String, item.Caption);
                            objDB.AddInParameter(complexityDBCmd, "@caption_id", DbType.Int32, item.id);
                            objDB.AddInParameter(complexityDBCmd, "@support", DbType.String, item.Support);
                            objDB.ExecuteScalar(complexityDBCmd, trans);
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

        public DataSet GetImpartialityChecklist(Impartiality_Checklist obj)
        {
            try
            {
                using (DbCommand objCMD = objDB.GetStoredProcCommand("sp_impartiality_checklist"))
                {
                    objDB.AddInParameter(objCMD, "@condition", DbType.String, obj.condition);
                    objDB.AddInParameter(objCMD, "@quotationid", DbType.String, obj.quotationid);
                    return objDB.ExecuteDataSet(objCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                return null;
            }
        }
        public int SaveImpartialityCheckList(Impartiality_Checklist_Model icm)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    string query = "DELETE FROM map_quotation_review_checklist WHERE quotation_id='" + icm.lstImpartialityChecklist[0].quotationid + "'";
                    using (DbCommand oCMD = objDB.GetSqlStringCommand(query))
                    {
                        objDB.ExecuteDataSet(oCMD, trans);
                    }
                    foreach (Impartiality_Checklist ic in icm.lstImpartialityChecklist)
                    {
                        using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_impartiality_checklist"))
                        {
                            objDB.AddInParameter(oCMD, "@quotationid", DbType.String, ic.quotationid);
                            objDB.AddInParameter(oCMD, "@checklistid", DbType.Int32, ic.checklistid);
                            objDB.AddInParameter(oCMD, "@remark", DbType.String, ic.remarks);
                            objDB.AddInParameter(oCMD, "@condition", DbType.String, ic.condition);
                            //objDB.AddInParameter(oCMD, "@reviewedby", DbType.String, ic.reviewedby);
                            objDB.ExecuteDataSet(oCMD, trans);
                        }
                    }
                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_impartiality_checklist"))
                    {
                        objDB.AddInParameter(oCMD, "@reviewedby", DbType.String, icm.UserName);
                        objDB.AddInParameter(oCMD, "@reviewdate", DbType.String, icm.ReviewDate);
                        objDB.AddInParameter(oCMD, "@approvername", DbType.String, icm.ApproverName);
                        objDB.AddInParameter(oCMD, "@Condition", DbType.String, icm.Condition);
                        objDB.AddInParameter(oCMD, "@quotationid", DbType.String, icm.lstImpartialityChecklist[0].quotationid);
                        objDB.ExecuteDataSet(oCMD, trans);
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


    }
}
