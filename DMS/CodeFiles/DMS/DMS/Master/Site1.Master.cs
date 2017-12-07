using BusinessLayer;
using ModelEntity;
using QMSViews.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMS.Master
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MenuBL objMenuBL = new MenuBL();
                if (((SessionManager)Session["SessionManager"]).Email == null)
                    Response.Redirect("~/default.aspx", false);
                if (((SessionManager)Session["SessionManager"]).Role != null && ((SessionManager)Session["SessionManager"]).Role != "")
                {
                    List<MenuModel> list = objMenuBL.GetMenuModelList(null, ((SessionManager)Session["SessionManager"]).Role);
                    phMenu.Controls.Add(MenuHelper.GetMasterMenu(list));
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        protected void lnk_signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
            HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);

            Response.RedirectPermanent("~/default.aspx", false);
        }
    }
}