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
    public partial class QuotationRequestfrm : System.Web.UI.Page
    {
        CommonBL oCommonBL = null;
        QuotationRequestBL oQuotationRequestBL = null;
        GenericCls oGenericCls = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oCommonBL = new CommonBL();
                oQuotationRequestBL = new QuotationRequestBL();
                oGenericCls = new GenericCls();
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                    {
                        BindRepetor();
                        hfQid.Value = Request.QueryString["q"];
                        BindRepetorValue(hfQid.Value);
                        SetCompany();
                    }
                    else
                        BindRepetor();
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        private void SetCompany()
        {
            try
            {
                DataTable dt = oQuotationRequestBL.SelectData("QuotationForm", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbCName.Text = dt.Rows[0]["custname"].ToString();
                    tbMR.Text = dt.Rows[0]["mr"].ToString();
                    tbStreet.Text = dt.Rows[0]["street"].ToString();
                    tbPhone.Text = dt.Rows[0]["phone"].ToString();
                    tbZip.Text = dt.Rows[0]["zip"].ToString();
                    tbEmail.Text = dt.Rows[0]["email"].ToString();
                    tbWebsite.Text = dt.Rows[0]["website"].ToString();
                    tbFax.Text = dt.Rows[0]["fax"].ToString();
                    tbBrchAddr.Text = dt.Rows[0]["branch"].ToString();
                    tbIndustry.Text = dt.Rows[0]["industry"].ToString();
                    ddlCountry.SelectedValue = dt.Rows[0]["country"].ToString();
                    tbOtherInfo.Text = dt.Rows[0]["otherinfo"].ToString();

                    tbDate.Text = dt.Rows[0]["date"].ToString();
                    tbPlace.Text = dt.Rows[0]["place"].ToString();
                    tbName.Text = dt.Rows[0]["name"].ToString();
                }
                dt = oQuotationRequestBL.SelectData("ScopeDetails", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        switch ((GenericCls.ISOType)Enum.Parse(typeof(GenericCls.ISOType), dt.Rows[i]["audit_type"].ToString().ToString()))
                        {
                            case GenericCls.ISOType.ISO9001:
                                ddl9001.SelectedValue = dt.Rows[i]["c_status"].ToString();
                                tbScopeCer9001.Text = dt.Rows[i]["scope"].ToString();
                                tbAddress9001.Text = dt.Rows[i]["siteaddress"].ToString();
                                tbWorkPerform9001.Text = dt.Rows[i]["workdesc"].ToString();
                                tbEMPStrength9001.Text = dt.Rows[i]["empstrength"].ToString();
                                tbManagerial9001.Text = dt.Rows[i]["managerial"].ToString();
                                tbTechnical9001.Text = dt.Rows[i]["technical"].ToString();
                                tbIT9001.Text = dt.Rows[i]["it"].ToString();
                                tbBusiness9001.Text = dt.Rows[i]["business"].ToString();
                                tbAdministration9001.Text = dt.Rows[i]["admin"].ToString();
                                tbHR9001.Text = dt.Rows[i]["hr"].ToString();
                                tbFinance9001.Text = dt.Rows[i]["finance"].ToString();
                                tbOther9001.Text = dt.Rows[i]["other"].ToString();
                                tbactivities9001.Text = dt.Rows[i]["offsite"].ToString();

                                break;
                            case GenericCls.ISOType.ISO27001:
                                ddl27001.SelectedValue = dt.Rows[i]["c_status"].ToString();
                                tbScopeCer27001.Text = dt.Rows[i]["scope"].ToString();
                                tbAddress27001.Text = dt.Rows[i]["siteaddress"].ToString();
                                tbWorkPerform27001.Text = dt.Rows[i]["workdesc"].ToString();
                                tbEMPStrength27001.Text = dt.Rows[i]["empstrength"].ToString();
                                tbManagerial27001.Text = dt.Rows[i]["managerial"].ToString();
                                tbTechnical27001.Text = dt.Rows[i]["technical"].ToString();
                                tbIT27001.Text = dt.Rows[i]["it"].ToString();
                                tbBusiness27001.Text = dt.Rows[i]["business"].ToString();
                                tbAdministration27001.Text = dt.Rows[i]["admin"].ToString();
                                tbHR27001.Text = dt.Rows[i]["hr"].ToString();
                                tbFinance27001.Text = dt.Rows[i]["finance"].ToString();
                                tbOther27001.Text = dt.Rows[i]["other"].ToString();
                                tbactivities27001.Text = dt.Rows[i]["offsite"].ToString();
                                break;
                            case GenericCls.ISOType.ISO20000:
                                ddl20000.SelectedValue = dt.Rows[i]["c_status"].ToString();
                                tbScopeCer20000.Text = dt.Rows[i]["scope"].ToString();
                                tbAddress20000.Text = dt.Rows[i]["siteaddress"].ToString();
                                tbWorkPerform20000.Text = dt.Rows[i]["workdesc"].ToString();
                                tbEMPStrength20000.Text = dt.Rows[i]["empstrength"].ToString();
                                tbManagerial20000.Text = dt.Rows[i]["managerial"].ToString();
                                tbTechnical20000.Text = dt.Rows[i]["technical"].ToString();
                                tbIT20000.Text = dt.Rows[i]["it"].ToString();
                                tbBusiness20000.Text = dt.Rows[i]["business"].ToString();
                                tbAdministration20000.Text = dt.Rows[i]["admin"].ToString();
                                tbHR20000.Text = dt.Rows[i]["hr"].ToString();
                                tbFinance20000.Text = dt.Rows[i]["finance"].ToString();
                                tbOther20000.Text = dt.Rows[i]["other"].ToString();
                                tbactivities20000.Text = dt.Rows[i]["offsite"].ToString();
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        private void BindRepetorValue(string p)
        {
            try
            {
                DataTable dt = oQuotationRequestBL.SelectData("CompanyDetail", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (Control item in rptCompDtls.Items)
                    {
                        TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                        HiddenField hf = (HiddenField)item.FindControl("hdId");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (hf.Value == dt.Rows[i]["id"].ToString())
                            {
                                txt.Text = dt.Rows[i]["data"].ToString();
                                break;
                            }
                        }
                    }
                }

                dt = oQuotationRequestBL.SelectData("ISOQuestion20000", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (Control item in rptISO20000.Items)
                    {
                        TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                        HiddenField hf = (HiddenField)item.FindControl("hdId");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (hf.Value == dt.Rows[i]["id"].ToString())
                            {
                                txt.Text = dt.Rows[i]["data"].ToString();
                                break;
                            }
                        }
                    }
                }

                dt = oQuotationRequestBL.SelectData("ISOQuestion27001", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (Control item in rptISO27001.Items)
                    {
                        TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                        HiddenField hf = (HiddenField)item.FindControl("hdId");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (hf.Value == dt.Rows[i]["id"].ToString())
                            {
                                txt.Text = dt.Rows[i]["data"].ToString();
                                break;
                            }
                        }
                    }
                }

                dt = oQuotationRequestBL.SelectData("ISOQuestion9001", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (Control item in rptISO9001.Items)
                    {
                        TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                        HiddenField hf = (HiddenField)item.FindControl("hdId");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (hf.Value == dt.Rows[i]["id"].ToString())
                            {
                                txt.Text = dt.Rows[i]["data"].ToString();
                                break;
                            }
                        }
                    }
                }

                dt = oQuotationRequestBL.SelectData("Complexcity", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (Control item in rptComplexity.Items)
                    {
                        TextBox txt = (TextBox)item.FindControl("tbResponse");
                        TextBox txt1 = (TextBox)item.FindControl("tbSupporting");
                        HiddenField hf = (HiddenField)item.FindControl("hdId");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (hf.Value == dt.Rows[i]["id"].ToString())
                            {
                                txt.Text = dt.Rows[i]["response"].ToString();
                                txt1.Text = dt.Rows[i]["support"].ToString();
                                break;
                            }
                        }
                    }
                }

                dt = oQuotationRequestBL.SelectData("Scope", hfQid.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (Control item in rpt_scope.Items)
                    {
                        CheckBox chk = (CheckBox)item.FindControl("chkAudit");
                        CheckBox chk1 = (CheckBox)item.FindControl("chkAlready");
                        TextBox txt = (TextBox)item.FindControl("tbCertified");
                        HiddenField hf = (HiddenField)item.FindControl("hdId");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (hf.Value == dt.Rows[i]["id"].ToString())
                            {
                                txt.Text = dt.Rows[i]["Certified"].ToString();
                                chk.Checked = true;
                                chk1.Checked = (Convert.ToBoolean(dt.Rows[i]["already"]) ? true : false);
                                break;
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        private void BindRepetor()
        {
            try
            {

                rptCompDtls.DataSource = oCommonBL.GetMasterTableData("md_company_details");
                rptCompDtls.DataBind();

                rptISO20000.DataSource = oCommonBL.GetMasterTableData("md_question_ISO_20000");
                rptISO20000.DataBind();

                rptISO27001.DataSource = oCommonBL.GetMasterTableData("md_question_ISO_27001");
                rptISO27001.DataBind();

                rptISO9001.DataSource = oCommonBL.GetMasterTableData("md_question_ISO_9001");
                rptISO9001.DataBind();

                rptComplexity.DataSource = oCommonBL.GetMasterTableData("md_question_overall_complexity");
                rptComplexity.DataBind();

                rpt_scope.DataSource = oQuotationRequestBL.SelectData("AuditSubType");
                rpt_scope.DataBind();




                ddlCountry.DataSource = oCommonBL.GetMasterTableData("md_country");
                ddlCountry.DataTextField = "description";
                ddlCountry.DataValueField = "id";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("Select", ""));

                ddl9001.DataSource = oCommonBL.GetMasterTableData("md_certificate_status");
                ddl9001.DataTextField = "description";
                ddl9001.DataValueField = "id";
                ddl9001.DataBind();
                ddl9001.Items.Insert(0, new ListItem("Select", ""));

                ddl27001.DataSource = oCommonBL.GetMasterTableData("md_certificate_status");
                ddl27001.DataTextField = "description";
                ddl27001.DataValueField = "id";
                ddl27001.DataBind();
                ddl27001.Items.Insert(0, new ListItem("Select", ""));

                ddl20000.DataSource = oCommonBL.GetMasterTableData("md_certificate_status");
                ddl20000.DataTextField = "description";
                ddl20000.DataValueField = "id";
                ddl20000.DataBind();
                ddl20000.Items.Insert(0, new ListItem("Select", ""));
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }



        #region GetRepeator Values
        private List<CompanyDeatils> GetCompanyDeatils()
        {
            List<CompanyDeatils> lst = new List<CompanyDeatils>();
            try
            {
                foreach (Control item in rptCompDtls.Items)
                {
                    CompanyDeatils obj = new CompanyDeatils();
                    TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                    HiddenField hf = (HiddenField)item.FindControl("hdId");
                    Label lbl = (Label)item.FindControl("lbCaption");
                    obj.Value = txt.Text;
                    obj.Caption = lbl.Text;
                    obj.id = hf.Value;
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        private List<QuestionISO27001> GetQuestionISO27001()
        {
            List<QuestionISO27001> lst = new List<QuestionISO27001>();
            try
            {
                foreach (Control item in rptISO27001.Items)
                {
                    QuestionISO27001 obj = new QuestionISO27001();
                    TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                    HiddenField hf = (HiddenField)item.FindControl("hdId");
                    Label lbl = (Label)item.FindControl("lbCaption");
                    obj.Value = txt.Text;
                    obj.Caption = lbl.Text;
                    obj.id = hf.Value;
                    obj.AuditType = Convert.ToInt32(GenericCls.ISOType.ISO27001).ToString();
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        private List<QuestionISO20000> GetQuestionISO20000()
        {
            List<QuestionISO20000> lst = new List<QuestionISO20000>();
            try
            {
                foreach (Control item in rptISO20000.Items)
                {
                    QuestionISO20000 obj = new QuestionISO20000();
                    TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                    HiddenField hf = (HiddenField)item.FindControl("hdId");
                    Label lbl = (Label)item.FindControl("lbCaption");
                    obj.Value = txt.Text;
                    obj.Caption = lbl.Text;
                    obj.id = hf.Value;
                    obj.AuditType = Convert.ToInt32(GenericCls.ISOType.ISO20000).ToString();
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        private List<QuestionISO9001> GetQuestionISO9001()
        {
            List<QuestionISO9001> lst = new List<QuestionISO9001>();
            try
            {
                foreach (Control item in rptISO9001.Items)
                {
                    QuestionISO9001 obj = new QuestionISO9001();
                    TextBox txt = (TextBox)item.FindControl("tbCompdtl");
                    HiddenField hf = (HiddenField)item.FindControl("hdId");
                    Label lbl = (Label)item.FindControl("lbCaption");
                    obj.Value = txt.Text;
                    obj.Caption = lbl.Text;
                    obj.AuditType = Convert.ToInt32(GenericCls.ISOType.ISO9001).ToString();
                    obj.id = hf.Value;
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        private List<QuestionOverallComplexity> GetQuestionOverallComplexity()
        {
            List<QuestionOverallComplexity> lst = new List<QuestionOverallComplexity>();
            try
            {
                foreach (Control item in rptComplexity.Items)
                {
                    QuestionOverallComplexity obj = new QuestionOverallComplexity();
                    TextBox txt = (TextBox)item.FindControl("tbResponse");
                    TextBox txts = (TextBox)item.FindControl("tbSupporting");
                    HiddenField hf = (HiddenField)item.FindControl("hdId");
                    Label lbl = (Label)item.FindControl("lbCaption");
                    obj.Response = txt.Text;
                    obj.Support = txts.Text;
                    obj.Caption = lbl.Text;
                    obj.id = hf.Value;
                    lst.Add(obj);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        private List<Scope> GetScope()
        {
            List<Scope> lst = new List<Scope>();
            try
            {
                foreach (Control item in rpt_scope.Items)
                {
                    Scope obj = new Scope();
                    CheckBox chk = (CheckBox)item.FindControl("chkAudit");
                    CheckBox chk1 = (CheckBox)item.FindControl("chkAlready");
                    TextBox txt = (TextBox)item.FindControl("tbCertified");
                    HiddenField hf = (HiddenField)item.FindControl("hdId");
                    Label lbl = (Label)item.FindControl("lbCaption");
                    if (chk.Checked)
                    {
                        obj.Certified = txt.Text;
                        obj.Caption = chk.Text;
                        obj.id = hf.Value;
                        obj.Already = (chk1.Checked ? 1 : 0);
                        lst.Add(obj);
                    }
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        private List<DetailedScope> GetDetailedScope()
        {
            List<DetailedScope> lst = new List<DetailedScope>();
            try
            {
                DetailedScope oDetailedScope = new DetailedScope();

                oDetailedScope.audit_type = Convert.ToInt32(GenericCls.ISOType.ISO9001).ToString();
                oDetailedScope.c_status = ddl9001.SelectedValue;
                oDetailedScope.scope = tbScopeCer9001.Text;
                oDetailedScope.siteaddress = tbAddress9001.Text;
                oDetailedScope.workdesc = tbWorkPerform9001.Text;
                oDetailedScope.empstrength = tbEMPStrength9001.Text;
                oDetailedScope.managerial = tbManagerial9001.Text;
                oDetailedScope.technical = tbTechnical9001.Text;
                oDetailedScope.it = tbIT9001.Text;
                oDetailedScope.business = tbBusiness9001.Text;
                oDetailedScope.admin = tbAdministration9001.Text;
                oDetailedScope.hr = tbHR9001.Text;
                oDetailedScope.finance = tbFinance9001.Text;
                oDetailedScope.other = tbOther9001.Text;
                oDetailedScope.offsite = tbactivities9001.Text;

                lst.Add(oDetailedScope);

                oDetailedScope = new DetailedScope();

                oDetailedScope.audit_type = Convert.ToInt32(GenericCls.ISOType.ISO27001).ToString();
                oDetailedScope.c_status = ddl27001.SelectedValue;
                oDetailedScope.scope = tbScopeCer27001.Text;
                oDetailedScope.siteaddress = tbAddress27001.Text;
                oDetailedScope.workdesc = tbWorkPerform27001.Text;
                oDetailedScope.empstrength = tbEMPStrength27001.Text;
                oDetailedScope.managerial = tbManagerial27001.Text;
                oDetailedScope.technical = tbTechnical27001.Text;
                oDetailedScope.it = tbIT27001.Text;
                oDetailedScope.business = tbBusiness27001.Text;
                oDetailedScope.admin = tbAdministration27001.Text;
                oDetailedScope.hr = tbHR27001.Text;
                oDetailedScope.finance = tbFinance27001.Text;
                oDetailedScope.other = tbOther27001.Text;
                oDetailedScope.offsite = tbactivities27001.Text;

                lst.Add(oDetailedScope);

                oDetailedScope = new DetailedScope();
                oDetailedScope.audit_type = Convert.ToInt32(GenericCls.ISOType.ISO20000).ToString();
                oDetailedScope.c_status = ddl20000.SelectedValue;
                oDetailedScope.scope = tbScopeCer20000.Text;
                oDetailedScope.siteaddress = tbAddress20000.Text;
                oDetailedScope.workdesc = tbWorkPerform20000.Text;
                oDetailedScope.empstrength = tbEMPStrength20000.Text;
                oDetailedScope.managerial = tbManagerial20000.Text;
                oDetailedScope.technical = tbTechnical20000.Text;
                oDetailedScope.it = tbIT20000.Text;
                oDetailedScope.business = tbBusiness20000.Text;
                oDetailedScope.admin = tbAdministration20000.Text;
                oDetailedScope.hr = tbHR20000.Text;
                oDetailedScope.finance = tbFinance20000.Text;
                oDetailedScope.other = tbOther20000.Text;
                oDetailedScope.offsite = tbactivities20000.Text;

                lst.Add(oDetailedScope);
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return lst;
        }

        #endregion

        protected void btnBaseline_Click(object sender, EventArgs e)
        {
            try
            {
                GetCompanyDeatils();
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                QuotationRequestModel qrm = new QuotationRequestModel();
                if (hfQid.Value != "")
                    qrm.Id = hfQid.Value;
                qrm.CompanyName = tbCName.Text;
                qrm.MR = tbMR.Text;
                qrm.Street = tbStreet.Text;
                qrm.Phone = tbPhone.Text;
                qrm.Zip = tbZip.Text;
                qrm.Email = tbEmail.Text;
                qrm.Website = tbWebsite.Text;
                qrm.Fax = tbFax.Text;
                qrm.Branch = tbBrchAddr.Text;
                qrm.Industry = tbIndustry.Text;
                qrm.Country = ddlCountry.SelectedValue;
                qrm.OtherInfo = tbOtherInfo.Text;
                qrm.sponsor = tbSponsor.Text;
                qrm.Date = oGenericCls.ConvertToMMDDYYYY(tbDate.Text);
                qrm.Place = tbPlace.Text;
                qrm.PersonName = tbName.Text;
                qrm.Scope = GetScope();
                qrm.DetailedScope = GetDetailedScope();
                qrm.CompanyDeatils = GetCompanyDeatils();
                qrm.QuestionISO27001 = GetQuestionISO27001();
                qrm.QuestionISO20000 = GetQuestionISO20000();
                qrm.QuestionISO9001 = GetQuestionISO9001();
                qrm.QuestionOverallComplexity = GetQuestionOverallComplexity();
                oQuotationRequestBL.SaveQuotationRequestForm(qrm);
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}