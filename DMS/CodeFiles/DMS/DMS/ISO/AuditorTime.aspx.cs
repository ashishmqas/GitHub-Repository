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
    public partial class AuditorTime : BaseCls
    {

        AuditorTimeBL oAuditorTimeBL = null;
        GenericCls oGenericCls = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuditorTimeBL = new AuditorTimeBL();

                oGenericCls = new GenericCls();

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["api"]))
                    {
                        hfapi.Value = Request.QueryString["api"].ToString();

                        AuditorTimeModel at = new AuditorTimeModel();
                        at.Condition = "ShowById";
                        at.Audit_Program_Id = hfapi.Value;
                        DataTable dt = oAuditorTimeBL.GetAuditorTime(at);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                           
                            tbAuditPlanning.Text = dt.Rows[0]["AuditPlanning"].ToString();
                            tbOnsiteAudit.Text = dt.Rows[0]["OnsiteAudit"].ToString();
                            btnSave.Text = "Update";
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
                //AuditorTimeModel at = new AuditorTimeModel();
                //at.Condition = "ShowAll";
                //at.Audit_Program_Id = hfapi.Value;
                //DataTable dt = oAuditorTimeBL.GetAuditorTime(at);
                //rptAuditFindingDtls.DataSource = dt;
                //rptAuditFindingDtls.DataBind();
                //if (dt != null && dt.Rows.Count > 0)
                //{
                //    btnSave.Enabled = false;
                //}
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
                AuditorTimeModel at = new AuditorTimeModel();
                
                at.Audit_Program_Id = hfapi.Value;
                at.AuditPlanning = tbAuditPlanning.Text.Trim();
                at.OnsiteAudit = tbOnsiteAudit.Text.Trim();
                at.Condition = btnSave.Text;

                int i = oAuditorTimeBL.SaveAuditorTime(at);
                if (i == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + Config.insertNotificationmsg + "','success');", true);
                    // ClearText();
                    // BindRepeator();
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
    }
}