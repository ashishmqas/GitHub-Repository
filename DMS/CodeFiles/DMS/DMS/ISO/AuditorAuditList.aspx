<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AuditorAuditList.aspx.cs" Inherits="DMS.ISO.AuditorAuditList" %>

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
                                                        <th class="essential">Audit Stage  </th>
                                                        <th class="essential">Audit From </th>
                                                        <th class="essential">Audit To </th>
                                                        <th class="essential">No of Days </th>
                                                        <th class="essential">Action  </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="essential" style="width: 10%"><%#Eval("qid") %></td>
                                                <td class="essential" style="width: 15%"><%#Eval("custname") %></td>
                                                <td class="essential" style="width: 15%"><%#Eval("stagename") %></td>
                                                <td class="essential" style="width: 15%"><%#Eval("frm") %></td>
                                                <td class="essential" style="width: 15%"><%#Eval("to") %></td>
                                                <td class="essential" style="width: 10%"><%#Eval("nod") %></td>
                                                <td class="essential" style="width: 20%">
                                                    <a target="_blank" href="AuditFinding.aspx?api=<%#Eval("pid") %>">Audit Finding </a>
                                                    |&nbsp;<a target="_blank" href="AuditReport.aspx?q=<%#Eval("qid") %>&api=<%#Eval("pid") %>">Audit Report </a>
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
