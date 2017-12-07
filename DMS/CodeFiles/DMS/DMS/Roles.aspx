<%@ Page Title="" Language="C#" MasterPageFile="~/Master/withoutmenu.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="DMS.Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $("#btnSubmit").on('click', function () {

                //$("#tbInitialStart").datepicker({ dateFormat: 'dd/mm/yy' });
                //$("#tbInitialEnd").datepicker({ dateFormat: 'dd/mm/yy' });
                //$("#tbRevisedStart").datepicker({ dateFormat: 'dd/mm/yy' });
                //$("#tbRevisedEnd").datepicker({ dateFormat: 'dd/mm/yy' });
                //$("#tbActualStart").datepicker({ dateFormat: 'dd/mm/yy' });
                //$("#tbActualEnd").datepicker({ dateFormat: 'dd/mm/yy' });

                $.validator.setDefaults({ ignore: ":hidden:not(select)" })
                $("#form1").validate({
                    errorPlacement: function (error, element) {
                        error.appendTo(element.parent())
                    }
                });


                $("#ddlRole").rules("add", {
                    required: true
                });
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Employee Roles</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="formRow">
                <div class="row">
                    <div class="two columns">
                        <label for="fname_a">Select Your Role <span style="color: Red">*</span></label>
                    </div>
                    <div class="four columns">
                        <asp:DropDownList ID="ddlRole" runat="server" class="chzn-select" Style="width: 254px;" ClientIDMode="Static"></asp:DropDownList>
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
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="button small nice blue radius" ClientIDMode="Static" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        
        </div>
    </div>
</asp:Content>
