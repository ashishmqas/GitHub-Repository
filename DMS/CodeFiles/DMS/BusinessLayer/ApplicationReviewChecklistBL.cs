using DataLayer;
using ModelEntity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ModelEntity;
using System.Reflection;

namespace BusinessLayer
{
    public class ApplicationReviewChecklistBL
    {
        ApplicationReviewChecklistDAL obj = null;
        public ApplicationReviewChecklistBL()
        {
            obj = new ApplicationReviewChecklistDAL();
        }

        public int Save(ApplicationReviewChecklistModel ar)
        {
            return obj.Save(ar);
        }

        public DataTable GetCompanyDetail(ApplicationReviewChecklistModel ar)
        {
            DataTable dt = null;
            try
            {
                DataSet ds = obj.GetCompanyDetail(ar);
                if (ds != null)
                    dt = ds.Tables[0];
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return dt;
        }
    }
}