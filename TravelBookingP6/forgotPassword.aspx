<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <p>
            <asp:Label ID="lblEnterEmail" runat="server" Text="Enter your Email"></asp:Label>
            <asp:TextBox ID="tbxEnterEmail" runat="server" input type="email" placeholder="Email" style="margin-left: 41px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnForgotPassword" runat="server" Text="Get Password through Email" OnClick="btnForgotPassword_Click" />   
        </p>
    </div>
    </form>
</body>
</html>
