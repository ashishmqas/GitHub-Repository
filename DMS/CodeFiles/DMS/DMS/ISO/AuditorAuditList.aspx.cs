using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModelEntity;
using BusinessLayer;
using System.Reflection;
using ModelEntity.Model;
using System.Data;

namespace DMS.ISO
{
    public partial class AuditorAuditList : BaseCls
    {

        AuditProgramBL oAuditProgramBL = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oAuditProgramBL = new AuditProgramBL();
                if (!IsPostBack)
                {
                    BindRepeator();
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
                AssignAuditorModel aa = new AssignAuditorModel();
                aa.auditorid = ((SessionManager)Session["SessionManager"]).Email;
                aa.condition = "AuditorAssignedTask";
                rpt_list.DataSource = oAuditProgramBL.AuditorAssignedTask(aa);
                rpt_list.DataBind();
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}