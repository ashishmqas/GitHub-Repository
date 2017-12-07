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

namespace DMS.usercontrol
{
    public partial class clientchecklist : System.Web.UI.UserControl
    {
        CommonBL oCommonBL = null;
        QuotationRequestBL oQuotationRequestBL = null;

        public string QId { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oQuotationRequestBL = new QuotationRequestBL();
                oCommonBL = new CommonBL();

                Export.HRef = "~/ISO/ImpartialityChecklistfrmPrint.aspx?q=" + QId;
                if (!IsPostBack)
                {

                    BindTable();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        private void BindTable()
        {
            try
            {
                DataTable dt = null;
                Impartiality_Checklist ic = new Impartiality_Checklist();
                ic.quotationid = this.QId;
                ic.condition = "Getheader";
                dt = oQuotationRequestBL.GetImpartialityChecklist(ic);
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbApprover.Text = dt.Rows[0]["approvedby"].ToString();
                    tbReviewDate.Text = dt.Rows[0]["reviewdate"].ToString();
                }



                ic.condition = "GetFromMaping";
                dt = oQuotationRequestBL.GetImpartialityChecklist(ic);
                if (dt == null || dt.Rows.Count == 0)
                {
                    ic.condition = "GetFromMaster";
                    dt = oQuotationRequestBL.GetImpartialityChecklist(ic);
                }
                rpt_clientchcklist.DataSource = dt;
                rpt_clientchcklist.DataBind();
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                List<Impartiality_Checklist> list = new List<Impartiality_Checklist>();
                Impartiality_Checklist ic = null;
                foreach (RepeaterItem item in rpt_clientchcklist.Items)
                {
                    ic = new Impartiality_Checklist();

                    ic.quotationid = QId;
                    HiddenField lb = (HiddenField)item.FindControl("hdnid");
                    if (lb != null)
                    {
                        ic.checklistid = lb.Value;
                    }
                    TextBox tbRemark = (TextBox)item.FindControl("tbRemark");
                    if (tbRemark != null)
                    {
                        ic.remarks = tbRemark.Text.Trim();
                    }
                    ic.condition = btnSubmit.Text;
                   // ic.reviewedby = ((SessionManager)Session["SessionManager"]).Name.ToString();
                    list.Add(ic);

                }
                if (list.Count > 0)
                {
                    GenericCls oGenericCls = new GenericCls();
                    Impartiality_Checklist_Model icm = new Impartiality_Checklist_Model();
                    icm.lstImpartialityChecklist = list;
                    icm.UserName = ((SessionManager)Session["SessionManager"]).Name;
                    icm.ReviewDate = oGenericCls.ConvertToMMDDYYYY(tbReviewDate.Text.Trim());
                    icm.ApproverName = tbApprover.Text.Trim();
                    icm.Condition = "header";
                    int i = oQuotationRequestBL.SaveImpartialityCheckList(icm);
                    if (i > 0)
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                }

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        protected void rpt_clientchcklist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hdncheckpoint = e.Item.FindControl("hdncheckpoint") as HiddenField;
                    string strchecklist = hdncheckpoint.Value.ToString();
                    if (strchecklist.Contains(':'))
                    {
                        TextBox remark = e.Item.FindControl("tbRemark") as TextBox;
                        remark.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}