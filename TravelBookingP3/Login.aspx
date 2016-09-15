<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="resetForm()">
    <form id="form1" runat="server">
    <div>
        <p>
            <asp:Label ID="lblEnterEmail" runat="server" Text="Enter Email" ></asp:Label>
            <asp:TextBox ID="tbxEnterEmail" runat="server" input type="email" style="margin-left: 41px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbxEnterEmail" ErrorMessage="Incorrect Email" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblEnterPassword" runat="server" Text="Enter Password" ></asp:Label>
            <asp:TextBox ID="tbxEnterPassword" runat="server" input type="password" style="margin-left: 41px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredFieldValidatorPassword" runat="server" ControlToValidate="tbxEnterEmail" ErrorMessage="Incorrect Password" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblEnterRole" runat="server" Text="Role : "></asp:Label>
            <asp:DropDownList ID="dropRoles" runat="server" style="margin-left: 90px; margin-top: 0px" Height="21px" Width="125px">
                <asp:ListItem Selected="True">Select</asp:ListItem>
                <asp:ListItem Value="1">Admin</asp:ListItem>
                <asp:ListItem Value="2">User</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRoles" runat="server" controltovalidate="dropRoles" ErrorMessage="Enter Role" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="btnLogin" runat="server" text="LOGIN" OnClick="btnLogin_Click" />
        </p>
    </div>
    </form>
    <script>
        function resetForm()
        {
            document.getElementById("tbxEnterEmail").value = "";
            document.getElementById("tbxEnterPassword").value = "";
        }
     </script>
           
</body>
</html>
