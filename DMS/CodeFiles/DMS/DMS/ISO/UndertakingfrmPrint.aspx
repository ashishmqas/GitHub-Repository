<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UndertakingfrmPrint.aspx.cs" Inherits="DMS.ISO.UndertakingfrmPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfPid" runat="server" />
        <table style="width: 100%">
            <tr>
                <td>
                    <p>
                        I,
                        <asp:Label ID="lblName" Font-Bold="true" runat="server"></asp:Label>,
                        agree to comply with MQAS Impartiality Policy. Prior to accepting auditing and/or certification 
                    assignment, I commit to disclose to MQAS wherever there is a threat to impartiality.
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>
                        I confirm that the my assignment to the audit team by MQAS for the client
                        <asp:Label ID="lblClientName" Font-Bold="true" runat="server"></asp:Label>
                         &nbsp;is in accordance with MQAS impartiality policy and does not result in conflict of interest or threat to impartiality.
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>
                        I understand that as per MQAS policies accepting or carrying out auditing and/or certification services for a given<br />
                        client organization constitutes conflict of interest and is violation of MQAS impartiality policy in case I have
                        <br />
                        provided the following services to the same client in last two years: 
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>1.	Provided Management System Consultancy services. I understand that two years means following the end of consultancy.</td>
                        </tr>
                        <tr>
                            <td>2.	Participated in decision process of management system issues.</td>
                        </tr>
                        <tr>
                            <td>3.	Participated in preparation of manuals, guides, formats and procedures.</td>
                        </tr>
                        <tr>
                            <td>4.	Provided specific and detailed advice or training on design, implementation and maintenance of
                                <br />
                                management systems subject to certification.</td>
                        </tr>
                        <tr>
                            <td>5.	Performed Internal Audits or worked in the organization on the same management system for last two
                                <br />
                                years. I understand that two years means following the completion of internal audits.</td>
                        </tr>

                    </table>
                </td>
            </tr>
            <tr>
                <td>I also understand that the following constitute conflict of interest and is violation of MQAS impartiality policy:
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>1.	Market or offer the auditing and/or certification services of MQAS where I have provided consultancy<br />
                                services.</td>
                        </tr>
                        <tr>
                            <td>2.	State or imply to the client that auditing and/or certification would be simpler, easier, faster or less<br />
                                expensive if the same are contracted to MQAS.
                            </td>
                        </tr>
                        <tr>
                            <td>3.	Accept gifts from the client organization
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><b>Signature:</b>
                </td>
            </tr>
            <tr>
                <td><b>Name:</b>
                    <asp:Label ID="lbname" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><b>Place:</b> Sahibabad</td>
            </tr>
            <tr>
                <td><b>Date:</b>
                    <asp:Label ID="lblReviewDate" runat="server"></asp:Label>
                </td>
            </tr>
        </table>




    </form>
</body>
</html>
