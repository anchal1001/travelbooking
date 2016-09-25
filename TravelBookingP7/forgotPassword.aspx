<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="home.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
</head>
    <style>
        input[type=text],input[type=email],input[type=password],inpur[type=date]{
            width: 40%;
            margin-top: 4px;
            padding: 10px 5px 10px 32px;
            border: 1px solid rgba(0,0,0,0.8);
            box-sizing: content-box;
            border-radius: 3px;
            box-shadow: 0px 1px 4px 0px rgba(168,168,168,0.6);
            transition: all 0.2s linear;
        }

    </style>
<body onload="formReset()">
    <header>
        <div class="img">
            <img id="head" src="head.png" height="100px"/>
        </div>
        <div class="box">
            <div class="container-1">
            <input type="search" id="search" placeholder="search places"/>
            <button class="icon"><img src="search.png" height="25px" width="25px"></button>
        </div>
        </div>
    <form id="form1" runat="server">
            <div class="bar">
                <nav class="horizontalbar">
                    <ul class="list">
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="#">Explore</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="Login.aspx">Back</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    <div>

        <p>
            <asp:Label ID="lblEnterEmail" runat="server" Text="Enter your Email" ForeColor="White" Font-Size="Large"></asp:Label>
            <asp:TextBox ID="tbxEnterEmail" runat="server" input type="email" placeholder="Email" style="margin-left: 100px"></asp:TextBox>
        </p>
        <p>
                <asp:Label ID="lblSecQues" runat="server" Text="Security Question" Font-Names="Georgia" Font-Size="Large" ForeColor="White"></asp:Label>
                <asp:DropDownList ID="dropQues" runat="server" style="margin-left: 83px" Height="35px" Width="368px">
                    <asp:ListItem Selected="True" Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">Favourite Color</asp:ListItem>
                    <asp:ListItem Value="2">Favourite Animal</asp:ListItem>
                    <asp:ListItem Value="3">Favourite Movie</asp:ListItem>
                    <asp:ListItem Value="4">Favourite Actor</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQues" runat="server" Display="Dynamic" controltovalidate="dropQues"  OnClick="SelectDrop()" ForeColor="red">Security Question is required</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblAns" runat="server" Text="Answer" Font-Names="Georgia" Font-Size="Large" ForeColor="White"></asp:Label>
            <asp:TextBox ID="tbxAns" input type="text" runat="server" style="margin-left: 161px; margin-top: 0px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAns" runat="server" Display="Dynamic" controltovalidate="tbxAns" ErrorMessage="Answer is required" ForeColor="red"></asp:RequiredFieldValidator>
        
        </p>
        <p>
            <asp:Button class="btn" ID="btnForgotPassword" runat="server" Text="Get Password through Email" OnClick="btnForgotPassword_Click" />   
        </p>
    </div>
    </form>
    <script>
        function formReset() {
            document.getElementById("tbxName").value = "";
            document.getElementById("tbxEmail").value = "";
            document.getElementById("tbxPassword").value = "";
            document.getElementById("dropQues").value = "";
            document.getElementById("tbxAns").value = "";
        }
        function SelectDrop() {
            if (document.getElementById("dropQues").value == "")
                document.getElementById("dropQues").innerHTML = "Select a Security Question";
        }
    </script>
</body>
</html>
