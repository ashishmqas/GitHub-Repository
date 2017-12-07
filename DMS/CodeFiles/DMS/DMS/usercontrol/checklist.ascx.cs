using BusinessLayer;
using DataLayer;
using ModelEntity.Model;
using ModelEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMS.App_Code;

namespace DMS.usercontrol
{
    public partial class checklist : System.Web.UI.UserControl
    {
        CommonBL oCommonBL = null;
        AuditReportBL oAuditReportBL = null;

        public string ProgramId { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //   oAuditReportChecklistModel = new AuditReportChecklistModel();
                oAuditReportBL = new AuditReportBL();
                oCommonBL = new CommonBL();

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
                AuditReportModel arm = new AuditReportModel();

                arm.ProgramId = this.ProgramId;

                dt = oAuditReportBL.SelectAuditReportCheckList(arm);
                if (dt == null || dt.Rows.Count == 0)
                {
                    dt = oCommonBL.GetMasterTableData("md_audit_report_checklist");
                    dt.Columns.Add("option", typeof(String));
                }
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
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
                List<AuditReportChecklistModel> list = new List<AuditReportChecklistModel>();
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    AuditReportChecklistModel arcm = new AuditReportChecklistModel();


                    HiddenField lb = (HiddenField)item.FindControl("label2");
                    if (lb != null)
                    {
                        arcm.id = Convert.ToInt32(lb.Value);
                        //do something with val
                    }
                    ////TextBox txtOption = (TextBox)item.FindControl("tbOption");
                    ////if (txtOption != null)
                    ////{
                    ////    tl.Option = Generic.SafeSqlLiteral(txtOption.Text);
                    ////    //do something with val
                    ////}
                    DropDownList dlOption = (DropDownList)item.FindControl("ddlOption");
                    if (dlOption.SelectedValue != null)
                    {
                        arcm.Option = dlOption.SelectedValue.ToString();
                        //do something with val
                    }

                    list.Add(arcm);

                }
                if (list.Count > 0)
                {
                    AuditReportModel arm = new AuditReportModel();
                    arm.ProgramId = this.ProgramId;
                    arm.Checklist = list;
                    int i = oAuditReportBL.SaveAuditorCheckList(arm);
                    if (i > 0)
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
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hf = e.Item.FindControl("hfddloption") as HiddenField;
                    DropDownList option_dropdown = e.Item.FindControl("ddlOption") as DropDownList;
                    option_dropdown.SelectedValue = hf.Value.ToString();

                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}