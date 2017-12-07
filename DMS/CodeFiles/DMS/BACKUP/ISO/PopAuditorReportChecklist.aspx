<%@ Page Title="" Language="C#" MasterPageFile="~/Master/pop.Master" AutoEventWireup="true" CodeBehind="PopAuditorReportChecklist.aspx.cs" Inherits="DMS.ISO.PopAuditorReportChecklist" %>

<%@ Register Src="~/usercontrol/checklist.ascx" TagPrefix="uc1" TagName="checklist" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Auditor Statement</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
           <asp:HiddenField ID="hfPid" runat="server" />
            <div class="formRow">
                <div class="row">
                    <uc1:checklist runat="server" ID="checklist" />
                </div>
            </div>
        </div>
    </div>
        



</asp:Content>
