using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class AuditProgramModel
    {
        public string id { get; set; }
        public string q_id { get; set; }
        public string stageid { get; set; }
        public string stagename { get; set; }
        public string nod { get; set; }
        public string frmdt { get; set; }
        public string todt { get; set; }
        public string remark { get; set; }
        public string condition { get; set; }
    }

    public class AssignAuditorModel
    {
        public string id { get; set; }
        public string aprogramid { get; set; }
        public string auditorid { get; set; }
        public string auditornm { get; set; }
        public string auitor_type { get; set; }
        public string condition { get; set; }

    }
}
