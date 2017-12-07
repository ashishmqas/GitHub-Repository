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
    public partial class AuditReportfrmPrint : System.Web.UI.Page
    {
        CommonBL oCommonBL = null;
        QuotationRequestBL oQuotationRequestBL = null;
        GenericCls oGenericCls = null;
        AuditFindingBL oAuditFindingBL = null;
        AuditReportBL oAuditReportBL = null;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                oCommonBL = new CommonBL();
                oQuotationRequestBL = new QuotationRequestBL();
                oGenericCls = new GenericCls();
                oAuditFindingBL = new AuditFindingBL();
                oAuditReportBL = new AuditReportBL();
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                        hfQid.Value = Request.QueryString["q"];
                    if (!string.IsNullOrEmpty(Request.QueryString["p"]))
                        hfP.Value = Request.QueryString["p"];
                    //BindRepetor();

                    //BindRepetorValue(hfQid.Value);
                    SetCompany();
                    GetAuditScope();
                    GetAuditFinding();
                    BindAuditStatement();

                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        private void GetAuditScope()
        {
            try
            {
                AuditFindingModel af = new AuditFindingModel();
                af.audit_program_id = hfP.Value;
                DataTable dt = oAuditFindingBL.GetAuditFinding(af, "AuditReport");
                if(dt!=null && dt.Rows.Count>0)
                {
                    tbCName.Text = dt.Rows[0]["custname"].ToString();                  
                    tbStreet.Text = dt.Rows[0]["street"].ToString();
                    tbStatutory.Text = dt.Rows[0]["statutoryregulatoryrequirement"].ToString();
                    tbExclusions.Text = dt.Rows[0]["exclusionsclaimedandaccepted"].ToString();
                    tbRef.Text = dt.Rows[0]["reference"].ToString();
                    tbAudit.Text = dt.Rows[0]["stagename"].ToString();
                    tbAuditDt.Text = dt.Rows[0]["AuditDate"].ToString();
                    tbAuditPlaning.Text = dt.Rows[0]["auditplanning"].ToString();
                    tbOnsite.Text = dt.Rows[0]["onsiteaudit"].ToString();
                    tbDays.Text = Math.Round(Convert.ToSingle(tbAuditPlaning.Text) + Convert.ToSingle(tbOnsite.Text), 1).ToString();
                    tbReview.Text = dt.Rows[0]["internalauditprogramandmanagementreview"].ToString();
                    tbSponsor.Text = dt.Rows[0]["sponsor"].ToString();
                    tbMR.Text = dt.Rows[0]["mr"].ToString();
                    string[] ar = dt.Rows[0]["auditornm"].ToString().Split(' ');
                    tbLead.Text = ar[0]+ " "+ar[1];
                }
            }
            catch (Exception ex)
            {
              GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
        private void BindAuditStatement()
        {
            try
            {
                 DataTable dt = null;
                AuditReportModel arm = new AuditReportModel();

                arm.ProgramId = hfP.Value;

                dt = oAuditReportBL.SelectAuditReportCheckList(arm);
                if (dt == null || dt.Rows.Count == 0)
                {
                    dt = oCommonBL.GetMasterTableData("md_audit_report_checklist");
                    dt.Columns.Add("option", typeof(String));
                }
                rpt_statement.DataSource = dt;
                rpt_statement.DataBind();

                dt = oCommonBL.GetMasterTableData("md_audit_objective");
              rpt_objective.DataSource = dt;
              rpt_objective.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        private void GetAuditFinding()
        {
            try
            {


                AuditFindingModel af = new AuditFindingModel();
                af.audit_program_id = hfP.Value;
                af.type_id = Convert.ToInt32(GenericCls.FindingType.Strength).ToString();//Strength
                DataTable dt = oAuditFindingBL.GetAuditFinding(af,"Finding");
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbStrengths1.Text = tbStrengths.Text = dt.Rows.Count.ToString();
                    rpt_Strengths.DataSource = dt;
                    rpt_Strengths.DataBind();
                }
                else
                    tbStrengths1.Text = tbStrengths.Text = "0";

                af = new AuditFindingModel();
                af.audit_program_id = hfP.Value;
                af.type_id = Convert.ToInt32(GenericCls.FindingType.Major).ToString();//Major
                dt = oAuditFindingBL.GetAuditFinding(af, "Finding");
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbMajor1.Text = tbMajor.Text = dt.Rows.Count.ToString();
                    rpt_Major.DataSource = dt;
                    rpt_Major.DataBind();
                }
                else
                    tbMajor1.Text = tbMajor.Text = "0";

                af = new AuditFindingModel();
                af.audit_program_id = hfP.Value;
                af.type_id = Convert.ToInt32(GenericCls.FindingType.Minor).ToString();//Minor
                dt = oAuditFindingBL.GetAuditFinding(af, "Finding");
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbMinor1.Text = tbMinor.Text = dt.Rows.Count.ToString();
                    rpt_Minor.DataSource = dt;
                    rpt_Minor.DataBind();
                }
                else
                    tbMinor1.Text = tbMinor.Text = "0";

                af = new AuditFindingModel();
                af.audit_program_id = hfP.Value;
                af.type_id = Convert.ToInt32(GenericCls.FindingType.Observation).ToString();//Observation
                dt = oAuditFindingBL.GetAuditFinding(af, "Finding");
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbObservations1.Text = tbObservations.Text = dt.Rows.Count.ToString();
                    rpt_Observations.DataSource = dt;
                    rpt_Observations.DataBind();
                }
                else
                    tbObservations1.Text = tbObservations.Text = "0";

                af = new AuditFindingModel();
                af.audit_program_id = hfP.Value;
                af.type_id = Convert.ToInt32(GenericCls.FindingType.Opportunity_for_Improvement).ToString();//Opportunity for Improvement
                dt = oAuditFindingBL.GetAuditFinding(af, "Finding");
                if (dt != null && dt.Rows.Count > 0)
                {
                    tbImprovement1.Text = tbImprovement.Text = dt.Rows.Count.ToString();
                    rpt_Improvement.DataSource = dt;
                    rpt_Improvement.DataBind();
                }
                else
                    tbImprovement1.Text = tbImprovement.Text = "0";
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
                //DataTable dt = oQuotationRequestBL.SelectData("QuotationForm", hfQid.Value);
                //if (dt != null && dt.Rows.Count > 0)
                //{
                //    tbCName.Text = dt.Rows[0]["custname"].ToString();
                //    //  tbMR.Text = dt.Rows[0]["mr"].ToString();
                //    tbStreet.Text = dt.Rows[0]["street"].ToString();
                //    //tbPhone.Text = dt.Rows[0]["phone"].ToString();
                //    //tbZip.Text = dt.Rows[0]["zip"].ToString();
                //    //tbEmail.Text = dt.Rows[0]["email"].ToString();
                //    //tbWebsite.Text = dt.Rows[0]["website"].ToString();
                //    //tbFax.Text = dt.Rows[0]["fax"].ToString();
                //    //tbBrchAddr.Text = dt.Rows[0]["branch"].ToString();
                //    //tbIndustry.Text = dt.Rows[0]["industry"].ToString();
                //    //  ddlCountry.SelectedValue = dt.Rows[0]["country"].ToString();
                //    //tbOtherInfo.Text = dt.Rows[0]["otherinfo"].ToString();

                //    //tbDate.Text = dt.Rows[0]["condate"].ToString();
                //    //tbPlace.Text = dt.Rows[0]["place"].ToString();
                //    //tbName.Text = dt.Rows[0]["name"].ToString();
                //}
                DataTable dt = oQuotationRequestBL.SelectData("ScopeForAuditReport", hfQid.Value);
                rpt_scope.DataSource = dt;
                rpt_scope.DataBind();
                rpt_applicable.DataSource = dt;
                rpt_applicable.DataBind();

                DataTable dtSiteDetails = oQuotationRequestBL.SelectData("SiteDetails", hfQid.Value);
                if(dtSiteDetails!=null && dtSiteDetails.Rows.Count>0)
                {
                    rpt_Site.DataSource = dtSiteDetails;
                    rpt_Site.DataBind();
                    tbSite.Text = dtSiteDetails.Rows.Count.ToString();
                    int tot = 0;
                    for (int i = 0; i < dtSiteDetails.Rows.Count; i++)
                    {
                        tot += Convert.ToInt32(dtSiteDetails.Rows[i]["empstrength"]);
                    }
                    tbEMPStrength.Text = tot.ToString(); ;
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }
    }
}