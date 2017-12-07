using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMS.Master
{
    public partial class withoutmenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


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