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

namespace DMS
{
    public partial class Roles : System.Web.UI.Page
    {
        AuthorizationBL oAuthorizationBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuthorizationBL = new AuthorizationBL();
                if(!IsPostBack)
                {
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
                AccessControlModel ac = new AccessControlModel();
                ac.Condition = "UserRoles";
                ac.Userid = ((SessionManager)Session["SessionManager"]).Email;

                ddlRole.DataSource = oAuthorizationBL.AsignRoleSelectStatement(ac);
                ddlRole.DataTextField = "description";
                ddlRole.DataValueField = "id";
                ddlRole.DataBind();
                ddlRole.Items.Insert(0, new ListItem("Select", ""));
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
                ((SessionManager)Session["SessionManager"]).Role = ddlRole.SelectedValue;
                switch ((GenericCls.roles)Enum.Parse(typeof(GenericCls.roles), ddlRole.SelectedValue.ToString()))
                {
                    case GenericCls.roles.Admin:
                        Response.Redirect("./Admin/RolesRights.aspx", false);
                        break;
                    case GenericCls.roles.LeadAuditor:
                        Response.Redirect("./ISO/QuotationRequestList.aspx", false);
                        break;
                    case GenericCls.roles.Auditor:
                   // case GenericCls.roles.Observer:
                   // case GenericCls.roles.Trainee:
                        Response.Redirect("./ISO/AuditorAuditList.aspx", false);
                        break;
                    default:
                        break;
                }
               
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}