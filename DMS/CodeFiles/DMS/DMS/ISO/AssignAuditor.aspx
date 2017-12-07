<%@ Page Title="" Language="C#" MasterPageFile="~/Master/pop.Master" AutoEventWireup="true" CodeBehind="AssignAuditor.aspx.cs" Inherits="DMS.ISO.AssigAuditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {

            $.validator.setDefaults({ ignore: ":hidden:not(select)" })
            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });
            $("#ddlAuditor").rules("add", {
                required: true
            });

            $("#btnSave").click(function () {
                if ($('#ddlAuditor').val() == "1" || $('#ddlAuditor').val() == "2") {
                    $("#ddlUser").rules("add", {
                        required: true
                    });
                }
                else {
                    $("#tbName").rules("add", {
                        required: true
                    });
                }
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Assign Auditor</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Auditor Type:<span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:DropDownList ID="ddlAuditor" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static" OnSelectedIndexChanged="ddlAuditor_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:HiddenField ID="hfId" runat="server" />
                        <asp:HiddenField ID="hfPid" runat="server" />
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Auditor Name:<span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <script type="text/javascript">
                                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(prth_chosen_select.init);
                                </script>
                                <asp:DropDownList ID="ddlUser" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static" Visible="false"></asp:DropDownList>
                                <asp:TextBox ID="tbName" runat="server" class="input-text ttip_r large" ClientIDMode="Static" Visible="false"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlAuditor" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="formRow cf">
                <asp:Button ID="btnSave" runat="server" Text="Save" ClientIDMode="Static" class="button small nice blue radius" OnClick="btnSave_Click" />
            </div>
        </div>
        <div class="box_c_content">

            <asp:Repeater ID="rpt_list" runat="server">
                <HeaderTemplate>
                    <table border="0" class="display mobile_dt2" id="content_table">
                        <thead>
                            <tr>
                                <th class="essential">Auditor Name</th>
                                <th class="essential">Auditor type</th>
                                <th class="essential">Action  </th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="essential" style="width: 40%"><%#Eval("auditornm") %></td>
                        <td class="essential" style="width: 40%"><%#Eval("description") %></td>
                        <td class="essential" style="width: 10%"><%--<a href="AssignAuditor.aspx?i=<%#Eval("id") %>"><img src="../../img/ico/pencil_gray.png" alt="Edit" /></a>&nbsp;|&nbsp;--%>
                            <a href="AssignAuditor.aspx?d=<%#Eval("id") %>&p=<%#Eval("aprogramid") %>"><img src="../../img/ico/trashcan_gray.png" alt="Delete" /></a>&nbsp;|&nbsp;
                            <a href="UndertakingfrmPrint.aspx?p=<%#Eval("id") %>">Undertaking</a>
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
</asp:Content>
