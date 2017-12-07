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
    public class AuditReportBL
    {
        AuditReportDAL oAuditReportDAL = null;
        public AuditReportBL()
        {
            oAuditReportDAL = new AuditReportDAL();
        }
        public DataTable SelectAuditReportCheckList(AuditReportModel arm)
        {
            DataSet ds = oAuditReportDAL.SelectAuditReportCheckList(arm);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
        public int SaveAuditorCheckList(AuditReportModel arm)
        {
            return oAuditReportDAL.SaveAuditorCheckList(arm);
        }

        ///////////////////save Audit Report //////////////////////
        public DataTable GetAuditReport(AuditReportModel arm)
        {
            DataSet ds = oAuditReportDAL.GetAuditReport(arm);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
        public int SaveAuditReport(AuditReportModel arm)
        {
            return oAuditReportDAL.SaveAuditReport(arm);
        }

        public int SaveAuditNextStatement(AuditReportModel arm)
        {
            return oAuditReportDAL.SaveAuditNextStatement(arm);
        }

        public DataTable GetNextAuditStatement(AuditReportModel arm)
        {
            DataSet ds = oAuditReportDAL.GetNextAuditStatement(arm);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }

        public DataTable GetStageId(AuditReportModel arm)
        {
            DataSet ds = oAuditReportDAL.GetStageId(arm);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }
    }
}
