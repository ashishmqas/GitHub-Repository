<%@ Page Title="" Language="C#" MasterPageFile="~/Master/pop.Master" AutoEventWireup="true" CodeBehind="AuditorTime.aspx.cs" Inherits="DMS.ISO.AuditorTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {

            $.validator.setDefaults({ ignore: ":hidden:not(select)" })

            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });

            $("#tbAuditPlanning").rules("add", {
                required: true
            });
            $("#ddlOnsiteAudit").rules("add", {
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
            <p>Auditor Time</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">

                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Audit Planning<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbAuditPlanning" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                        <asp:HiddenField ID="hfid" runat="server" />
                        <asp:HiddenField ID="hfapi" runat="server" />
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Onsite Audit<span style="color: Red">:*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbOnsiteAudit" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
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
                                            <th class="essential">Audit Planning</th>
                                            <th class="essential">Onsite Audit</th>
                                            <th class="essential">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="essential" style="width: 2%"><%#Container.ItemIndex+1 %></td>
                                    <td class="essential" style="width: 8%"><%#Eval("auditplanning") %></td>
                                    <td class="essential" style="width: 25%"><%#Eval("onsiteaudit") %></td>
                                    <td class="essential" style="width: 15%">
                                        <a href="AuditorTime.aspx?q=<%#Eval("id") %>&api=<%#Eval("audit_program_id") %>">
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
