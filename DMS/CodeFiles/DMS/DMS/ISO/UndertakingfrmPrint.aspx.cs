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
    public partial class UndertakingfrmPrint : System.Web.UI.Page
    {
        AuditProgramBL oAuditProgramBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuditProgramBL = new AuditProgramBL();

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["p"]))
                        hfPid.Value = Request.QueryString["p"];
                    BindControl();
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
                AuditProgramModel ap = new AuditProgramModel();
                ap.id = hfPid.Value;
                ap.condition = "Undertaking";
                DataTable dt = oAuditProgramBL.GetALLAuditProgram(ap);
                if (dt != null && dt.Rows.Count > 0)
                {
                    lbname.Text = dt.Rows[0]["auditornm"].ToString();
                    lblName.Text = dt.Rows[0]["auditornm"].ToString();
                    lblClientName.Text = dt.Rows[0]["custname"].ToString();
                    lblReviewDate.Text = dt.Rows[0]["created_on"].ToString();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }

    }
}