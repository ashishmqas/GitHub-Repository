<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AuditFinding.aspx.cs" Inherits="DMS.ISO.AuditFinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $("#tbdateForImCorrecAction").datepicker({ dateFormat: 'dd/mm/yy' });
            $("#tbDateProposedCAAcceptedbyMQAS").datepicker({ dateFormat: 'dd/mm/yy' });
            $("#tbDateCAVerifiedbyMQAS").datepicker({ dateFormat: 'dd/mm/yy' });
            $("#tbDateforClosureofNonconformity").datepicker({ dateFormat: 'dd/mm/yy' });
            $("#tbDate").datepicker({ dateFormat: 'dd/mm/yy' });
            $.validator.setDefaults({ ignore: ":hidden:not(select)" })

            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });

            $("#ddlAuditor").rules("add", {
                required: true
            });
            $("#tbDate").rules("add", {
                required: true
            });
            $("#ddlType").rules("add", {
                required: true
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
            <p>Audit Findings</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">

                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Auditee Name :</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbAuditeeName" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Auditor Name<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:DropDownList ID="ddlAuditor" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static"></asp:DropDownList>
                    </div>

                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Site/Location:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbSiteLoc" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                        <asp:HiddenField ID="hfid" runat="server" />
                        <asp:HiddenField ID="hfapi" runat="server" />
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Dept or Project Name:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbDept" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">ISO 9001:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbISO9001" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">ISO 27001:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbISO27001" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">ISO 20000:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbISO20000" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Type<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:DropDownList ID="ddlType" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Finding Description:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbDescription" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Root Cause (To be filled by Auditee):</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbRootCause" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Corrective Actions (To be filled by Auditee):</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbCorrectiveAction" runat="server" TextMode="MultiLine" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Preventive Actions (To be filled by Auditee)<span style="color: Red">:</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbPreventiveAction" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">

                    <div class="two columns">
                        <label for="fname_a">Verification Details of Corrective Action And Evaluation of Effectiveness (by Auditee)<span style="color: Red">:</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbVerificationdetailsofCorrectiveAction" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Initials of MQAS Auditor Reviewing CA Proposed:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbInitialsofMQASAuditorReviewingCAproposed" runat="server" class="input-text ttip_r large" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Initials of MQAS Auditor Verifying Effectiveness of Corrective Action:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbInitialsofMQASAuditorVerifyingEffectivenessofCorrectiveAction" runat="server" TextMode="MultiLine" class="input-text ttip_r max large" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">MQAS Auditor Comments on CA Verification:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbMQASAuditorCommentsonCAVerification" runat="server" TextMode="MultiLine" class="input-text ttip_r max large" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Date Proposed CA Accepted by MQAS: </label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbDateProposedCAAcceptedbyMQAS" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Date CA Verified by MQAS:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbDateCAVerifiedbyMQAS" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>

                </div>
            </div>
            <div class="formRow">
                <div class="row">

                    <div class="two columns">
                        <label for="fname_a">Date For Closure of Non-Conformity: </label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbDateforClosureofNonconformity" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Date For Implementation of Corrective Action: </label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbdateForImCorrecAction" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">

                    <div class="two columns">
                        <label for="fname_a">Date<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbDate" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="two columns">
                    </div>
                    <div class="four columns">
                    </div>
                </div>
            </div>
            <div class="formRow">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="button small nice blue radius" OnClick="btnSave_Click" />
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
                        <asp:Repeater ID="rptAuditFindingDtls" runat="server">
                            <HeaderTemplate>
                                <table border="0" class="display mobile_dt2" id="content_table">
                                    <thead>
                                        <tr>
                                            <th class="essential">S No.</th>
                                            <th class="essential">Auditor Name</th>
                                            <th class="essential">Auditee Name</th>
                                            <th class="essential">Dept or Project Name </th>
                                            <th class="essential">Date</th>
                                            <th class="essential">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="essential" style="width: 2%"><%#Container.ItemIndex+1 %></td>
                                    <td class="essential" style="width: 8%"><%#Eval("name") %></td>
                                    <td class="essential" style="width: 25%"><%#Eval("auditee_name") %></td>
                                    <td class="essential" style="width: 25%"><%#Eval("proj_name") %></td>
                                    <td class="essential" style="width: 25%"><%#Eval("Date") %></td>
                                    <td class="essential" style="width: 15%"><a href="AuditFinding.aspx?q=<%#Eval("id") %>&api=<%#Eval("audit_program_id") %>">
                                        <img src="../img/ico/pencil_gray.png" alt="" /></a></td>

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

        </div>
    </div>

</asp:Content>
