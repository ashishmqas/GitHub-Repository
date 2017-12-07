<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationRequestfrmPrint.aspx.cs" Inherits="DMS.ISO.QuotationRequestfrmPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td colspan="4">
                    <h2 style="text-align: center"><strong>MQAS</strong> Management System Certification Quotation Request Form</h2>
                </td>
            </tr>
        </table>
     
       
        <table style="width: 100%">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">1.	Details about the Company</h3>
                </td>
            </tr>
        </table>
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Company Name:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:HiddenField ID="hfQid" runat="server" />
                    <asp:Label ID="tbCName" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">MR</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbMR" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Street:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbStreet" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">Phone:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbPhone" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">ZIP, Place:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbZip" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">Email:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbEmail" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Website:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbWebsite" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">Fax:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbFax" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Branch Address (s):</td>
                <td style="width: 75%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;" colspan="3">
                    <asp:Label ID="tbBrchAddr" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Industry / activities:</td>
                <td style="width: 75%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;" colspan="3">
                    <asp:Label ID="tbIndustry" runat="server"></asp:Label></td>
            </tr>
        </table>
        <br />



        <asp:Repeater ID="rptCompDtls" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="width: 30%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">

                        <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                    </td>
                    <td style="width: 70%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                        <asp:Label ID="tbCompdtl" runat="server" ClientIDMode="Static"></asp:Label></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                    </table>
            </FooterTemplate>
        </asp:Repeater>

      


        <table style="width: 100%">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">2.	Scope of Service</h3>
                </td>
            </tr>
        </table>
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Please indicate the standard against which the certification is required?
                </td>
                <td colspan="3" style="width: 75%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                    <asp:Repeater ID="rpt_scope" runat="server">
                        <HeaderTemplate>
                            <table style="width: 100%">
                                <thead>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="width: 35%">
                                    <label for="fname_a">
                                        <asp:CheckBox ID="chkAudit" runat="server" Text='<%#Eval("description") %>' />
                                        <%-- <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>--%>
                                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                </td>
                                <td style="width: 35%">
                                    <asp:CheckBox ID="chkAlready" runat="server" Text="&nbsp;&nbsp;If already certified" /></td>
                                <td style="width: 40%">
                                    <label for="fname_a">Certified by:</label>
                                    <asp:Label ID="tbCertified" runat="server" ClientIDMode="Static"></asp:Label></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                    </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;"></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">ISO 9001:2015</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">ISO 27001:2013</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">ISO 20000:2011</td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">If already certified, then current state of the certificate</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="ddl9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="ddl27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="ddl20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Scope of certification</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbScopeCer9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbScopeCer27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbScopeCer20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Address of the locations to be assessed</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbAddress9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbAddress27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbAddress20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Description of work performed (Services or Products)</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbWorkPerform9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbWorkPerform27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbWorkPerform20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Employee Strength</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbEMPStrength9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbEMPStrength27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbEMPStrength20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Breakup of strength:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;"></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;"></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;"></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">a)	Managerial</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbManagerial9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbManagerial27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbManagerial20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">b)	Technical/Production</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbTechnical9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbTechnical27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbTechnical20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">c)	IT and Procurement</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbIT9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbIT27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbIT20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">d)	Business Dev</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbBusiness9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbBusiness27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbBusiness20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">e)	Administration</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbAdministration9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbAdministration27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbAdministration20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">f)	HR</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbHR9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbHR27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbHR20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">g)	Finance</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbFinance9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbFinance27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbFinance20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">g)	Other</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbOther9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbOther27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbOther20000" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Describe if there are any offsite or outsourced activities</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbactivities9001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbactivities27001" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; text-align: center;">
                    <asp:Label ID="tbactivities20000" runat="server"></asp:Label></td>
            </tr>
        </table>

        <table style="width: 100%">
            <tr>
                <td style="font-size:smaller">
                    *Note: Append any additional useful literature about your products and services, such as promotional material
                    <br /><br />
                   Please fill the box/boxes given as no 3, 4 and 5 relevant to your certification requirement.(I.e., please provide information in box 3 for ISO27001:2013, box 4 for ISO 20000:2011 and box 5 for ISO9001:2008)
                </td>
            </tr>
            
           
        </table>

        <table style="width: 100%;">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">3.	Questions pertaining to ISO 27001:2013</h3>
                </td>
            </tr>
        </table>
        <asp:Repeater ID="rptISO27001" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="width: 30%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">

                        <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                    </td>
                    <td style="width: 70%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                        <asp:Label ID="tbCompdtl" runat="server" ClientIDMode="Static"></asp:Label></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                    </table>
            </FooterTemplate>
        </asp:Repeater>


        <table style="width: 100%;">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">4.	Questions pertaining to ISO 20000:2011</h3>
                </td>
            </tr>
        </table>
        <asp:Repeater ID="rptISO20000" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="width: 30%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">

                        <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                    </td>
                    <td style="width: 70%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                        <asp:Label ID="tbCompdtl" runat="server" ClientIDMode="Static"></asp:Label></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                    </table>
            </FooterTemplate>
        </asp:Repeater>

    

        <table style="width: 100%;">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">5.	Questions pertaining to ISO 9001:2015</h3>
                </td>
            </tr>
        </table>
        <asp:Repeater ID="rptISO9001" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="width: 30%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">

                        <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                    </td>
                    <td style="width: 70%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                        <asp:Label ID="tbCompdtl" runat="server" ClientIDMode="Static"></asp:Label></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                    </table>
            </FooterTemplate>
        </asp:Repeater>
     

        <table style="width: 100%;">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">6.	Questions to Ascertain Overall Complexity</h3>
                </td>
            </tr>
        </table>
        <asp:Repeater ID="rptComplexity" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th style="width: 35%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; ">Question</th>
                            <th style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; ">Response (Low, Medium, High) </th>
                            <th style="width: 40%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top; ">Supporting Information for the Response </th>

                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="width: 35%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">

                        <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                    </td>
                    <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                        <asp:Label ID="tbResponse" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:Label></td>
                    <td style="width: 40%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">
                        <asp:Label ID="tbSupporting" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:Label></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                    </table>
            </FooterTemplate>
        </asp:Repeater>
        <table style="width: 100%;">
            <tr>
                <td colspan="4">
                    <h3 style="color: cadetblue">7.	Any Other Information</h3>
                </td>
            </tr>
        </table>
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td colspan="4">
                    <asp:Label ID="tbOtherInfo" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table style="width: 100%;">
            <tr>
                <td style="width: 25%"><strong>Date</strong></td>
                <td colspan="3" style="width: 25%">
                    <asp:Label ID="tbDate" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:Label></td>

            </tr>
            <tr>
                <td style="width: 25%"><strong>Place</strong></td>
                <td style="width: 25%">
                    <asp:Label ID="tbPlace" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:Label></td>
                <td style="width: 25%"></td>
                <td style="width: 25%">
                    <asp:Label ID="tbName" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:Label></td>
            </tr>
        </table>
        <br />
        <br />
        <table style="width: 100%; ">
            <tr>
                <td style="padding-left:20px;">Please mail the questionnaire to : <span style="color: blue; text-decoration: underline">ashok@mqasglobal.com</span>
                    <br />
                    <br />
                    OR post on following address:
                    <br />
                     <br />
                    Maverick Quality Advisory Services Pvt Ltd<br />
                    123, Radhey Shyam Park, P.O. Sahibabad<br />
                    Distt.-Ghaziabad, 201005, U.P. India

                   
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
