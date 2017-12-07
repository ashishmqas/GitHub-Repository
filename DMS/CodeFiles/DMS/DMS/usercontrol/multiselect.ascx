<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="multiselect.ascx.cs" Inherits="DMS.usercontrol.multiselect" %>

      <%--  <script src="<%=Page.ResolveUrl("../../js/jquery.min.js")%>"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
            rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
        <link href="../../css/bootstrap-multiselect.css"
            rel="stylesheet" type="text/css" />
        <script src="../../js/bootstrap-multiselect.js"
            type="text/javascript"></script>--%>
        <script type="text/javascript">
            $(function () {
                $('[id*=lstEmp]').multiselect({
                    includeSelectAllOption: true,
                    enableCaseInsensitiveFiltering: true,
                    enableFiltering: true,
                    filterPlaceholder: 'Search for something...'
                });
               
            });
        </script>
        <asp:ListBox ID="lstEmp" runat="server" SelectionMode="Multiple"  ClientIDMode="Static">
           
        </asp:ListBox>
    

