using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModelEntity;
using System.Reflection;
using System.Data;
using BusinessLayer;
using ModelEntity.Model;
using System.Collections;

namespace DMS.admin
{
    public partial class assignroles : System.Web.UI.Page
    {
        AuthorizationBL oAuthorizationBL = null;
        CommonBL objCommonBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuthorizationBL = new AuthorizationBL();
                objCommonBL = new CommonBL();

                //string fname = Path.GetFileName(Request.Path);
                //App_Code.Authorization.ValidatePage((DataTable)Session["dtscreen"], fname, btnSubmit);
                DataTable table = new DataTable();
                if (!IsPostBack)
                {
                    BindControls();
                    //table = EmpDetailsBL.GetRole();

                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        public void GetData(object sender, EventArgs e)
        {
            List<AccessControlModel> ls = new List<AccessControlModel>();
            int result = 0;
            //ReviewLogModel rlog = new ReviewLogModel();

            try
            {

                foreach (GridViewRow row in gdReviewComments.Rows)
                {

                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                        if (chkRole.Checked == true)
                        {
                            AccessControlModel ac = new AccessControlModel();
                            ac.Userid = ddlEmp.SelectedValue.ToString();
                            ac.Role = (row.Cells[1].FindControl("lblid") as Label).Text;
                            ls.Add(ac);
                        }
                    }
                }

                if (ls.Count > 0)
                {
                    AccessControlModel ac = new AccessControlModel();
                    ac.Userid = ddlEmp.SelectedValue;
                    ac.Condition = "DeleteRole";
                    oAuthorizationBL.SaveRole(ac);

                    foreach (AccessControlModel item in ls)
                    {
                        item.Condition = "AssignRoles";
                        result = oAuthorizationBL.SaveRole(item);
                    } 
                }

                if (result == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + App_Code.Config.insertNotificationmsg + "','success');", true);
                }
                else if (result == 2)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "showNotification('" + App_Code.Config.updateNotificationmsg + "','success');", true);
                    btnSubmit.Text = "Submit";
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);

            }
        }
        protected void gdReviewComments_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    foreach (GridViewRow row in gdReviewComments.Rows)
                    {
                        CheckBox chkRead = (row.Cells[2].FindControl("ChkRole") as CheckBox);
                        if (chkRead != null && chkRead.Checked == false)
                        {
                            chkRead.Checked = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }

        protected void RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
            }
        }
        private void BindControls()
        {
            try
            {
                AccessControlModel ac = new AccessControlModel();
                ac.Condition = "UserDetails";
                ddlEmp.DataSource = oAuthorizationBL.AsignRoleSelectStatement(ac);
                ddlEmp.DataTextField = "name";
                ddlEmp.DataValueField = "email";
                ddlEmp.DataBind();
                ddlEmp.Items.Insert(0, new ListItem(" ", ""));

                gdReviewComments.DataSource = objCommonBL.GetMasterTableData("md_role");
                gdReviewComments.DataBind();

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }
        protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetEmployeeRoles();
        }

        private void GetEmployeeRoles()
        {
            try
            {
                AccessControlModel ac = new AccessControlModel();
                ac.Condition = "UserRoles";
                ac.Userid = ddlEmp.SelectedValue;
                DataTable dt = oAuthorizationBL.AsignRoleSelectStatement(ac);

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (GridViewRow row in gdReviewComments.Rows)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {

                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                                if ((row.Cells[1].FindControl("lblid") as Label).Text == dt.Rows[i]["id"].ToString())
                                {
                                    chkRole.Checked = true;
                                    foreach (TableCell cell in row.Cells)
                                        cell.BackColor = System.Drawing.Color.Aqua;
                                    break;
                                }
                                else
                                {
                                    chkRole.Checked = false;
                                    foreach (TableCell cell in row.Cells)
                                        cell.BackColor = System.Drawing.Color.Transparent;
                                }

                            }
                        }
                    }

                }
                else
                {
                    foreach (GridViewRow row in gdReviewComments.Rows)
                    {
                        CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                        // CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                        chkRole.Checked = false;
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