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
    public partial class AuditReport : BaseCls
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
                        hfQid.Value = Request.QueryString["q"].ToString();
                    }
                   
                    if (!string.IsNullOrEmpty(Request.QueryString["api"]))
                    {
                        AuditReportModel arm = new AuditReportModel();
                        arm.Condition = "ShowById";
                        arm.ProgramId = hfapi.Value;
                        DataTable dt = oAuditReportBL.GetAuditReport(arm);
                        if (dt != null && dt.Rows.Count > 0)
                        {

                            tbStatutoryRegulatoryRequirement.Text = dt.Rows[0]["Statutoryregulatoryrequirement"].ToString();
                            tbExclusionClaimedandAccept.Text = dt.Rows[0]["Exclusionsclaimedandaccepted"].ToString();
                            tbReferences.Text = dt.Rows[0]["Reference"].ToString();
                            tbClientInternalAuditProgramandManagement.Text = dt.Rows[0]["Internalauditprogramandmanagementreview"].ToString();

                            btnSave.Text = "Update";
                            btnSave.Enabled = true;
                        }
                        arm.Condition = "GetStageId";
                        DataTable dt1 = oAuditReportBL.GetStageId(arm);
                        if (dt1 != null && dt1.Rows.Count > 0)
                        {
                            hfstageid.Value = dt1.Rows[0][0].ToString();
                        }
                    }

                    BindRepeator();


                }
                // if baseline then disable submit button
                CommonBL oCommonBL = new CommonBL();
                if (oCommonBL.IsBaselined(hfapi.Value.ToString()))
                {
                    btnSave.Enabled = false;
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
                //arm.Condition = "ShowAll";
                arm.ProgramId = hfapi.Value;
                //DataTable dt = oAuditReportBL.GetAuditReport(arm);
                //rptAuditFindingDtls.DataSource = dt;
                //rptAuditFindingDtls.DataBind();


                // binding audit next statement
                arm.Condition = "ShowAuditNextState";
                rpt_audit_next_report.DataSource = oAuditReportBL.GetNextAuditStatement(arm);
                rpt_audit_next_report.DataBind();

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
                arm.ProgramId = hfapi.Value;
                arm.Statutoryregulatoryrequirement = tbStatutoryRegulatoryRequirement.Text.Trim();
                arm.Exclusionsclaimedandaccepted = tbExclusionClaimedandAccept.Text.Trim();
                arm.Reference = tbReferences.Text.Trim();
                arm.Internalauditprogramandmanagementreview = tbClientInternalAuditProgramandManagement.Text.Trim();
                arm.Condition = btnSave.Text;
                int i = oAuditReportBL.SaveAuditReport(arm);
                if (i == 1)
                {
                    AuditNextState oAuditNextState = null;
                    
                    foreach (RepeaterItem ri in rpt_audit_next_report.Items)
                    {
                        if (ri.ItemType == ListItemType.Item || ri.ItemType == ListItemType.AlternatingItem)
                        {
                            arm.lstAuditNextState = new List<AuditNextState>();

                            Label lbl = ri.FindControl("lblNextState") as Label;
                            HiddenField hdnid = ri.FindControl("Label2") as HiddenField;
                            DropDownList option_dropdown = ri.FindControl("ddlOption") as DropDownList;

                            oAuditNextState = new AuditNextState();
                            oAuditNextState.Id = hdnid.Value;
                            oAuditNextState.Statement = lbl.Text;
                            oAuditNextState.Val = option_dropdown.SelectedValue;
                           
                            arm.lstAuditNextState.Add(oAuditNextState);
                            if (btnSave.Text == "Save")
                            { arm.Condition = "SaveNextState"; }
                            else
                            { arm.Condition = "UpdateNextState"; }


                            oAuditReportBL.SaveAuditNextStatement(arm);
                        }
                    }
                    


                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                    
                    BindRepeator();
                    btnSave.Text = "Update";
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

        protected void btnBaseline_Click(object sender, EventArgs e)
        {
            try
            {
                AuditReportModel arm = new AuditReportModel();
                //if (hfid.Value != "")
                //    arm.Id = Convert.ToInt32(hfid.Value);
                arm.ProgramId = hfapi.Value;
                arm.Condition = "Baseline";

                int i = oAuditReportBL.SaveAuditReport(arm);
                if (i == 1)
                {
                    btnSave.Enabled = false;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                AuditProgramBL oAuditProgramBL = new AuditProgramBL();
                AuditProgramModel ap = new AuditProgramModel();
                ap.condition = "AuditNextStage";
                ap.q_id = hfapi.Value;
                ap.id = hfstageid.Value;
                DataTable dt = oAuditProgramBL.GetALLAuditProgram(ap);
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl = e.Item.FindControl("lblNextState") as Label;
                    if (dt != null && dt.Rows.Count > 0)
                        lbl.Text = lbl.Text.Replace("@stage", dt.Rows[0][0].ToString());
                    DropDownList option_dropdown = e.Item.FindControl("ddlOption") as DropDownList;
                    HiddenField hdn = e.Item.FindControl("hfddloption") as HiddenField;
                    option_dropdown.SelectedValue = hdn.Value.ToString();

                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }

}