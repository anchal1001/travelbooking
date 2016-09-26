<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Personals.aspx.cs" Inherits="Personals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link href="edit.css" rel="stylesheet" />
<head runat="server">
    <title></title>
    <style>
        body{
  background: #808080;
}
        .box{
  margin: 1em auto;
  margin-right: 0;
  width:35em;
  height:3em;
}
.container-1{
  overflow: hidden;
  width:35em;
}

        .auto-style1 {
            overflow: hidden;
            margin-left: 0px;
        }
        .auto-style2 {
            width: 131px;
        }
        .auto-style3 {
            width: 190px;
        }
        .auto-style4 {
            height: 244px;
            margin-left: 313px;
            margin-top: 40px;
        }
        header{
  border-bottom: 1px solid #fff;
}

        .auto-style5 {
            margin-left: 419px;
        }

    </style>
</head>
<body style="height: 383px">
        <header>
    <div class="txt">
      <p><img id="img" src="logo.png" width="70em" height="70em" class="auto-style5"/>travel way</p>
    </div>
            </header>
    <form id="form1" runat="server">
        <table border ="1" class="auto-style4">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblRegID" runat="server" Texxt="RegID"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblRegIdAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>

                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblNameAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblEmailAns" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblPW" runat="server" Text="PW"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblPWAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblSecurityQuestion" runat="server" Text="SecurityQuestion"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblSecurityQuestionAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblAnswerAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCategory_Id" runat="server" Text="Category_Id"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblCategory_IdAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone number"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID ="lblPhoneAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
        <asp:HyperLink ID="linkChangePassword" runat="server" NavigateUrl="~/ChangePassword.aspx" style="color:darkgrey;text-decoration:none">Change Password</asp:HyperLink>
                </td>
                <td class="auto-style3">
                    <asp:HyperLink ID="gotoHome" runat="server" NavigateUrl="~/UserHomePage.aspx" style="color:darkgrey;text-decoration:none">Back</asp:HyperLink>
                    <asp:HyperLink ID="linkChangeDetails" runat="server" NavigateUrl="~/ChangeUserDetails.aspx" style="color:darkgrey;text-decoration:none">Change Personals</asp:HyperLink>

                </td>
            </tr>
            </table>
        <div class="box">
            <div class="auto-style1">
                </div>
            </div>
    </form>
</body>
</html>
