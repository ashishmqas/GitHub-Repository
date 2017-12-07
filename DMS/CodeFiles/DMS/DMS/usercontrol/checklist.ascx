<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="checklist.ascx.cs" Inherits="DMS.usercontrol.checklist" %>


            
            
            <div class="formRow">
                <div class="row">
                    <div class="twelve columns">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                            <HeaderTemplate>
                                <table border="0" class="display mobile_dt2" id="content_table">
                                    <thead>
                                        <tr>
                                            <th class="essential">SN</th>
                                            <th class="essential">Auditor Statement</th>                                           
                                            <th class="essential">Status</th>
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
                                        <asp:HiddenField ID="hfddloption" Value='<%# DataBinder.Eval(Container.DataItem, "option") %>' runat="server" />
                                        <asp:DropDownList ID="ddlOption" runat="server" class="chzn-select">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                        </asp:DropDownList>
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
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="button small nice blue radius" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
     