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
    public partial class AssigAuditor : BaseCls
    {
        AuditProgramBL oAuditProgramBL = null;
        CommonBL oCommonBL = null;
        GenericCls oGenericCls = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuditProgramBL = new AuditProgramBL();
                oCommonBL = new CommonBL();
                oGenericCls = new GenericCls();
              
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["i"]))
                        hfId.Value = Request.QueryString["i"];
                    if (!string.IsNullOrEmpty(Request.QueryString["p"]))
                        hfPid.Value = Request.QueryString["p"];
                    if (!string.IsNullOrEmpty(Request.QueryString["d"]))
                    {
                        AssignAuditorModel aa = new AssignAuditorModel();

                        aa.id = Request.QueryString["d"];

                        aa.condition = "Delete";
                        int i = oAuditProgramBL.SaveAssignAuditor(aa);
                        if (i == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                        }
                    }
                    BindingControl();
                    BindRepeator();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        private void BindingControl()
        {
            try
            {
                AuditProgramModel ap = new AuditProgramModel();
                ap.condition = "AuditorList";
                ddlUser.DataSource = oAuditProgramBL.GetALLAuditProgram(ap);
                ddlUser.DataTextField = "name";
                ddlUser.DataValueField = "id";
                ddlUser.DataBind();
                ddlUser.Items.Insert(0, new ListItem("Select", ""));

                ddlAuditor.DataSource = oCommonBL.GetMasterTableData("md_auditor_type");
                ddlAuditor.DataTextField = "description";
                ddlAuditor.DataValueField = "id";
                ddlAuditor.DataBind();
                ddlAuditor.Items.Insert(0, new ListItem("Select", ""));
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
                AuditProgramModel ap = new AuditProgramModel();
                ap.condition = "AssignedAuditorList";
                ap.id = hfPid.Value;
                rpt_list.DataSource = oAuditProgramBL.GetALLAuditProgram(ap);
                rpt_list.DataBind();
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        protected void ddlAuditor_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlAuditor.SelectedValue == "1" || ddlAuditor.SelectedValue == "2")
                {
                    ddlUser.Visible = true;
                    tbName.Visible = false;
                }
                else if (ddlAuditor.SelectedValue == "3" || ddlAuditor.SelectedValue == "4")
                {
                    ddlUser.Visible = false;
                    tbName.Visible = true;
                }
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
                AssignAuditorModel aa = new AssignAuditorModel();
                //if (hfId.Value != "")
                //    aa.id = hfId.Value;
                if (ddlUser.SelectedValue != "")
                    aa.auditorid = ddlUser.SelectedValue;
                aa.aprogramid = hfPid.Value;
                aa.auditornm = (ddlUser.SelectedValue != "" ? ddlUser.SelectedItem.Text : tbName.Text);
                aa.auitor_type = ddlAuditor.SelectedValue;
                aa.condition = "Save";
                int i = oAuditProgramBL.SaveAssignAuditor(aa);
                if (i == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                    BindRepeator();
                }
                if (i == 2)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.existNotificationmsg+ "','info');", true);
                   
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}