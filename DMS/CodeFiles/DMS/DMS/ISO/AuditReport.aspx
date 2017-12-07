<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AuditReport.aspx.cs" Inherits="DMS.ISO.AuditReport" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $.validator.setDefaults({ ignore: ":hidden:not(select)" })

            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });

            $("#btnSave").click(function () {
                $("#tbStatutoryRegulatoryRequirement").rules("add", {
                    required: true
                });
                $("#tbExclusionClaimedandAccept").rules("add", {
                    required: true
                });
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Audit Report</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">

                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Statutory and Regulatory Requirements<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbStatutoryRegulatoryRequirement" TextMode="MultiLine" runat="server" class="input-text ttip_r large"  CssClass="tinymce expand" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Exclusions Claimed and Accepted<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbExclusionClaimedandAccept" runat="server" TextMode="MultiLine" class="input-text ttip_r large" CssClass="tinymce expand" ClientIDMode="Static"></asp:TextBox>
                    </div>

                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">References (e.g. Statement of applicability with its version number):</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbReferences" runat="server" class="input-text ttip_r large" TextMode="MultiLine" CssClass="tinymce expand" ClientIDMode="Static"></asp:TextBox>
                        <asp:HiddenField ID="hfstageid" runat="server" />
                        <asp:HiddenField ID="hfapi" runat="server" />
                        <asp:HiddenField ID="hfQid" runat="server" />
                    </div>
                    <div class="two columns">
                        <label for="fname_a">How Reliable is Client Internal Audit Program and Management Review:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbClientInternalAuditProgramandManagement" runat="server" class="input-text ttip_r large" CssClass="tinymce expand" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
                        <a class="fancybox fancybox.iframe" onclick="showpp();" href="PopAuditorReportChecklist.aspx?p=<%=hfapi.Value %>">Auditor Statements</a>
                    </div>

                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
                        <asp:Repeater ID="rpt_audit_next_report" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                            <HeaderTemplate>
                                <table border="0" class="display mobile_dt2" id="content_table">
                                    <thead>
                                        <tr>
                                            <th class="essential">SNo.</th>
                                            <th class="essential">Yes/No </th>
                                            <th class="essential">Auditor Statement</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <tr>
                                    <td><%#Container.ItemIndex+1 %></td>
                                    <td class="essential">
                                        <asp:HiddenField ID="hfddloption" Value='<%# DataBinder.Eval(Container.DataItem, "val") %>' runat="server" />
                                        <asp:DropDownList ID="ddlOption" Width="100px" runat="server" class="chzn-select">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                    <td class="essential">
                                        <asp:Label ID="lblNextState" Text='<%#Eval("auditorstatement") %>' runat="server"></asp:Label>
                                        <asp:HiddenField ID="Label2" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" />
                                    </td>


                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>


            <div class="formRow">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="button small nice blue radius" OnClick="btnSave_Click" />
                <asp:Button ID="btnBaseline" runat="server" Text="Baseline" class="button small nice blue radius" OnClick="btnBaseline_Click" />
                <a class="gh_button icon " href="AuditReportfrmPrint.aspx?q=<%=hfQid.Value %>&p=<%=hfapi.Value %>" target="_blank">Print</a>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
              <%--          <asp:Repeater ID="rptAuditFindingDtls" runat="server">
                            <HeaderTemplate>
                                <table border="0" class="display mobile_dt2" id="content_table">
                                    <thead>
                                        <tr>
                                            <th class="essential">S No.</th>
                                            <th class="essential">Statutory and Regulatory Requirements</th>
                                            <th class="essential">Exclusions Claimed and Accepted</th>
                                            <th class="essential">References </th>

                                            <th class="essential">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="essential" style="width: 5%"><%#Container.ItemIndex+1 %></td>
                                    <td class="essential" style="width: 25%"><%#Eval("statutoryregulatoryrequirement") %></td>
                                    <td class="essential" style="width: 25%"><%#Eval("exclusionsclaimedandaccepted") %></td>
                                    <td class="essential" style="width: 30%"><%#Eval("reference") %></td>

                                    <td class="essential" style="width: 15%"><a href="AuditReport.aspx?q=<%#Eval("id") %>&api=<%#Eval("audit_program_id") %>">
                                        <img src="../img/ico/pencil_gray.png" alt="" /></a></td>


                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                    </table>
                            </FooterTemplate>
                        </asp:Repeater>--%>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
