<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="assignroles.aspx.cs" Inherits="DMS.admin.assignroles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Grid {
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
            font-family: Calibri;
            color: #474747;
        }

            .Grid td {
                padding: 2px;
                border: solid 1px #c1c1c1;
            }

            .Grid th {
                padding: 4px 2px;
                color: #fff;
                background: #363670 url(Images/grid-header.png) repeat-x top;
                border-left: solid 1px #525252;
                font-size: 0.9em;
            }

            .Grid .alt {
                background: #fcfcfc url(Images/grid-alt.png) repeat-x top;
            }

            .Grid .pgr {
                background: #363670 url(Images/grid-pgr.png) repeat-x top;
            }

                .Grid .pgr table {
                    margin: 3px 0;
                }

                .Grid .pgr td {
                    border-width: 0;
                    padding: 0 6px;
                    border-left: solid 1px #666;
                    font-weight: bold;
                    color: #fff;
                    line-height: 12px;
                }

                .Grid .pgr a {
                    color: Gray;
                    text-decoration: none;
                }

                    .Grid .pgr a:hover {
                        color: #000;
                        text-decoration: none;
                    }
    </style>
    <script>
        $(document).ready(function () {


            $.validator.setDefaults({ ignore: ":hidden:not(select)" })
            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });
            $("#ddlFunction").rules("add", {
                required: true
            });
            $("#ddlEmp").rules("add", {
                required: true
            });
            $('#content_table').dataTable({
                "sPaginationType": "full_numbers",
                "sDom": 'C<"clear">lfrtip'
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
            <p>Users Role</p>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                     <div class="three columns">
                        <label for="fname_a">Employee  <span style="color: Red">*</span></label>
                    </div>
                    <div class="three columns">
                        <asp:DropDownList ID="ddlEmp" runat="server" class="chzn-select" Style="width: 200px;" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlEmp_SelectedIndexChanged" ></asp:DropDownList>
                    </div>
                     <div class="three columns">
                          
                        <asp:HiddenField ID="hfId" runat="server" />
                    </div>
                    <div class="three columns">
                       
                    </div>
                   
                   
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                  
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <asp:GridView ID="gdReviewComments" runat="server" CssClass="Grid" HeaderStyle-BackColor="#3AC0F2" Width="100%" HeaderStyle-ForeColor="White"
                        AutoGenerateColumns="false" OnRowDataBound="gdReviewComments_RowDataBound1">
                        <Columns>
                            <asp:TemplateField HeaderText="Roles" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblscreen" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                </ItemTemplate>

                                <ItemStyle Width="150px"></ItemStyle>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Assign/Unassign" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:CheckBox ID="ChkRole" runat="server"  />
                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                    <%--  <asp:Label ID="lblReviewer" runat="server" Text='<%# Eval("name") %>'></asp:Label>--%>
                                </ItemTemplate>

                                <ItemStyle Width="150px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>

                        <HeaderStyle BackColor="White" ForeColor="Black"></HeaderStyle>
                    </asp:GridView>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlEmp" EventName="SelectedIndexChanged" />
                             
                        </Triggers>
                        </asp:UpdatePanel>
                </div>
            </div>
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
                       <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="button small nice blue radius" ClientIDMode="Static" OnClick="GetData" />

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

