using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BusinessLayer;
using System.Collections.Generic;
using ModelEntity;
using System.Reflection;
namespace DMS.usercontrol
{
    public partial class multiselect : System.Web.UI.UserControl
    {
        private DataTable dt = new DataTable();
        CommonBL objCommonBL = null;
        public DataTable DataSource { get; set; }
        private List<string> SelectedValue { get; set; }
        public List<string> GetValue()
        {
            List<string> ls = new List<string>();
            try
            {
                foreach (ListItem item in lstEmp.Items)
                {
                    if (item.Selected)
                        ls.Add(item.Value);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ls;
        }

        public void SetValue(List<string> ls)
        {
            this.SelectedValue = ls;

        }

        //public void Bind()
        //{
        //    if (this.DataSource == null)
        //        this.DataSource = CommonBL.GetEmployeeList();
        //    else
        //        lstEmp.DataSource = this.DataSource;
        //    lstEmp.DataTextField = "name";
        //    lstEmp.DataValueField = "employeeid";
        //    lstEmp.DataBind();
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                objCommonBL = new CommonBL();
                if (!IsPostBack)
                {
                    //if (this.DataSource == null)
                    //    lstEmp.DataSource = objCommonBL.GetEmployeeList();
                    //else
                    lstEmp.DataSource = this.DataSource;
                    lstEmp.DataTextField = "description";
                    lstEmp.DataValueField = "id";
                    lstEmp.DataBind();
                }
                if (this.SelectedValue != null)
                {
                    foreach (string item in this.SelectedValue)
                    {
                        for (int i = 0; i < lstEmp.Items.Count; i++)
                        {
                            if (lstEmp.Items[i].Value == item)
                            {
                                lstEmp.Items[i].Selected = true;
                                break;
                            }
                        }
                    }
                }

                if (this.DataSource == null)
                {
                    lstEmp.DataSource = this.DataSource;
                    lstEmp.DataTextField = "description";
                    lstEmp.DataValueField = "id";
                    lstEmp.DataBind();
                }

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        public void BindSkill()
        {

            try
            {
                if (this.DataSource != null)
                {
                    lstEmp.DataSource = this.DataSource;
                    lstEmp.DataTextField = "id";
                    lstEmp.DataValueField = "description";
                    lstEmp.DataBind();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);

            }
        }

    }
}