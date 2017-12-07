<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ApplicationReviewChecklist.aspx.cs" Inherits="DMS.ISO.ApplicationReviewChecklist" %>

<%@ Register TagPrefix="CP" TagName="multiselect" Src="~/usercontrol/multiselect.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $("#tbReviewDate").datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Application Review Checklist</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Company Name:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbCompany" runat="server" class="input-text ttip_r large" ClientIDMode="Static" Enabled="false" CssClass="tinymce expand"></asp:TextBox>
                        <asp:HiddenField ID="hfid" runat="server" />
                    </div>
                    <div class="two columns">
                        <label for="fname_a">NACE Codes :</label>
                    </div>
                    <div class="four columns">
                        <CP:multiselect ID="ddlNACE" padding="10" runat="server" ClientIDMode="Static" />
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Application Reviewed By:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbReviewedBy" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Date of Receiving the Application:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbReceiveDate" runat="server" class="input-text ttip_r " ClientIDMode="Static" placeholder="dd/mm/yyyy" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Decision (Go/ No Go):</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbGoNoGo" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="two columns">
                        <label for="fname_a">Date of Review of the Application:</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbReviewDate" runat="server" class="input-text ttip_r " ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Reasons for decision (If no Go):</label>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbReason" runat="server" class="input-text ttip_r large" ClientIDMode="Static" CssClass="tinymce expand" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="two columns">
                    </div>
                    <div class="four columns">
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
                        <asp:Repeater ID="rpt_checklist" runat="server">
                            <HeaderTemplate>
                                <table border="0" class="display mobile_dt2" id="content_table">
                                    <thead>
                                        <tr>
                                            <th class="essential" style="width: 10%">SN</th>
                                            <th class="essential" style="width: 50%">Check Points</th>
                                            <th class="essential" style="width: 40%">Remarks (Yes/No/NA) Give comments if No or NA</th>
                                            <%--  <th class="essential">Remarks </th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <tr>
                                    <td><%#Container.ItemIndex+1 %></td>
                                    <td class="essential"><%#Eval("description") %>
                                        <asp:Label ID="Label1" Text='<%# DataBinder.Eval(Container.DataItem, "description") %>' runat="server" Style="visibility: hidden" />
                                        <asp:HiddenField ID="Label2" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" />
                                    </td>
                                    <td class="essential">
                                        <asp:TextBox runat="server" ID="tbRemark" TextMode="MultiLine" class="input-text ttip_r large" CssClass="tinymce expand" Text='<%#Eval("remark") %>'></asp:TextBox>
                                        <%-- <asp:TextBox ID="tbOption" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "option") %>'></asp:TextBox></td>--%>
                                    </td>
                                    <%--  <td class="essential">
                                        <asp:TextBox ID="tbRemark" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Section") %>' TextMode="MultiLine"></asp:TextBox>
                                        
                                    </td>--%>
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
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="button small nice blue radius" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
