<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="RolesRights.aspx.cs" Inherits="DMS.admin.RolesRights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {

            $.validator.setDefaults({ ignore: ":hidden:not(select)" })
            $("#form1").validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent())
                }
            });

            $("#ddlRole").rules("add", {
                required: true
            });


            $('#content_table').dataTable({
                "sPaginationType": "full_numbers"
            })
        });
    </script>
    <script type="text/javascript">
        function Check_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //If checked change color to Aqua
                row.style.backgroundColor = "aqua";
            }
            else {
                //If not checked change back to original color
                if (row.rowIndex % 2 == 0) {
                    //Alternating Row Color
                    row.style.backgroundColor = "white";
                }
                else {
                    row.style.backgroundColor = "white";
                }
            }

            //Get the reference of GridView
            var GridView = row.parentNode;

            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];

                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }
    </script>
    <script type="text/javascript">
        //function checkAll(objRef) {
        //    var GridView = objRef.parentNode.parentNode.parentNode;
        //    var inputList = GridView.getElementsByTagName("input");
        //    for (var i = 0; i < inputList.length; i++) {
        //        //Get the Cell To find out ColumnIndex
        //        var row = inputList[i].parentNode.parentNode;
        //        if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
        //            if (objRef.checked) {
        //                //If the header checkbox is checked
        //                //check all checkboxes
        //                //and highlight all rows
        //                row.style.backgroundColor = "aqua";
        //                inputList[i].checked = true;
        //            }
        //            else {
        //                //If the header checkbox is checked
        //                //uncheck all checkboxes
        //                //and change rowcolor back to original 
        //                if (row.rowIndex % 2 == 0) {
        //                    //Alternating Row Color
        //                    row.style.backgroundColor = "white";
        //                }
        //                else {
        //                    row.style.backgroundColor = "white";
        //                }
        //                inputList[i].checked = false;
        //            }
        //        }
        //    }
        //}
    </script>
    <script type="text/javascript">
        //function MouseEvents(objRef, evt) {
        //    var checkbox = objRef.getElementsByTagName("input")[0];
        //    if (evt.type == "mouseover") {
        //        objRef.style.backgroundColor = "orange";
        //    }
        //    else {
        //        if (checkbox.checked) {
        //            objRef.style.backgroundColor = "aqua";
        //        }
        //        else if (evt.type == "mouseout") {
        //            if (objRef.rowIndex % 2 == 0) {
        //                //Alternating Row Color
        //                row.style.backgroundColor = "white";
        //            }
        //            else {
        //                row.style.backgroundColor = "white";
        //            }
        //        }
        //    }
        //}

        function CheckAllWrite(Checkbox) {
            var GridVwHeaderChckbox = document.getElementById("<%=gdReviewComments.ClientID %>");
            for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                GridVwHeaderChckbox.rows[i].cells[3].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }

        function CheckAllRead(Checkbox) {
            var GridVwHeaderChckbox = document.getElementById("<%=gdReviewComments.ClientID %>");
            for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                GridVwHeaderChckbox.rows[i].cells[2].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
    </script>
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
                text-align: center;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="box_c">
        <div class="box_c_heading cf">
            <div class="box_c_ico">
                <img src="../../img/ico/icSw2/16-List.png" alt="" />
            </div>
            <p>Access Role Wise</p>
        </div>
        <div class="box_c_content form_a">
            <div class="alert-box" style="display: none;">
                <div class="alert-box error" id="div_error">
                </div>
            </div>
            <div class="formRow">

                <div class="row">

                    <div class="three columns">
                        <label for="fname_a">Role <span style="color: Red">*</span> </label>
                    </div>
                    <div class="three columns">
                        <asp:DropDownList ID="ddlRole" runat="server" class="chzn-select" Style="width: 250px;" AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged"></asp:DropDownList>
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
                    <div class="twelve columns">
                        <asp:HiddenField ID="hdfl" runat="server"></asp:HiddenField>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="gdReviewComments" runat="server" CssClass="Grid" HeaderStyle-BackColor="#3AC0F2" Width="100%" HeaderStyle-ForeColor="White"
                                    AutoGenerateColumns="False">
                                    <Columns>
                                        <%-- <asp:TemplateField HeaderText="ID" ItemStyle-Width="150">
                                                                                

                                           

                                          
                                            <ItemTemplate>
                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                            </ItemTemplate>

                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Screen Name" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:HiddenField runat="server" ID="screenid" Value='<%# Eval("id") %>' />
                                                <asp:Label ID="lblscreen" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                            </ItemTemplate>

                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Module" ItemStyle-Width="150" FooterStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:Label ID="lblModule" runat="server" Text='<%#Eval("folder").ToString().ToUpper() %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Read" ItemStyle-Width="150" FooterStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="allchkR"
                                                    runat="server" Text="Read" onclick="CheckAllRead(this)" />
                                            </HeaderTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ChkRead" runat="server" />
                                                <%--<asp:Label ID="lblreviewComment" runat="server" Text='<%# Eval("proj_name") %>'></asp:Label>--%>
                                            </ItemTemplate>

                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Write" ItemStyle-Width="150" FooterStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="allchkW"
                                                    runat="server" Text="Write" onclick="CheckAllWrite(this)" />
                                            </HeaderTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ChkWrite" runat="server" onclick="Check_Click(this)" />
                                                <%--  <asp:Label ID="lblReviewer" runat="server" Text='<%# Eval("name") %>'></asp:Label>--%>
                                            </ItemTemplate>

                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>

                                    <HeaderStyle BackColor="White" ForeColor="Black"></HeaderStyle>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlRole" EventName="SelectedIndexChanged" />
                               
                            </Triggers>
                        </asp:UpdatePanel>

                    </div>
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

