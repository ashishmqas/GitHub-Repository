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
    public partial class AuditReport : System.Web.UI.Page
    {
        AuditReportBL oAuditReportBL = null;
        GenericCls oGenericCls = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuditReportBL = new AuditReportBL();
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

                        AuditReportModel arm = new AuditReportModel();
                        arm.Condition = "ShowById";
                        arm.Id = Convert.ToInt32(hfid.Value);
                        DataTable dt = oAuditReportBL.GetAuditReport(arm);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            hfid.Value = dt.Rows[0]["id"].ToString();
                            tbStatutoryRegulatoryRequirement.Text = dt.Rows[0]["Statutoryregulatoryrequirement"].ToString();
                            tbExclusionClaimedandAccept.Text = dt.Rows[0]["Exclusionsclaimedandaccepted"].ToString();
                            tbReferences.Text = dt.Rows[0]["Reference"].ToString();
                            tbClientInternalAuditProgramandManagement.Text = dt.Rows[0]["Internalauditprogramandmanagementreview"].ToString();

                            btnSave.Text = "Update";
                        }
                    }
                    BindRepeator();

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
                AuditReportModel arm = new AuditReportModel();
                arm.Condition = "ShowAll";
                arm.ProgramId = hfapi.Value;
                rptAuditFindingDtls.DataSource = oAuditReportBL.GetAuditReport(arm);
                rptAuditFindingDtls.DataBind();
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
                AuditReportModel arm = new AuditReportModel();
                if (hfid.Value != "")
                    arm.Id = Convert.ToInt32(hfid.Value);
                arm.ProgramId = hfapi.Value;
                arm.Statutoryregulatoryrequirement = tbStatutoryRegulatoryRequirement.Text.Trim();
                arm.Exclusionsclaimedandaccepted = tbExclusionClaimedandAccept.Text.Trim();
                arm.Reference = tbReferences.Text.Trim();
                arm.Internalauditprogramandmanagementreview = tbClientInternalAuditProgramandManagement.Text.Trim();
                arm.Condition = btnSave.Text;

                int i = oAuditReportBL.SaveAuditReport(arm);
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