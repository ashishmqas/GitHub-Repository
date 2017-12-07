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
    public partial class ApplicationReviewChecklistPrint : System.Web.UI.Page
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
                        ddlNACE.Text = dt.Rows[0]["nacecode"].ToString();
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

                ApplicationReviewChecklistModel ar = new ApplicationReviewChecklistModel();
                ar.QuotationID = hfid.Value;
                ar.Condition = "Checklist";
                DataTable dt = oApplicationReviewChecklistBL.GetCompanyDetail(ar);
                rpt_checklist.DataSource = dt;
                rpt_checklist.DataBind();

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}