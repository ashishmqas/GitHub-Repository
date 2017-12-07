using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class QuotationRequestModel
    {
        public string CompanyName { get; set; }
        public string MR { get; set; }
        public string Street { get; set; }
        public string Phone { get; set; }
        public string Zip { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string Fax { get; set; }
        public string Branch { get; set; }
        public string Industry { get; set; }
        public string Country { get; set; }
        public string OtherInfo { get; set; }
        public string Date { get; set; }
        public string Place { get; set; }
        public string PersonName { get; set; }
        public string sponsor { get; set; }
        public string Id { get; set; }
        public List<CompanyDeatils> CompanyDeatils { get; set; }
        public List<QuestionISO27001> QuestionISO27001 { get; set; }
        public List<QuestionISO20000> QuestionISO20000 { get; set; }
        public List<QuestionISO9001> QuestionISO9001 { get; set; }
        public List<Scope> Scope { get; set; }
        public List<DetailedScope> DetailedScope { get; set; }
        public List<QuestionOverallComplexity> QuestionOverallComplexity { get; set; }
    }

    public class CompanyDeatils
    {
        public string id { get; set; }
        public string Caption { get; set; }
        public string Value { get; set; }
    }

    public class QuestionISO27001
    {
        public string id { get; set; }
        public string AuditType { get; set; }
        public string Caption { get; set; }
        public string Value { get; set; }
    }

    public class QuestionISO20000
    {
        public string id { get; set; }
        public string AuditType { get; set; }
        public string Caption { get; set; }
        public string Value { get; set; }
    }

    public class QuestionISO9001
    {
        public string id { get; set; }
        public string AuditType { get; set; }
        public string Caption { get; set; }
        public string Value { get; set; }
    }

    public class QuestionOverallComplexity
    {
        public string id { get; set; }
        public string Caption { get; set; }
        public string Response { get; set; }
        public string Support { get; set; }
    }

    public class Scope
    {
        public string id { get; set; }
        public string Caption { get; set; }
        public int Already { get; set; }
        public string Certified { get; set; }
    }
    public class DetailedScope
    {
        public string q_id { get; set; }
        public string audit_type { get; set; }
        public string c_status { get; set; }
        public string scope { get; set; }
        public string siteaddress { get; set; }
        public string workdesc { get; set; }
        public string empstrength { get; set; }
        public string managerial { get; set; }
        public string technical { get; set; }
        public string it { get; set; }
        public string business { get; set; }
        public string admin { get; set; }
        public string hr { get; set; }
        public string finance { get; set; }
        public string other { get; set; }
        public string offsite { get; set; }
    }

    public class Impartiality_Checklist
    {
        public string quotationid { get; set; }
        public string checklistid { get; set; }
        public string yesno { get; set; }
        public string remarks { get; set; }
        public string condition { get; set; }

        public string reviewedby { get; set; }

    }
    public class Impartiality_Checklist_Model
    {
        public List<Impartiality_Checklist> lstImpartialityChecklist { get; set; }
        public string UserName { get; set; }
        public string ReviewDate { get; set; }
        public string ApproverName { get; set; }
        public string Condition { get; set; }
    }
}
