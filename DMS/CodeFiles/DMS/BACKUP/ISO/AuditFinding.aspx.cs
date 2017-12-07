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
    public partial class AuditFinding : System.Web.UI.Page
    {
        AuditFindingBL oAuditFindingBL = null;
        CommonBL oCommonBL = null;
        GenericCls oGenericCls = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuditFindingBL = new AuditFindingBL();
                oCommonBL = new CommonBL();
                oGenericCls = new GenericCls();

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["api"]))
                    {
                        hfapi.Value = Request.QueryString["api"].ToString();
                    }
                    if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                    {
                        hfid.Value = Request.QueryString["q"];

                        AuditFindingModel af = new AuditFindingModel();
                        af.condition = "ShowById";
                        af.id = Convert.ToInt32(hfid.Value);
                        DataTable dt = oAuditFindingBL.GetALLAuditFinding(af);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            hfid.Value = dt.Rows[0]["id"].ToString();
                            tbSiteLoc.Text = dt.Rows[0]["site_loc"].ToString();
                            ddlAuditor.SelectedValue = dt.Rows[0]["auditor_emailid"].ToString();
                            tbAuditeeName.Text = dt.Rows[0]["auditee_name"].ToString();
                            tbDept.Text = dt.Rows[0]["proj_name"].ToString();
                            tbISO9001.Text = dt.Rows[0]["iso_9001"].ToString();
                            tbISO27001.Text = dt.Rows[0]["iso_27001"].ToString();
                            tbISO20000.Text = dt.Rows[0]["iso_20000"].ToString();
                            ddlType.SelectedValue = dt.Rows[0]["type_id"].ToString();
                            tbDescription.Text = dt.Rows[0]["description"].ToString();
                            tbRootCause.Text = dt.Rows[0]["root_cause"].ToString();
                            tbCorrectiveAction.Text = dt.Rows[0]["corrective_action"].ToString();
                            tbPreventiveAction.Text = dt.Rows[0]["preventive_actions"].ToString();
                            tbdateForImCorrecAction.Text = dt.Rows[0]["date_implementing_corrective_action"].ToString();
                            tbVerificationdetailsofCorrectiveAction.Text = dt.Rows[0]["verification_dtl_corrective_action"].ToString();
                            tbInitialsofMQASAuditorReviewingCAproposed.Text = dt.Rows[0]["Initials_of_mqas_auditor_reviewing_ca_proposed"].ToString();
                            tbDateProposedCAAcceptedbyMQAS.Text = dt.Rows[0]["date_proposed_ca_accepted_by_mqas"].ToString();
                            tbInitialsofMQASAuditorVerifyingEffectivenessofCorrectiveAction.Text = dt.Rows[0]["initials_mqas_auditor_verify_effect_of_corrective_action"].ToString();
                            tbDateCAVerifiedbyMQAS.Text = dt.Rows[0]["date_ca_verified_by_mqas"].ToString();
                            tbMQASAuditorCommentsonCAVerification.Text = dt.Rows[0]["mqas_auditor_comments_on_ca_verification"].ToString();
                            tbDateforClosureofNonconformity.Text = dt.Rows[0]["date_for_closure_of_non_conformity"].ToString();
                            tbDate.Text = dt.Rows[0]["date"].ToString();
                            btnSave.Text = "Update";
                        }
                    }
                    BindRepeator();
                    BindControl();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        private void BindRepeator()
        {
            try
            {
                AuditFindingModel af = new AuditFindingModel();
                af.condition = "ShowAll";
                af.audit_program_id = hfapi.Value;
                rptAuditFindingDtls.DataSource = oAuditFindingBL.GetALLAuditFinding(af);
                rptAuditFindingDtls.DataBind();
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
                // bind finding type
                ddlType.DataSource = oCommonBL.GetMasterTableData("md_finding_type");
                ddlType.DataTextField = "description";
                ddlType.DataValueField = "id";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("Select", ""));

                // bind finding type

                ddlAuditor.DataSource = oAuditFindingBL.GetALLAuditor();
                ddlAuditor.DataTextField = "name";
                ddlAuditor.DataValueField = "email";
                ddlAuditor.DataBind();
                ddlAuditor.Items.Insert(0, new ListItem("Select", ""));

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                AuditFindingModel af = new AuditFindingModel();
                if (hfid.Value != "")
                    af.id = Convert.ToInt32(hfid.Value);

                af.audit_program_id = hfapi.Value;
                af.site_loc = tbSiteLoc.Text.Trim();
                af.auditor_emailid = ddlAuditor.SelectedValue;
                af.auditee_name = tbAuditeeName.Text.Trim();
                af.proj_name = tbDept.Text.Trim();
                af.iso_9001 = tbISO9001.Text.Trim();
                af.iso_27001 = tbISO27001.Text.Trim();
                af.iso_20000 = tbISO20000.Text.Trim();
                af.type_id = ddlType.SelectedValue;
                af.description = tbDescription.Text.Trim();
                af.root_cause = tbRootCause.Text.Trim();
                af.corrective_action = tbCorrectiveAction.Text.Trim();
                af.preventive_actions = tbPreventiveAction.Text.Trim();
                af.date_implementing_corrective_action = oGenericCls.ConvertToMMDDYYYY(tbdateForImCorrecAction.Text);
                af.verification_dtl_corrective_action = tbVerificationdetailsofCorrectiveAction.Text.Trim();
                af.Initials_of_mqas_auditor_reviewing_ca_proposed = tbInitialsofMQASAuditorReviewingCAproposed.Text.Trim();
                af.date_proposed_ca_accepted_by_mqas = oGenericCls.ConvertToMMDDYYYY(tbDateProposedCAAcceptedbyMQAS.Text);
                af.initials_mqas_auditor_verify_effect_of_corrective_action = tbInitialsofMQASAuditorVerifyingEffectivenessofCorrectiveAction.Text;
                af.date_ca_verified_by_mqas = oGenericCls.ConvertToMMDDYYYY(tbDateCAVerifiedbyMQAS.Text);
                af.mqas_auditor_comments_on_ca_verification = tbMQASAuditorCommentsonCAVerification.Text;
                af.date_for_closure_of_non_conformity = oGenericCls.ConvertToMMDDYYYY(tbDateforClosureofNonconformity.Text);
                af.date = oGenericCls.ConvertToMMDDYYYY(tbDate.Text);
                af.condition = btnSave.Text;

                int i = oAuditFindingBL.SaveAuditFinding(af);
                if (i == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                    ClearText();
                    BindRepeator();
                    btnSave.Text = "Save";
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        public void ClearText()
        {
            try
            {
                Control ctl = this.Master.FindControl("ContentPlaceHolder1");

                TextBox t;
                CheckBox chk;
                DropDownList ddl;
                RadioButton rbtn;
                foreach (Control c in ctl.Controls)
                {
                    if (c is TextBox)
                    {
                        t = (TextBox)c;
                        t.Text = "";
                    }
                    else if (c is CheckBox)
                    {
                        chk = (CheckBox)c;
                        chk.Checked = false;
                    }
                    else if (c is DropDownList)
                    {
                        ddl = (DropDownList)c;
                        ddl.SelectedIndex = 0;
                    }
                    else if (c is RadioButton)
                    {
                        rbtn = (RadioButton)c;
                        rbtn.Checked = false;
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