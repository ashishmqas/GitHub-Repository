using System;
using System.Collections.Generic;
using System.Linq;
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
using DMS.UserLoginService;

namespace DMS
{
    public partial class _default : System.Web.UI.Page
    {
        UserLoginService.UserLoginClient obj = new UserLoginService.UserLoginClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }



        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                UserDetails userinfo = new UserDetails();
                userinfo.UserName = tbEmail.Text;
                userinfo.Password = tbpwd.Text;
                List<string> msg = obj.LoginUserDetails(userinfo).ToList();
                if (msg.Count == 0)
                    lbmsg.Text = "Invalid email or password.";
                else
                {
                    SessionManager sm = new SessionManager();
                    sm.Email = msg[1].ToString();
                    sm.Name = msg[0].ToString();
                    Session["SessionManager"] = sm;
                    Response.Redirect("./roles.aspx", false);
                }
                // Label3.Text = "Employee Name = " + msg.ElementAt(0) + " Employee Id = " + msg.ElementAt(1);
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}