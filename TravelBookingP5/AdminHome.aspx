<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Way | Admin</title>
  <link rel="stylesheet" href="admin.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta charset="UTF-8">
</head>
<body>
    <header>
        <img id="head" src="head.png">
    </header>
    <form id="form1" runat="server">
        <article>
            <div>
                <img src="imgg.jpg">
            </div>
            <div id="text">
                <p>Have an amazing experience in your travel planning...</p>
            </div>
            <h3>
                <asp:Label ID="lblWelcome" runat="server" BorderColor="White" Font-Names="Comic Sans MS" ForeColor="White" Text="Welcome "></asp:Label>
                <asp:Button ID="btnLogout" runat="server" style="margin-left: 281px" Text="LOGOUT" Width="109px" OnClick="btnLogout_Click" BorderStyle="Ridge" CssClass="button" />
            </h3>
        </article>
        <div class="bar">
            <nav class="left">
                <p>Navigate to...</p>
                <ul class="list1">
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="#">Explore</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <nav class="right">
                <p>Profile options</p>
                    <ul class="list">
                        <li><a href="#">View Profile</a></li>
                        <li><a href="#">Edit Profile</a></li>
                        <li><a href="UserData.aspx">View users</a></li>
                        <li><a href="AdminData.aspx">View other admins</a></li>
                    </ul>
            </nav>
        </div>
        <div class="main">
            <p>Want to have a journey planned for you?</p>
            <button class="button">
                <span>Click</span>
            </button>   
        </div>
   
        
    </form>
</body>
</html>
