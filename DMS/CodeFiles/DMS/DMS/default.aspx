<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DMS._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DMS</title>
    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("/css/login.css") %>" />
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
</head>
<body>
    <form runat="server">
        <header>Login</header>
  
        <div style="color: red;text-align:center">
            <asp:Label ID="lbmsg" runat="server" Text=""></asp:Label></div>
        <br />
        <label  class="label">Email <span>*</span></label>
        <asp:TextBox ID="tbEmail" runat="server" class="input" placeholder="Email Address"></asp:TextBox>
      <%--  <div class="help">At least 6 character</div>--%>
        <label>Password <span>*</span></label>
        <asp:TextBox runat="server" ID="tbpwd" TextMode="Password" CssClass="input" placeholder="Password"></asp:TextBox>
        <%--<div class="help">Use upper and lowercase lettes as well</div>--%>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" class="button" />
        <%--  <button>Login</button>--%>
    </form>
</body>
</html>
