<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
 <link rel="stylesheet" href="home.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
</head>
    <style>
        input[type=email],input[type=password]{
            width: 40%;
            margin-top: 4px;
            padding: 10px 5px 10px 32px;
            box-sizing: content-box;
            border-radius: 3px;
            box-shadow: 0px 1px 4px 0px rgba(168,168,168,0.6);
            transition: all 0.2s linear;
            margin-left: 105px;
        }
        </style>
<body onload="reform">
        <header>
        <div class="img">
            <img id="head" src="head.png" height="100px"/>
        </div>
        <div class="box">
            <div class="container-1">
            <input type="search" id="search" placeholder="search places"/>
            <button class="icon"><img src="search.png" height="25px" width="25px"/></button>
        </div>
        </div>
    <form id="form1" runat="server">
            <div class="bar">
                <nav class="horizontalbar">
                    <ul class="list">
                        <li><a href="home2.aspx">Home</a></li>
                        <li><a href="#">Explore</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="Login.aspx">Back</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    <div style="height: 50px"></div>
    <div>
            <p style="margin-left: 320px"><asp:Label ID="lblTitle" runat="server" Text="CHANGE PASSWORD"  ForeColor="White" Font-Size="X-Large" Font-Names="Georgia"></asp:Label></p>
            <p></p>
            <p>
            <asp:Label ID="lblEmail" runat="server" Text="Enter Email" ForeColor="White" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="tbxEmail" runat="server" input type="email" placeholder="Email" style="margin-left: 129px" Width="332px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ValidationGroup="ValidSignup" runat="server" controltovalidate="tbxEmail" ErrorMessage="* Required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            <p>
            <asp:Label ID="lblChangedPassword" runat="server" Text="New Password" ForeColor="White" Font-Size="Large"></asp:Label>
            <asp:TextBox id="tbxChangedPassword" runat="server" type="password" placeholder="New Password" Width="332px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ValidationGroup="ValidSignup" runat="server" controltovalidate="tbxChangedPassword" ErrorMessage="* Required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            <p>
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" ForeColor="White" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="tbxConfirmPassword" input type="password" runat="server" placeholder="Confirm Password" style="margin-left: 77px; margin-top: 0px" Width="332px"></asp:TextBox></p>
            <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" Display="Dynamic" ControlToCompare="tbxChangedPassword" ControlToValidate="tbxConfirmPassword" ForeColor="red"></asp:CompareValidator>
            <p>
                   
                 <asp:Button  class="btn" ID="btnChangePassword" ValidationGroup="ValidSignup" runat="server" Text="Submit" OnClick="btnChangePassword_Click" />        
            </p>
            <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
        </div>
        </form>
        <script>
            function reform()
            {
                document.getElementById("tbxEmail") = "";
                document.getElementById("tbxChangePassword") = "";
            }
            </script>
</body>
</html>




 <%--   <div>
        <asp:TextBox ID="tbxEmail" runat="server" placeholder="e-Mail" /> 
        <asp:Textbox ID="tbxChangedPassword" runat="server" placeholder="New Password" />
    </div>
        <p>
        <asp:Button ID="btnChangePassword" runat="server"  Text="Submit" OnClick="btnChangePassword_Click"/>
        </p>--%>