<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="resetForm()">
    <form id="form1" runat="server">
    <div>
        <p>
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="tbxName" input type="text" runat="server" style="margin-left: 125px; margin-top: 50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" controltovalidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="tbxEmail" input type="email" runat="server" style="margin-left: 128px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" controltovalidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="tbxPassword" input type="password" runat="server" style="margin-left: 100px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" controltovalidate="tbxPassword" ErrorMessage="Password is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="tbxConfirmPassword" input type="password" runat="server" style="margin-left: 49px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" controltovalidate="tbxConfirmPassword" ErrorMessage="Passwords do not match" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblSecQues" runat="server" Text="Security Question"></asp:Label>
                <asp:DropDownList ID="dropQues" runat="server" Height="19px" style="margin-left: 52px; margin-top: 0px" Width="130px">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                    <asp:ListItem Value="1">Favourite Color</asp:ListItem>
                    <asp:ListItem Value="2">Favourite Animal</asp:ListItem>
                    <asp:ListItem Value="3">Favourite Movie</asp:ListItem>
                    <asp:ListItem Value="4">Favourite Actor</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQues" runat="server" controltovalidate="dropQues" ErrorMessage="Security Question is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblAns" runat="server" Text="Answer"></asp:Label>
                <asp:TextBox ID="tbxAns" input type="text" runat="server" style="margin-left: 112px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAns" runat="server" controltovalidate="tbxAns" ErrorMessage="Answer is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblRole" runat="server" Text="Sign Up As"></asp:Label>
                <asp:DropDownList ID="dropRoles" runat="server" style="margin-left: 90px; margin-top: 0px" Height="21px" Width="125px">
                <asp:ListItem Value="1">Admin</asp:ListItem>
                <asp:ListItem Value="2">User</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRoles" runat="server" controltovalidate="dropRoles" ErrorMessage="Role is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="tbxPhone" input type="text" runat="server" style="margin-left: 122px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" controltovalidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth"></asp:Label>
                <asp:TextBox ID="tbxDOB" input type="date" runat="server" style="margin-left: 79px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" controltovalidate="tbxDOB" ErrorMessage="Date of birth is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="tbxCity" input type="text" runat="server" style="margin-left: 100px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" controltovalidate="tbxCity" ErrorMessage="City name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Button ID="btnNext" runat="server" Text="NEXT" style="margin-left: 100px" Width="115px" OnClick="btnNext_Click" />        
        </p>
    
    </div>
    </form>
    <script>
        function resetForm()
        {
            document.getElementById("tbxName").value = "";
            document.getElementById("tbxEmail").value = "";
            document.getElementById("tbxPassword").value = "";
            document.getElementById("tbxConfirmPassword").value = "";
            document.getElementById("tbxAns").value = "";
            document.getElementById("tbxPhone").value = "";
            document.getElementById("tbxDOB").value = "";
            document.getElementById("tbxCity").value = "";
        }
    </script>
</body>
</html>
