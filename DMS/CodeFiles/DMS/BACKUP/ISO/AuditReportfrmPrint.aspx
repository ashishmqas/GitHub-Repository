<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditReportfrmPrint.aspx.cs" Inherits="DMS.ISO.AuditReportfrmPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfQid" runat="server" />
        <asp:HiddenField ID="hfP" runat="server" />
        <table style="width: 100%">
            <tr>
                <td>
                    <h3 style="color: cadetblue">1.	Organization Details</h3>
                </td>
            </tr>
        </table>
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="background-color: #E5E7E9; border-bottom: solid 1px; padding: 5px;"><span style="font-size: 20px">Company</span>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 5px;">
                    <asp:Label ID="tbCName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 5px;">
                    <asp:Label ID="tbStreet" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
                    <h3 style="color: cadetblue">2.	Certification Scope</h3>
                </td>
            </tr>
        </table>
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Scope of Certification
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Repeater ID="rpt_scope" runat="server">

                        <ItemTemplate>
                            <strong><%#Eval("description") %></strong><br />
                            <%#Eval("Scope") %><br />
                            <br />
                        </ItemTemplate>

                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Applicable Standard (s)
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Repeater ID="rpt_applicable" runat="server">

                        <ItemTemplate>
                            <%#Eval("description") %><br />
                            <br />
                        </ItemTemplate>

                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Statutory and Regulatory requirements
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbStatutory" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Audit Objectives
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">To review and evaluate the:<br />
                    <asp:Repeater ID="rpt_objective" runat="server">

                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%#Eval("description") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Exclusions claimed and accepted
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbExclusions" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">References (e.g. Statement of applicability with its version number)

                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbRef" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Number of Sites

                </td>
                <td style="width: 30%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;">
                    <asp:Label ID="tbSite" runat="server"></asp:Label>
                </td>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Number of Employees
                </td>
                <td style="width: 30%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;">
                    <asp:Label ID="tbEMPStrength" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Type of audit
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbAudit" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Dates of audit
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbAuditDt" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Sponsor
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbSponsor" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Management Representative
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbMR" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Lead Auditor Name
                </td>
                <td style="width: 80%; border-bottom: solid 1px; border-right: solid 1px; padding: 5px;" colspan="3">
                    <asp:Label ID="tbLead" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
                    <h3 style="color: cadetblue">3.	Sites under Scope</h3>
                </td>
            </tr>
        </table>
        <asp:Repeater ID="rpt_Site" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <tr>
                        <th style="width: 15%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Site</th>
                        <th style="width: 30%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Address</th>
                        <th style="width: 15%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Number of Employees</th>
                        <th style="width: 15%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Number of Shifts</th>
                        <th style="width: 15%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Impacted number of Employees*</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="border-bottom: solid 1px; border-right: solid 1px;"><%#Container.ItemIndex+1 %>
                 </td>
                    <td style="border-bottom: solid 1px; border-right: solid 1px;"><%#Eval("siteaddress") %>
                      </td>
                    <td style="border-bottom: solid 1px; border-right: solid 1px;"><%#Eval("empstrength") %>
                       </td>
                    <td style="border-bottom: solid 1px; border-right: solid 1px;">
                       </td>
                    <td style="border-bottom: solid 1px; border-right: solid 1px;"><%#Eval("empstrength") %>
                        </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        * Number of employees who are monitoring and controlling management system
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">4.	Summary of Audit Findings</h3>
                </td>
            </tr>
            <tr>
                <td style="width: 5%"></td>
                <td>
                    <h3 style="color: cadetblue">4.1.	Strengths - 
                        <asp:Label ID="tbStrengths" runat="server"></asp:Label></h3>

                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Repeater ID="rpt_Strengths" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%#Eval("description") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <h3 style="color: cadetblue">4.2	Non Conformities – Major –
                        <asp:Label ID="tbMajor" runat="server"></asp:Label></h3>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Repeater ID="rpt_Major" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%#Eval("description") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <h3 style="color: cadetblue">4.2	Non Conformities – Minor –
                        <asp:Label ID="tbMinor" runat="server"></asp:Label></h3>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Repeater ID="rpt_Minor" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%#Eval("description") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <h3 style="color: cadetblue">4.3 Observations - 
                        <asp:Label ID="tbObservations" runat="server"></asp:Label></h3>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Repeater ID="rpt_Observations" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%#Eval("description") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <h3 style="color: cadetblue">4.4 Opportunities for Improvement  -
                        <asp:Label ID="tbImprovement" runat="server"></asp:Label></h3>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Repeater ID="rpt_Improvement" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%#Eval("description") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <h3 style="color: cadetblue">4.5 How reliable is client Internal Audit program and Management Review</h3>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="tbReview" runat="server"></asp:Label></td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">5.	Measurements</h3>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; width: 50%; padding: 5px; background-color: #E5E7E9;">Number of Non conformities (Category 1: Major) 
                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; text-align: left; width: 50%; padding: 5px;">
                    <asp:Label ID="tbMajor1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Number of Non conformities (Category 2: Minor) 
                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; text-align: left; padding: 5px;">
                    <asp:Label ID="tbMinor1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Total Number of Non conformities:
                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; text-align: left; padding: 5px;">
                    <asp:Label ID="Label3" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Total Number of Observations:
                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; text-align: left; padding: 5px;">
                    <asp:Label ID="tbObservations1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Number of Improvement Opportunities:
                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; text-align: left; padding: 5px;">
                    <asp:Label ID="tbImprovement1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Number of Strengths:
                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; text-align: left; padding: 5px;">
                    <asp:Label ID="tbStrengths1" runat="server"></asp:Label></td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3>Auditor Time (Days)</h3>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; width: 50%; padding: 5px; background-color: #E5E7E9;">Audit Planning                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; width: 50%; padding: 5px;">
                    <asp:Label ID="tbAuditPlaning" runat="server"></asp:Label>
                    person day (Offshore)</td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">Onsite Audit                 </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px;">
                    <asp:Label ID="tbOnsite" runat="server"></asp:Label>
                    person day (Onsite)</td>
            </tr>
            <tr>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px; background-color: #E5E7E9;">TOTAL Time (Days)                </td>
                <td style="border-bottom: solid 1px; border-right: solid 1px; padding: 5px;">
                    <asp:Label ID="tbDays" runat="server"></asp:Label>
                    person day</td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">6.	Auditor Statements</h3>
                </td>
            </tr>
        </table>
        <br />
        <asp:Repeater ID="rpt_statement" runat="server">
            <HeaderTemplate>
                <table border="0" style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th style="width: 10%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">SN</th>
                            <th style="width: 70%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Auditor Statement</th>
                            <th style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Status</th>
                            <%--  <th class="essential">Remarks </th>--%>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>

                <tr>
                    <td style="width: 10%; border-bottom: solid 1px; border-right: solid 1px; text-align: center;"><%#Container.ItemIndex+1 %></td>
                    <td style="width: 70%; border-bottom: solid 1px; border-right: solid 1px;"><%#Eval("description") %>
                                      
                    </td>
                    <td style="width: 20%; border-bottom: solid 1px; border-right: solid 1px; text-align: center;">
                        <%#Eval("option") %>
                                     
                    </td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                            </table>
            </FooterTemplate>
        </asp:Repeater>
          <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">Conclusion/Next steps</h3>
                </td>
                <td colspan="2">
                    <p>The  audit  team  recommends  (provided  the  effectiveness  of  corrections  and/or  corrective  actions addressing the identified nonconformities has been verified):</p>
                </td>
            </tr>
        </table>
        <br />
        <asp:Repeater ID="rpt_Next" runat="server">
            <HeaderTemplate>
               <table border="0" style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th style="width: 30%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Yes/No</th>
                            <th style="width: 70%; border-bottom: solid 1px; border-right: solid 1px; background-color: #E5E7E9;">Auditor Statement</th>
                         
                            <%--  <th class="essential">Remarks </th>--%>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                 <tr>
                    <td style="width: 30%; border-bottom: solid 1px; border-right: solid 1px; text-align: center;"><%#Eval("description") %></td>
                    <td style="width: 70%; border-bottom: solid 1px; border-right: solid 1px;"><%#Eval("description") %>
                                      
                    </td>                 

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">7.	Confidentiality statement</h3>
                </td>
                <td colspan="2">
                    <p style=" text-align: justify;">This document and its contents, including any notes taken during the audit shall be treated as strictly confidential.  The contents cannot be distributed to any third party without written consent of the client, except as required by the accreditation bodies.</p>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">8.	Distribution List</h3>
                </td>
                <td colspan="2">
                    <p style=" text-align: justify;">TThis report will be provided to contact person as communicated by the organization as softcopy or hard copy as agreed and to MQAS Technical Review team as per MQAS process. An electronic copy will be kept in MQAS server.</p>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <h3 style="color: cadetblue">9.	Attachments</h3>
                </td>
                <td colspan="2">
                   <ul>
                       <li>Audit Program</li>
                       <li>List of Findings</li>
                   </ul>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
