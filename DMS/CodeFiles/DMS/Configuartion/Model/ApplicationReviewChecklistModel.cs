using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class ApplicationReviewChecklistModel
    {
        public string QuotationID { get; set; }
        public string  CompanyName { get; set; }
        public string NACECode { get; set; }
        public string ReviewedBy { get; set; }
        public string  ReviewDate { get; set; }
        public string ReceivingDate { get; set; }
        public string GoNoGo { get; set; }
        public string  Reason { get; set; }
        public string  Condition { get; set; }
        public List<ReviewChecklist> checklist { get; set; }
    }

    public class ReviewChecklist
    {
        public int ID { get; set; }
        public string Remarks { get; set; }
    }
}
