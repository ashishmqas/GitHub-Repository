<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="QuotationRequestfrm.aspx.cs" Inherits="DMS.ISO.QuotationRequestfrm" validateRequest="false" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $.validator.setDefaults({ ignore: ":hidden:not(select)" })
            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });
            $("#tbCapcha").rules("add", {
                required: true,
                messages: {
                    required: "Enter image text."
                }
           
            });
            $("#tbDate").datepicker({ dateFormat: 'dd/mm/yy' });
            $("#nestedAcc").accordion({
                objID: "#acc",
                el: ".h",
                head: "h4, h5",
                next: "div",
                initShow: "div.shown",
                standardExpansible: true
            });
            $('.accordion h4 a,.accordion h5 a').append('<img src="../../img/blank.gif" />');
           
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Management System Certification Quotation Request Form</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns" id="nestedAcc">
                        <ul id="acc" class="accordion">
                            <li>
                                <h4>1.	Details about the Company </h4>
                                <div class="inner">
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">Company Name:<span style="color: Red">*</span></label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbCName" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                <asp:HiddenField ID="hfQid" runat="server" />
                                            </div>
                                            <div class="two columns">
                                                <label for="fname_a">Street:</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbStreet" runat="server" class="input-text ttip_r large" ClientIDMode="Static" CssClass="tinymce expand" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">MR</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbMR" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                            <div class="two columns">
                                                <label for="fname_a">Phone:</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbPhone" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">ZIP, Place:</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbZip" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                            <div class="two columns">
                                                <label for="fname_a">Email:</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbEmail" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">Website:</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbWebsite" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                            <div class="two columns">
                                                <label for="fname_a">Fax:</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbFax" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">Branch Address (s):</label>
                                            </div>
                                            <div class="ten columns">
                                                <asp:TextBox ID="tbBrchAddr" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">Industry / activities:</label>
                                            </div>
                                            <div class="ten columns">
                                                <asp:TextBox ID="tbIndustry" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="two columns">
                                                <label for="fname_a">Country/Location:<span style="color: Red">*</span></label>
                                            </div>
                                            <div class="four columns">
                                                <asp:DropDownList ID="ddlCountry" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static"></asp:DropDownList>
                                            </div>
                                            <div class="two columns">
                                                <label for="fname_a">Sponsor</label>
                                            </div>
                                            <div class="four columns">
                                                <asp:TextBox ID="tbSponsor" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <div class="row">
                                            <div class="twelve columns">
                                                <asp:Repeater ID="rptCompDtls" runat="server">
                                                    <HeaderTemplate>
                                                        <table border="0" class="display mobile_dt2">
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="essential" style="width: 40%">
                                                                <label for="fname_a">
                                                                    <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>
                                                                <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                                            </td>
                                                            <td class="essential" style="width: 60%">
                                                                <asp:TextBox ID="tbCompdtl" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>

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
                            </li>
                            <li>
                                <h4>2.	Scope of Service</h4>
                                <div class="inner">
                                    <div class="row">
                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Please indicate the standard against which the certification is required?</label>
                                                </div>
                                                <div class="nine columns">
                                                    <asp:Repeater ID="rpt_scope" runat="server">
                                                        <HeaderTemplate>
                                                            <table border="0" class="display mobile_dt2">
                                                                <thead>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="essential" style="width: 20%">
                                                                    <label for="fname_a">
                                                                        <asp:CheckBox ID="chkAudit" runat="server" Text='<%#Eval("description") %>' />
                                                                        <%-- <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>--%>
                                                                        <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                                                </td>
                                                                <td class="essential" style="width: 30%">
                                                                    <asp:CheckBox ID="chkAlready" runat="server" Text="&nbsp;&nbsp;If already certified" /></td>
                                                                <td class="essential" style="width: 30%">
                                                                    <label for="fname_a">Certified by:</label>
                                                                    <asp:TextBox ID="tbCertified" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>
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
                                                <div class="three columns">
                                                    <label for="fname_a">If already certified, then current state of the certificate</label>
                                                </div>
                                                <div class="three columns">
                                                    <label for="fname_a">ISO 9001:2015</label>
                                                </div>
                                                <div class="three columns">
                                                    <label for="fname_a">ISO 27001:2013</label>
                                                </div>
                                                <div class="three columns">
                                                    <label for="fname_a">ISO 20000:2011</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="three columns">
                                                    &nbsp;
                                                </div>
                                                <div class="three columns">
                                                    <asp:DropDownList ID="ddl9001" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static"></asp:DropDownList>
                                                </div>
                                                <div class="three columns">
                                                    <asp:DropDownList ID="ddl27001" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static"></asp:DropDownList>
                                                </div>
                                                <div class="three columns">
                                                    <asp:DropDownList ID="ddl20000" runat="server" class="chzn-select" Style="width: 300px;" ClientIDMode="Static"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Scope of certification</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbScopeCer9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbScopeCer27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbScopeCer20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Address of the locations to be assessed</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbAddress9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbAddress27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbAddress20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Description of work performed (Services or Products)</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbWorkPerform9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbWorkPerform27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbWorkPerform20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Employee Strength</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbEMPStrength9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbEMPStrength27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbEMPStrength20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Breakup of strength:</label>
                                                </div>
                                                <div class="three columns">
                                                </div>
                                                <div class="three columns">
                                                </div>
                                                <div class="three columns">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">a)	Managerial</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbManagerial9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbManagerial27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbManagerial20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">b)	Technical/Production</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbTechnical9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbTechnical27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbTechnical20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">c)	IT and Procurement</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbIT9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbIT27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbIT20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">d)	Business Dev</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbBusiness9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbBusiness27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbBusiness20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">e)	Administration</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbAdministration9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbAdministration27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbAdministration20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">f)	HR</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbHR9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbHR27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbHR20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">g)	Finance</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbFinance9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbFinance27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbFinance20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">g)	Other</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbOther9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbOther27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbOther20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <div class="row">
                                                <div class="three columns">
                                                    <label for="fname_a">Describe if there are any offsite or outsourced activities</label>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbactivities9001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbactivities27001" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="three columns">
                                                    <asp:TextBox ID="tbactivities20000" runat="server" class="input-text ttip_r large" ClientIDMode="Static" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </li>
                            <li>
                                <h4>3.	Questions pertaining to ISO 27001:2013</h4>
                                <div class="inner">
                                    <div class="row">
                                        <div class="row">
                                            <div class="twelve columns">
                                                <asp:Repeater ID="rptISO27001" runat="server">
                                                    <HeaderTemplate>
                                                        <table border="0" class="display mobile_dt2">
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="essential" style="width: 40%">
                                                                <label for="fname_a">
                                                                    <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>
                                                                <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                                            </td>
                                                            <td class="essential" style="width: 60%">
                                                                <asp:TextBox ID="tbCompdtl" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>

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
                            </li>
                            <li>
                                <h4>4.	Questions pertaining ISO 20000:2011</h4>
                                <div class="inner">
                                    <div class="row">
                                        <div class="row">
                                            <div class="twelve columns">
                                                <asp:Repeater ID="rptISO20000" runat="server">
                                                    <HeaderTemplate>
                                                        <table border="0" class="display mobile_dt2">
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="essential" style="width: 40%">
                                                                <label for="fname_a">
                                                                    <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>
                                                                <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                                            </td>
                                                            <td class="essential" style="width: 60%">
                                                                <asp:TextBox ID="tbCompdtl" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>

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
                            </li>
                            <li>
                                <h4>5.	Questions pertaining to ISO 9001:2015 Certification - NA</h4>
                                <div class="inner">
                                    <div class="row">
                                        <div class="row">
                                            <div class="twelve columns">
                                                <asp:Repeater ID="rptISO9001" runat="server">
                                                    <HeaderTemplate>
                                                        <table border="0" class="display mobile_dt2">
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="essential" style="width: 40%">
                                                                <label for="fname_a">
                                                                    <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>
                                                                <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                                            </td>
                                                            <td class="essential" style="width: 60%">
                                                                <asp:TextBox ID="tbCompdtl" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>

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
                            </li>
                            <li>
                                <h4>6.	Questions to Ascertain Overall Complexity</h4>
                                <div class="inner">
                                    <div class="row">
                                        <div class="row">
                                            <div class="twelve columns">
                                                <asp:Repeater ID="rptComplexity" runat="server">
                                                    <HeaderTemplate>
                                                        <table border="0" class="display mobile_dt2">
                                                            <thead>
                                                                <tr>
                                                                    <th class="essential">Question</th>
                                                                    <th class="essential">Response (Low, Medium, High) </th>
                                                                    <th class="essential">Supporting Information for the Response </th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="essential" style="width: 40%">
                                                                <label for="fname_a">
                                                                    <asp:Label ID="lbCaption" runat="server" Text='<%#Eval("description") %>'></asp:Label></label>
                                                                <asp:HiddenField ID="hdId" runat="server" Value='<%#Eval("id") %>' />
                                                            </td>
                                                            <td class="essential" style="width: 30%">
                                                                <asp:TextBox ID="tbResponse" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>
                                                            <td class="essential" style="width: 30%">
                                                                <asp:TextBox ID="tbSupporting" runat="server" class="input-text ttip_r large" ClientIDMode="Static"></asp:TextBox></td>
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
                            </li>
                            <li>
                                <h4>7.	Any Other Information</h4>
                                <div class="inner">
                                    <div class="row">
                                        <div class="twelve columns">
                                            <asp:TextBox ID="tbOtherInfo" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="four columns">
                        <asp:TextBox ID="tbDate" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbPlace" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="Place"></asp:TextBox>
                    </div>
                    <div class="four columns">
                        <asp:TextBox ID="tbName" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="Person Name"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="four columns">
                        <cc1:CaptchaControl ID="Captcha1" runat="server"
                            CaptchaBackgroundNoise="Low" CaptchaLength="5"
                            CaptchaHeight="60" CaptchaWidth="200"
                            CaptchaLineNoise="None" CaptchaMinTimeout="5" BackColor="Silver"
                            CaptchaMaxTimeout="240" FontColor="#529E00" CaptchaChars="ACDEFGHJKLNPQRTUVXYZ2346789"  EnableViewState="False"  />
                    </div>
                    <div class="two columns">
                         <asp:TextBox ID="tbCapcha" runat="server" class="input-text ttip_r max large" ClientIDMode="Static" placeholder="Place"></asp:TextBox>
                        </div>
                     <div class="six columns">
                        </div>
                </div>
            </div>
            <div class="formRow cf">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="button small nice blue radius" OnClick="btnSave_Click" />
                <asp:Button ID="btnBaseline" runat="server" Text="Baseline" class="button small nice blue radius" OnClick="btnBaseline_Click" />
            </div>
        </div>
    </div>
</asp:Content>
