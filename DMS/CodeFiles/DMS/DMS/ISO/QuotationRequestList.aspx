<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="QuotationRequestList.aspx.cs" Inherits="DMS.ISO.QuotationRequestList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {

            $('#content_table').dataTable({
                "aaSorting": [[0, 'desc'], [1, 'desc']],
                "sPaginationType": "full_numbers",
                "sDom": 'C<"clear">lfrtip'

            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_c">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="box_c">
            <div class="box_c_content form_a">
                <div class="row">
                    <div class="twelve columns">

                        <div class="box_c_heading cf">
                            <div class="box_c_ico">
                                <img src="../../img/ico/icSw2/16-List.png" alt="" />
                            </div>
                            <p>Quotation Request List</p>
                        </div>
                        <div class="formRow">

                            <div class="row">
                                <div class="twelve columns">
                                    <a class="gh_button icon add" href="QuotationRequestfrm.aspx" >Add New Quotation</a>
                                </div>
                            </div>
                        </div>
                        <div class="box_c_content">
                            <asp:UpdatePanel ID="upnl" runat="server">
                                <ContentTemplate>
                                    <script>
                                        var prm = Sys.WebForms.PageRequestManager.getInstance();

                                        prm.add_endRequest(function () {
                                            $('#content_table').dataTable({
                                                "aaSorting": [[0, 'desc'], [1, 'desc']],
                                                "sPaginationType": "full_numbers",
                                                "sDom": 'C<"clear">lfrtip'

                                            });
                                        });
                                    </script>
                                    <asp:Repeater ID="rpt_list" runat="server">
                                        <HeaderTemplate>
                                            <table border="0" class="display mobile_dt2" id="content_table">
                                                <thead>
                                                    <tr>
                                                        <th class="essential">Quotation No</th>
                                                        <th class="essential">Customer</th>
                                                        <th class="essential">MR  </th>
                                                        <th class="essential">Audit Type </th>
                                                        <th class="essential">Action  </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="essential" style="width: 10%"><%#Eval("quotation_id") %></td>
                                                <td class="essential" style="width: 25%"><%#Eval("custname") %></td>
                                                <td class="essential" style="width: 25%"><%#Eval("mr") %></td>
                                                <td class="essential" style="width: 25%"><%#Eval("Audit Scope") %></td>
                                                <td class="essential" style="width: 15%">
                                                    <a  href="QuotationRequestfrm.aspx?q=<%#Eval("quotation_id") %>"><img src="../../img/ico/pencil_gray.png" alt="Edit" /></a>&nbsp;|&nbsp;
                                                    <a href="QuotationRequestfrmPrint.aspx?q=<%#Eval("quotation_id") %>">Print Quotation</a>&nbsp;|&nbsp;
                                                    <a href="AuditProgram.aspx?q=<%#Eval("quotation_id") %>">Audit Program</a>
                                                    &nbsp;|&nbsp;
                                                    <a class="fancybox fancybox.iframe" onclick="showpp();" href="PopImpartialityChecklist.aspx?q=<%#Eval("quotation_id") %>">Impartiality Checklist</a>
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                    </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
