using BusinessLayer;
using DMS.App_Code;
using ModelEntity;
using ModelEntity.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMS.ISO
{
    public partial class ApplicationReviewChecklist : System.Web.UI.Page
    {
        CommonBL oCommonBL = null;
        GenericCls oGenericCls = null;
        ApplicationReviewChecklistBL oApplicationReviewChecklistBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oCommonBL = new CommonBL();
                oGenericCls = new GenericCls();
                oApplicationReviewChecklistBL = new ApplicationReviewChecklistBL();
              
                if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                {
                    hfid.Value = Request.QueryString["q"];
                    
                }
               
                if (!IsPostBack)
                {
                    BindControl();
                    ApplicationReviewChecklistModel ar = new ApplicationReviewChecklistModel();
                    ar.QuotationID = hfid.Value;
                    ar.Condition = "Quotation";
                    DataTable dt = oApplicationReviewChecklistBL.GetCompanyDetail(ar);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        tbCompany.Text = dt.Rows[0][0].ToString();
                        tbReceiveDate.Text = dt.Rows[0][1].ToString();
                    }
                     ar.Condition = "ReviewHearder";
                     dt = oApplicationReviewChecklistBL.GetCompanyDetail(ar);
                     if (dt != null && dt.Rows.Count > 0)
                     {
                         ddlNACE.SetValue((dt.Rows[0]["nacecode"].ToString()).Split(',').ToList());
                         tbReviewedBy.Text = dt.Rows[0]["reviewed_by"].ToString();
                         tbReceiveDate.Text = dt.Rows[0]["review_date"].ToString();
                         tbReviewDate.Text = dt.Rows[0]["received_date"].ToString();
                         tbGoNoGo.Text = dt.Rows[0]["gonogo"].ToString();
                         tbReason.Text = dt.Rows[0]["reason"].ToString();                         
                     }
                }
                
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        private void BindControl()
        {
            try
            {
                ddlNACE.DataSource = oCommonBL.GetMasterTableData("md_nace_code");
                ApplicationReviewChecklistModel ar = new ApplicationReviewChecklistModel();
                ar.QuotationID = hfid.Value;
                ar.Condition = "Checklist";
               DataTable dt = oApplicationReviewChecklistBL.GetCompanyDetail(ar);
               if (dt == null && dt.Rows.Count == 0)
               {
                   dt=oCommonBL.GetMasterTableData("md_app_review_chklst");
                   dt.Columns.Add("remark", typeof(String));
                   rpt_checklist.DataSource =dt ;
               }
               else 
               
                   rpt_checklist.DataSource = dt;
                   rpt_checklist.DataBind();
               
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        private List<ReviewChecklist> GetChecklist()
        {
            List<ReviewChecklist> lst = new List<ReviewChecklist>();
            try
            {
                foreach (RepeaterItem item in rpt_checklist.Items)
                {
                    ReviewChecklist obj = new ReviewChecklist();

                    HiddenField lb = (HiddenField)item.FindControl("label2");
                    TextBox tb = (TextBox)item.FindControl("tbRemark");
                    if (lb != null)
                    {
                        obj.ID = Convert.ToInt32(lb.Value);
                        obj.Remarks = tb.Text;
                        lst.Add(obj);
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ApplicationReviewChecklistModel ar = new ApplicationReviewChecklistModel();
                ar.QuotationID = hfid.Value;
                ar.NACECode = String.Join(",", ddlNACE.GetValue());
                ar.ReviewedBy = tbReviewedBy.Text;
                ar.ReviewDate = oGenericCls.ConvertToMMDDYYYY(tbReviewDate.Text);
                ar.ReceivingDate = oGenericCls.ConvertToMMDDYYYY(tbReceiveDate.Text);
                ar.GoNoGo = tbGoNoGo.Text;
                ar.Reason = tbReason.Text;
                ar.CompanyName = tbCompany.Text;
                ar.checklist = GetChecklist();
                int i = oApplicationReviewChecklistBL.Save(ar);
                if (i > 0)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + App_Code.Config.insertNotificationmsg + "','success');", true);

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}