<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImpartialityChecklistfrmPrint.aspx.cs" Inherits="DMS.ISO.ImpartialityChecklistfrmPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfQid" runat="server" />
            <table style="width: 100%">
                <tr>
                    <td colspan="4">
                        <h2 style="text-align: center"><strong>Impartiality Review for Client Checklist</strong></h2>
                    </td>
                </tr>
            </table>
            <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                <tr>
                    <td style="width: 15%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <label for="fname_a"><b>Client Name :</b></label></td>
                    <td style="width: 35%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse; text-align: left;">
                        <asp:Label ID="lbClientName" runat="server"></asp:Label></td>
                    <td style="width: 15%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <label for="fname_a"><b>Relevant Standard :</b></label></td>
                    <td style="width: 35%; text-align: left; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <asp:Label ID="lbRelStandard" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 15%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <label for="fname_a"><b>Enquiry/Request Date:</b></label></td>
                    <td style="width: 35%; text-align: left; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <asp:Label ID="lbEntryDate" runat="server"></asp:Label></td>
                    <td style="width: 15%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <label for="fname_a"><b>Review Date:</b></label></td>
                    <td style="width: 35%; text-align: left; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <asp:Label ID="lbReviewDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 15%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <label for="fname_a"><b>Reviewed By :</b></label></td>
                    <td style="width: 35%; text-align: left; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <asp:Label ID="lbReviewedBy" runat="server"></asp:Label></td>
                    <td style="width: 15%; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <label for="fname_a"><b>Approved By :</b></label></td>
                    <td style="width: 35%; text-align: left; border: solid 1px; border-top: 1px; border-left: 1px; padding: 5px; border-collapse: collapse;">
                        <asp:Label ID="lblApprover" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            <table style="width: 100%; border: solid 1px; border-collapse: collapse;">
                <tr>
                    <td style="width: 100%; border: solid 1px; border-collapse: collapse;">
                        <asp:Repeater ID="rpt_clientchcklist" runat="server">
                            <HeaderTemplate>
                                <table border="1" style="border-collapse: collapse; width: 100%" class="display mobile_dt2" id="content_table">
                                    <thead>
                                        <tr style="background: #808080">
                                            <th class="essential" style="border-collapse: collapse; border: 1px solid;">SNo</th>
                                            <th class="essential" style="border-collapse: collapse; border: 1px solid;">Check Point</th>
                                            <th class="essential" style="border-collapse: collapse; border: 1px solid;">Remarks </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <tr>
                                    <td class="essential" style="border-collapse: collapse; border: 1px solid;"><%#Eval("sqno") %></td>
                                    <td class="essential" style="border-collapse: collapse; border: 1px solid;"><%#Eval("checkpoint") %>
                                       
                                    </td>
                                    <td class="essential" style="border-collapse: collapse; border: 1px solid;">
                                        <%# Eval("remarks") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>

                </tr>
            </table>
        </div>
    </form>
</body>
</html>
