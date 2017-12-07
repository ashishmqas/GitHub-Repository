using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class AuditorTimeModel
    {
        public int Id { get; set; }
        public string Audit_Program_Id { get; set; }
        public string AuditPlanning { get; set; }
        public string OnsiteAudit { get; set; }
        public string Condition { get; set; }
    }
}
