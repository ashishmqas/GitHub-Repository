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
    public partial class AuditProgram : System.Web.UI.Page
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
                    if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                        hfQid.Value = Request.QueryString["q"];
                    if (!string.IsNullOrEmpty(Request.QueryString["i"]))
                    {
                        AuditProgramModel ap = new AuditProgramModel();
                        ap.condition = "SingleAuditProgram";
                        ap.id = hfid.Value = Request.QueryString["i"];
                        DataTable dt = oAuditProgramBL.GetALLAuditProgram(ap);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            ddlStage.SelectedValue = dt.Rows[0]["stageid"].ToString();
                            tbNumber.Text = dt.Rows[0]["nod"].ToString();
                            tbFrm.Text = dt.Rows[0]["frm"].ToString();
                            tbTo.Text = dt.Rows[0]["to"].ToString();
                            tbRemarks.Text = dt.Rows[0]["remark"].ToString();
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
                AuditProgramModel ap = new AuditProgramModel();
                ap.condition = "AllAuditProgram";
                ap.q_id = hfQid.Value;
                rpt_list.DataSource = oAuditProgramBL.GetALLAuditProgram(ap);
                rpt_list.DataBind();
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

                ddlStage.DataSource = oCommonBL.GetMasterTableData("md_audit_stage");
                ddlStage.DataTextField = "description";
                ddlStage.DataValueField = "id";
                ddlStage.DataBind();
                ddlStage.Items.Insert(0, new ListItem("Select", ""));
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
                AuditProgramModel ap = new AuditProgramModel();
                if (hfid.Value != "")
                    ap.id = hfid.Value;
                ap.q_id = hfQid.Value;
                ap.stageid = ddlStage.SelectedValue;
                ap.stagename = ddlStage.SelectedItem.Text;
                ap.nod = tbNumber.Text;
                ap.frmdt = oGenericCls.ConvertToMMDDYYYY(tbFrm.Text);
                ap.todt = oGenericCls.ConvertToMMDDYYYY(tbTo.Text);
                ap.remark = tbRemarks.Text;
                ap.condition = btnSave.Text;
                int i = oAuditProgramBL.SaveAuditProgram(ap);
                if (i == 1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.existNotificationmsg + "','info');", true);
                else if (i == 2)
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
                ListBox lbox;
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

                //// Control c = ctl.Controls;
                //QMS_Automation.usercontrol.multiselect userctl = (QMS_Automation.usercontrol.multiselect)ctl.FindControl("ddlresource");

                //if (userctl != null)
                //{
                //    // User Control
                //    lbox = (ListBox)userctl.FindControl("lstEmp");
                //    if (lbox != null)
                //    {
                //        for (int i = 0; i < lbox.Items.Count; i++)
                //        {
                //            if (lbox.Items[i].Selected)
                //            {
                //                lbox.Items[i].Selected = false;
                //            }
                //        }
                //    }
                //}
                ////  hlDetail.Visible = false;
                //tbSubtask.Text = "";
                //ddlTask.SelectedIndex = 0;
                //dvTaskStatus.Visible = false;
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }

        protected void ddlStage_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}