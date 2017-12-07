<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AuditProgram.aspx.cs" Inherits="DMS.ISO.AuditProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $.validator.setDefaults({ ignore: ":hidden:not(select)" })

            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });

            $("#tbFrm").datepicker({
                dateFormat: 'dd/mm/yy', minDate: 0,
                onSelect: function (selected) {
                    $("#tbTo").datepicker("option", "minDate", selected)
                }
            });
            $("#tbTo").datepicker({
                dateFormat: 'dd/mm/yy'
            });


            $("#ddlStage").rules("add", {
                required: true
            });
            $("#tbNumber").rules("add", {
                required: true
            });
            $("#tbFrm").rules("add", {
                required: true
            });

            $("#tbTo").rules("add", {
                required: true
            });




            //$("#nestedAcc").accordion({
            //    objID: "#acc",
            //    el: ".h",
            //    head: "h4, h5",
            //    next: "div",
            //    initShow: "div.shown",
            //    standardExpansible: true
            //});
            //$('.accordion h4 a,.accordion h5 a').append('<img src="../../img/blank.gif" />');
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
            <p>Audit Program</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Audit stage:<span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:DropDownList ID="ddlStage" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static" OnSelectedIndexChanged="ddlStage_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:HiddenField ID="hfQid" runat="server" />
                        <asp:HiddenField ID="hfid" runat="server" />
                    </div>
                    <div class="two columns">
                        <label for="fname_a">No. of Days :<span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbNumber" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">From:<span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbFrm" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">To:<span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbTo" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Remarks:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbRemarks" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="two columns">
                    </div>
                    <div class="four columns">
                    </div>
                </div>
            </div>
            <div class="formRow cf">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="button small nice blue radius" OnClick="btnSave_Click" />

            </div>
        </div>
        <div class="box_c_content">

            <asp:Repeater ID="rpt_list" runat="server">
                <HeaderTemplate>
                    <table border="0" class="display mobile_dt2" id="content_table">
                        <thead>
                            <tr>
                                <th class="essential">Quotation Number</th>
                                <th class="essential">Stage</th>
                                <th class="essential">No of Days  </th>
                                <th class="essential">From </th>
                                <th class="essential">To </th>
                                <th class="essential">Remarks </th>
                                <th class="essential">Action  </th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="essential" style="width: 10%"><%#Eval("q_id") %></td>
                        <td class="essential" style="width: 20%"><%#Eval("description") %></td>
                        <td class="essential" style="width: 10%"><%#Eval("nod") %></td>
                        <td class="essential" style="width: 10%"><%#Eval("frm") %></td>
                        <td class="essential" style="width: 10%"><%#Eval("to") %></td>
                        <td class="essential" style="width: 20%"><%#Eval("remark") %></td>
                        <td class="essential" style="width: 20%"><a href="AuditProgram.aspx?q=<%#Eval("q_id") %>&i=<%#Eval("id") %>">
                            <img src="../../img/ico/pencil_gray.png" alt="Edit" /></a>&nbsp;|&nbsp;<a href="AssignAuditor.aspx?p=<%#Eval("id") %>" class="fancybox fancybox.iframe" onclick="showpp();">Assign Auditor</a>&nbsp;|&nbsp;<a target="_blank" href="AuditFinding.aspx?api=<%#Eval("id") %>">
                               Audit Finding </a>
                            |&nbsp;<a target="_blank" href="AuditReport.aspx?q=<%#Eval("q_id") %>&api=<%#Eval("id") %>">Audit Report </a>
                             &nbsp|&nbsp;<a class="fancybox fancybox.iframe" onclick="showpp();" href="AuditorTime.aspx?api=<%#Eval("id") %>">Auditor Time </a>
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
