<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeUserDetails.aspx.cs" Inherits="ChangeUserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="edit.css">
    <title>Edit Profile</title>
    <style>
        body{
   background: #808080;
}
        .box{
  margin: 1em auto;
  margin-right: 0;
  top=10%;
  left=30%;
  width:35em;
  height:3em;
}
.container-1{
  overflow: hidden;
  width:35em;
}

        .auto-style1 {
            width: 405px;
        }
                header{
  border-bottom: 1px solid #fff;
}

        .auto-style2 {
            margin-left: 117px;
        }
        .auto-style3 {
            margin-right: 0;
            top=10%;
            left=30%;
            margin-left: 234px;
            margin-top: 1em;
            margin-bottom: 1em;
        }
        .auto-style4 {
            height: 16px;
        }
        .auto-style5 {
            margin-left: 394px;
        }
        .auto-style6 {
            width: 126px;
        }
        .auto-style7 {
            height: 16px;
            width: 126px;
        }

    </style>
</head>
<body>
     <header>
        <img id="head" src="../Images/head.png">
    </header>
    
    <form runat="server">
        <div class="main">
            <div class="wrapper">
                <table class="journey">
                    <tr>
                        <td class="title">Edit</td>
                        <td class="title"></td>
                    </tr>
                    <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblRegID" runat="server" Texxt="RegID"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblRegIdAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID ="tbxNameAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="tbxEmailAns" runat="server" Text=""></asp:Label>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server"  ControlToValidate="tbxEmailAns" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
                    --%>
                </td> 
                </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblPW" runat="server" Text="PW"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblPWAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblSecurityQuestion" runat="server" Text="SecurityQuestion"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="dropQues" runat="server" Height="45px" style="margin-left: 0px; margin-top: 0px" Width="125px">
                    
                    <asp:ListItem Value="1">Favourite Color</asp:ListItem>
                    <asp:ListItem Value="2">Favourite Animal</asp:ListItem>
                    <asp:ListItem Value="3">Favourite Movie</asp:ListItem>
                    <asp:ListItem Value="4">Favourite Actor</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID ="tbxAnswerAns" runat="server" Text="" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server"  ControlToValidate="tbxAnswerAns" ErrorMessage="Answer is required" ForeColor="red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblCategory_Id" runat="server" Text="Category"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblCategory_IdAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID ="tbxPhoneAns" runat="server" Text="" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" runat="server"  ControlToValidate="tbxPhoneAns" ErrorMessage="Number is required" ForeColor="red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "tbxPhoneAns" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{10,10}$" runat="server" ErrorMessage="Invalid Number"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhonenumber" ControlToValidate="tbxPhoneAns" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"  ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
        <asp:HyperLink ID="linkChangePassword" runat="server" NavigateUrl="~/ChangePassword.aspx" style="color:darkgrey;text-decoration:none">Change Password</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="gotoHome" runat="server" NavigateUrl="~/UserHomePage.aspx" style="color:darkgrey;text-decoration:none">Back</asp:HyperLink>
                    <asp:Button ID="linkChangeDetails" runat="server" onclick="changeDetails" Text="Update" CssClass="auto-style2"></asp:Button>

                </td>
            </tr>
            </table>
                </div>
            </div>
   
    </form>
</body>
</html>

