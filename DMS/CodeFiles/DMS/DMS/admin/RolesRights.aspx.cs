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

namespace DMS.admin
{
    public partial class RolesRights : System.Web.UI.Page
    {
        AuthorizationBL oAuthorizationBL = null;
        CommonBL objCommonBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            oAuthorizationBL = new AuthorizationBL();
            objCommonBL = new CommonBL();
            //objEmpDetailsBL = new EmpDetailsBL();
            //string fname = Path.GetFileName(Request.Path);
           
            if (!IsPostBack)
            {
                try
                {
                    BindControl();
                }
                catch (Exception ex)
                {
                    GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                }
            }
        }
        private void BindControl()
        {
            try
            {
                // bind function
              

                ddlRole.DataTextField = "description";
                ddlRole.DataValueField = "id";
                ddlRole.DataSource = objCommonBL.GetMasterTableData("md_role");
                ddlRole.DataBind();
                ddlRole.Items.Insert(0, new ListItem("-Select-", ""));
                // bind grid
                DataTable table = oAuthorizationBL.GetScreenInfo("ScreenInfo");
                if (table != null && table.Rows.Count > 0)
                {
                    gdReviewComments.DataSource = table;
                    gdReviewComments.DataBind();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }
        protected void ddlFunction_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                

                BindGrid();
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        public void GetData(object sender, EventArgs e)
        {
            int result = 0;
            List<AccessControlModel> ls = new List<AccessControlModel>();

            try
            {
                foreach (GridViewRow row in gdReviewComments.Rows)
                {
                    AccessControlModel ac = new AccessControlModel();
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        
                        ac.Role = ddlRole.SelectedValue.ToString();
                        ac.ScreenId = (row.Cells[0].FindControl("screenid") as HiddenField).Value;
                        CheckBox chkRead = (row.Cells[1].FindControl("ChkRead") as CheckBox);
                        CheckBox chkWrite = (row.Cells[2].FindControl("ChkWrite") as CheckBox);
                        if (chkRead.Checked == true && chkWrite.Checked == true)
                        {
                            ac.Read = "1";
                            ac.Write = "1";
                        }
                        else if (chkRead.Checked == false && chkWrite.Checked == true)
                        {
                            ac.Read = "0";
                            ac.Write = "1";

                        }
                        else if (chkRead.Checked == true && chkWrite.Checked == false)
                        {
                            ac.Read = "1";
                            ac.Write = "0";
                        }
                        else if (chkRead.Checked == false && chkWrite.Checked == false)
                        {
                            ac.Read = "0";
                            ac.Write = "0";
                        }
                        if (ac.Read != "0" || ac.Write != "0")
                            ls.Add(ac);
                    }
                }
                if (ls.Count > 0)
                {
                    oAuthorizationBL.DeleteFunctionRole(ls[0]);
                    foreach (AccessControlModel item in ls)
                    {
                        item.Condition = "InsertRoles";
                        result = oAuthorizationBL.SaveRoleRights(item);
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

       
        protected void RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
            }
        }

        private void BindGrid()
        {
            try
            {
                if ( ddlRole.SelectedValue.ToString() == "")
                {
                    foreach (GridViewRow row in gdReviewComments.Rows)
                    {

                        // CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                        CheckBox chkRead = (row.Cells[1].FindControl("ChkRead") as CheckBox);
                        CheckBox chkWrite = (row.Cells[2].FindControl("ChkWrite") as CheckBox);

                        chkRead.Checked = false;
                        chkWrite.Checked = false;

                    }
                    return;
                }


                //AccessControlModel ac = new AccessControlModel();
                //EmpDetails emp = new EmpDetails();
                //ac.Role = ddlRole.SelectedValue;
               // ac.Function = ddlFunction.SelectedValue;

                DataTable dt = oAuthorizationBL.GetScreenInfo("RoleRights", ddlRole.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (GridViewRow row in gdReviewComments.Rows)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            // CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                            CheckBox chkRead = (row.Cells[1].FindControl("ChkRead") as CheckBox);
                            CheckBox chkWrite = (row.Cells[2].FindControl("ChkWrite") as CheckBox);
                            if ((row.Cells[0].FindControl("screenid") as HiddenField).Value == dt.Rows[i]["screenid"].ToString())
                            {
                                if (dt.Rows[i]["read"].ToString() == "1")
                                    chkRead.Checked = true;
                                else
                                    chkRead.Checked = false;
                                if (dt.Rows[i]["write"].ToString() == "1")
                                {
                                    chkWrite.Checked = true;
                                    foreach (TableCell cell in row.Cells)
                                        cell.BackColor = System.Drawing.Color.Aqua;
                                }
                                else
                                {
                                    chkWrite.Checked = false;
                                    foreach (TableCell cell in row.Cells)
                                        cell.BackColor = System.Drawing.Color.Transparent;
                                }
                                break;
                            }
                            else
                            {
                                chkRead.Checked = false;
                                chkWrite.Checked = false;
                                foreach (TableCell cell in row.Cells)
                                    cell.BackColor = System.Drawing.Color.Transparent;
                            }
                        }
                    }
                    UpdatePanel1.Update();
                }
                else
                {
                    foreach (GridViewRow row in gdReviewComments.Rows)
                    {

                        // CheckBox chkRole = (row.Cells[1].FindControl("ChkRole") as CheckBox);
                        CheckBox chkRead = (row.Cells[1].FindControl("ChkRead") as CheckBox);
                        CheckBox chkWrite = (row.Cells[2].FindControl("ChkWrite") as CheckBox);

                        chkRead.Checked = false;
                        chkWrite.Checked = false;
                        foreach (TableCell cell in row.Cells)
                            cell.BackColor = System.Drawing.Color.Transparent;
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }


        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}