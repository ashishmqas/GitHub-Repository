using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using System.Data;
using ModelEntity;
using System.Reflection;
using ModelEntity.Model;
namespace BusinessLayer
{
    public class QuotationRequestBL
    {
        QuotationRequestDAL oQuotationRequestDAL = null;
        public QuotationRequestBL()
        {
            oQuotationRequestDAL = new QuotationRequestDAL();
        }
        public DataTable SelectData(string condition, string qid = null)
        {
            try
            {
                DataSet ds = oQuotationRequestDAL.SelectData(condition, qid);
                if (ds != null)
                    return ds.Tables[0];
                else
                    return null;
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                return null;
            }
        }
        public int SaveQuotationRequestForm(QuotationRequestModel qrm)
        {
            return oQuotationRequestDAL.SaveQuotationRequestForm(qrm);
        }

        public DataTable GetImpartialityChecklist(Impartiality_Checklist obj)
        {
            try
            {
                DataSet ds = oQuotationRequestDAL.GetImpartialityChecklist(obj);
                if (ds != null)
                    return ds.Tables[0];
                else
                    return null;
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                return null;
            }
        }
        public int SaveImpartialityCheckList(Impartiality_Checklist_Model icm)
        {
            return oQuotationRequestDAL.SaveImpartialityCheckList(icm);
        }
    }
}
