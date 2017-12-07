<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="clientchecklist.ascx.cs" Inherits="DMS.usercontrol.clientchecklist" %>
<div class="box_c">
    <script>
        $(document).ready(function () {
            $.validator.setDefaults({ ignore: ":hidden:not(select)" })
            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });
            $("#tbReviewDate").datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
    <div class="box_c_heading cf">
        <div class="box_c_ico">
            <img src="../../img/ico/icSw2/16-List.png" alt="" />
        </div>
        <p>
            <%-- <asp:Label ID="lbCaption" runat="server" Text="Caption"></asp:Label></p>--%>
    </div>
    <div class="box_c_content form_a">

        <div class="formRow">
            <div class="row">
                <div class="two columns">
                    <label for="fname_a">Approved By</label>
                </div>
                <div class="four columns">
                    <asp:TextBox ID="tbApprover" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="two columns">
                    <label for="fname_a">Review Date</label>
                </div>
                <div class="four columns">
                    <asp:TextBox ID="tbReviewDate" placeholder="dd/mm/yyyy" runat="server" class="input-text ttip_r large" ClientIDMode="Static" ></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="formRow">
            <div class="row">
                <asp:HiddenField ID="hfqid" runat="server" Value="0" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <div class="twelve columns">
                    <asp:Repeater ID="rpt_clientchcklist" runat="server" OnItemDataBound="rpt_clientchcklist_ItemDataBound">
                        <HeaderTemplate>
                            <table border="0" class="display mobile_dt2" id="content_table">
                                <thead>
                                    <tr>
                                        <th class="essential">SNo</th>
                                        <th class="essential">Check Point</th>
                                        <th class="essential">Remarks </th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>

                            <tr>
                                <td><%#Eval("sqno") %></td>
                                <td class="essential"><%#Eval("checkpoint") %>
                                    <asp:HiddenField ID="hdncheckpoint" Value='<%# DataBinder.Eval(Container.DataItem, "checkpoint") %>' runat="server" />
                                    <asp:HiddenField ID="hdnid" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" />
                                </td>
                                <td class="essential">
                                    <asp:TextBox ID="tbRemark" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' TextMode="MultiLine"></asp:TextBox>
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
            <div class="row">
                <div class="twelve columns">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="button small nice blue radius" OnClick="btnSubmit_Click" />

                    <a href="#" target="_blank" class="button small nice blue radius"
                        id="Export" runat="server">Export</a>

                </div>
            </div>
        </div>
    </div>
</div>
