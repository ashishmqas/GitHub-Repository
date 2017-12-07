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
    public class AuditProgramBL
    {
        AuditProgramDAL oAuditProgramDAL = null;

        public AuditProgramBL()
        {
            oAuditProgramDAL = new AuditProgramDAL();
        }
        public DataTable GetALLQuotationForm()
        {
            DataSet ds = oAuditProgramDAL.GetALLQuotationForm();
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
        public DataTable GetALLAuditProgram(AuditProgramModel ap)
        {
            DataSet ds = oAuditProgramDAL.GetALLAuditProgram(ap);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
        public int SaveAuditProgram(AuditProgramModel ap)
        {
            return oAuditProgramDAL.SaveAuditProgram(ap);
        }
        public int SaveAssignAuditor(AssignAuditorModel aa)
        {
            return oAuditProgramDAL.SaveAssignAuditor(aa);
        }
        public DataTable AuditorAssignedTask(AssignAuditorModel aa)
        {
            DataSet ds = oAuditProgramDAL.AuditorAssignedTask(aa);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
    }
}
