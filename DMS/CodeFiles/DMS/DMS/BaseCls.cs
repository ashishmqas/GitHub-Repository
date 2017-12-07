using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS
{
    public class BaseCls:System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginDetails"] == null || ((SessionManager)Session["LoginDetails"]).Email == "")
            {
                Response.Redirect("./default.aspx", false);
                Session.Abandon();
            }
        }
    }
}