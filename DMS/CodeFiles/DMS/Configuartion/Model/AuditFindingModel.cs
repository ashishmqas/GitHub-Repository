using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class AuditFindingModel
    {
        public int id { get; set; }
        public string site_loc { get; set; }
        public string auditor_emailid { get; set; }
        public string auditee_name { get; set; }
        public string proj_name { get; set; }
        public string iso_9001 { get; set; }
        public string iso_27001 { get; set; }
        public string iso_20000 { get; set; }
        public string type_id { get; set; }
        public string description { get; set; }
        public string root_cause { get; set; }
        public string corrective_action { get; set; }
        public string preventive_actions { get; set; }
        public string date_implementing_corrective_action { get; set; }
        public string verification_dtl_corrective_action { get; set; }
        public string Initials_of_mqas_auditor_reviewing_ca_proposed { get; set; }
        public string date_proposed_ca_accepted_by_mqas { get; set; }
        public string initials_mqas_auditor_verify_effect_of_corrective_action { get; set; }
        public string date_ca_verified_by_mqas { get; set; }
        public string mqas_auditor_comments_on_ca_verification { get; set; }
        public string date_for_closure_of_non_conformity { get; set; }
        public string date { get; set; }
        public string audit_program_id { get; set; }
        public string condition { get; set; }
    }
}
