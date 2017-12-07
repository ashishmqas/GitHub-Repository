using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class AuditReportModel
    {
        public string ProgramId { get; set; }
        public List<AuditReportChecklistModel> Checklist { get; set; }

        public int Id { get; set; }
        public string Statutoryregulatoryrequirement { get; set; }
        public string Exclusionsclaimedandaccepted { get; set; }
        public string Reference { get; set; }
        public string Internalauditprogramandmanagementreview { get; set; }
        public string Condition { get; set; }

        public List<AuditNextState> lstAuditNextState { get; set; }
    }

    public class AuditNextState
    {
        public string Id { get; set; }
        public string Statement { get; set; }
        public string Val { get; set; }
    }
}
