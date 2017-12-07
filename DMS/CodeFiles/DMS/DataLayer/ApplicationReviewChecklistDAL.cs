using Microsoft.Practices.EnterpriseLibrary.Data;
using ModelEntity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelEntity;
using System.Reflection;
using System.Data.Common;
using System.Data;
namespace DataLayer
{
    public class ApplicationReviewChecklistDAL
    {
        Database objDB = null;
        public ApplicationReviewChecklistDAL()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }

        public int Save(ApplicationReviewChecklistModel ar)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                    DbCommand HeaderDBcmd = objDB.GetStoredProcCommand("sp_appliaction_review_checklist");
                    objDB.AddInParameter(HeaderDBcmd, "@q_id", DbType.String, ar.QuotationID);
                    objDB.AddInParameter(HeaderDBcmd, "@comp_name", DbType.String, ar.CompanyName);
                    objDB.AddInParameter(HeaderDBcmd, "@nacecode", DbType.String, ar.NACECode);
                    objDB.AddInParameter(HeaderDBcmd, "@reviewed_by", DbType.String, ar.ReviewedBy);
                    objDB.AddInParameter(HeaderDBcmd, "@received_date", DbType.String, ar.ReceivingDate);
                    objDB.AddInParameter(HeaderDBcmd, "@review_date", DbType.String, ar.ReviewDate);
                    objDB.AddInParameter(HeaderDBcmd, "@gonogo", DbType.String, ar.GoNoGo);
                    objDB.AddInParameter(HeaderDBcmd, "@reason", DbType.String, ar.Reason);
                    objDB.ExecuteScalar(HeaderDBcmd, trans);

                    string query = "DELETE FROM app_review_list WHERE q_id='"+ar.QuotationID+"'";
                    using (DbCommand oCMD = objDB.GetSqlStringCommand(query))
                    {
                        objDB.ExecuteNonQuery(oCMD);
                    }
                    foreach (ReviewChecklist item in ar.checklist)
                    {
                        DbCommand LineDBcmd = objDB.GetStoredProcCommand("sp_app_review_checklist_line");
                        objDB.AddInParameter(LineDBcmd, "@q_id", DbType.String, ar.QuotationID);
                        objDB.AddInParameter(LineDBcmd, "@chklist_id", DbType.String, item.ID);
                        objDB.AddInParameter(LineDBcmd, "@remark", DbType.String, item.Remarks);
                        objDB.ExecuteScalar(LineDBcmd, trans);
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
        public DataSet GetCompanyDetail(ApplicationReviewChecklistModel ar)
        {
            DataSet ds = null;
            try
            {

                using (DbCommand oCMD=objDB.GetStoredProcCommand("sp_appliaction_review_checklist_select"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, ar.Condition);
                    objDB.AddInParameter(oCMD, "@qid", DbType.String, ar.QuotationID);
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
