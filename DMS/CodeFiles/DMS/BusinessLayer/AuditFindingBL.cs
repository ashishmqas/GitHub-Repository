using DataLayer;
using ModelEntity.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
   public class AuditFindingBL
    {
        AuditFindingDAL oAuditFindingDAL = null;

        public AuditFindingBL()
        {
            oAuditFindingDAL = new AuditFindingDAL();
        }
        public DataTable GetALLAuditFinding(AuditFindingModel af)
        {
            DataSet ds = oAuditFindingDAL.GetALLAuditFinding(af);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
        public DataTable GetALLAuditor()
        {
            DataSet ds = oAuditFindingDAL.GetALLAuditor();
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
        public int SaveAuditFinding(AuditFindingModel af)
        {
            return oAuditFindingDAL.SaveAuditFinding(af);
        }
        public DataTable GetAuditFinding(AuditFindingModel af,string Condition)
        {
            DataSet ds = oAuditFindingDAL.GetAuditFinding(af, Condition);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }

    }
}
