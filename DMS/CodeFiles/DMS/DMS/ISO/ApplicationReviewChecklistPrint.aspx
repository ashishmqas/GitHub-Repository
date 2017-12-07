<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationReviewChecklistPrint.aspx.cs" Inherits="DMS.ISO.ApplicationReviewChecklistPrint" %>

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
                    <h2 style="text-align: center"><strong>MQAS </strong>Application Review Checklist</h2>
                </td>
            </tr>
        </table>
        <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Company Name:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:HiddenField ID="hfid" runat="server" />
                    <asp:Label ID="tbCompany" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">NACE Codes / Technical Areas</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="ddlNACE" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Application Reviewed By:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbReviewedBy" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">Date of Receiving the Application:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbReceiveDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Decision (Go/ No Go):</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbGoNoGo" runat="server"></asp:Label></td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">Date of Review of the Application:</td>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;">
                    <asp:Label ID="tbReviewDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 25%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">Reasons for decision (If no Go):</td>
                <td style="width: 75%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse;" colspan="3">
                    <asp:Label ID="tbReason" runat="server"></asp:Label></td>

            </tr>
        </table>
        <br />
        <br />
        <asp:Repeater ID="rpt_checklist" runat="server">
            <HeaderTemplate>
                <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th style="width: 10%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">SN</th>
                            <th style="width: 50%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Check Points</th>
                            <th style="width: 40%; border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;">Remarks (Yes/No/NA) Give comments if No or NA</th>

                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>

                <tr>
                    <td style="border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;"><%#Container.ItemIndex+1 %></td>
                    <td style="border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;"><%#Eval("description") %>         
                    </td>
                    <td style="border: solid 1px; border-top: 1px; border-right: 1px; padding: 5px; border-collapse: collapse; vertical-align: top;"><%#Eval("remark") %>                            
                    </td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                            </table>
            </FooterTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
