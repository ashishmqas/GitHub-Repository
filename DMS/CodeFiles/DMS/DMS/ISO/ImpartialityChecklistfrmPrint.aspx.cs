using BusinessLayer;
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
    public partial class ImpartialityChecklistfrmPrint : System.Web.UI.Page
    {
        QuotationRequestBL oQuotationRequestBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oQuotationRequestBL = new QuotationRequestBL();

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                        hfQid.Value = Request.QueryString["q"];
                    BindControl(hfQid.Value);
                    BindRepeater(hfQid.Value);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }

        private void BindControl(string qid)
        {
            try
            {
                DataTable dt = null;
                Impartiality_Checklist ic = new Impartiality_Checklist();
                ic.quotationid = qid;
                ic.condition = "GetImpartialityForPrint";

                dt = oQuotationRequestBL.GetImpartialityChecklist(ic);
                if (dt != null && dt.Rows.Count > 0)
                {
                    lbClientName.Text = dt.Rows[0]["custname"].ToString();
                   
                    lbEntryDate.Text = dt.Rows[0]["enquirydate"].ToString();
                    lbReviewDate.Text = dt.Rows[0]["reviewdate"].ToString();
                    lbReviewedBy.Text = dt.Rows[0]["reviewby"].ToString();
                    lblApprover.Text = dt.Rows[0]["approvedby"].ToString();
                }
                ic.condition = "GetStandardForPrint";
                dt = oQuotationRequestBL.GetImpartialityChecklist(ic);
                if (dt != null && dt.Rows.Count > 0)
                {
                    lbRelStandard.Text = dt.Rows[0]["relevant_tandard"].ToString();
                }
             
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        private void BindRepeater(string qid)
        {
            try
            {
                DataTable dt = null;
                Impartiality_Checklist ic = new Impartiality_Checklist();

                ic.quotationid = qid;
                ic.condition = "GetFromMaping";
                dt = oQuotationRequestBL.GetImpartialityChecklist(ic);
                rpt_clientchcklist.DataSource = dt;
                rpt_clientchcklist.DataBind();
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}