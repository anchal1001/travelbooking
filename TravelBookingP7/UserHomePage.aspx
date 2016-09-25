<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHomePage.aspx.cs" Inherits="UserHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <title>User</title>
  <link rel="stylesheet" href="../css/user.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta charset="UTF-8">
</head>
<body>
    <form id="form1" runat="server">
<header>
  <img id="head" src="../Images/head.png">
</header>
<article>
  <div>
    <img src="../Images/imgg.jpg">
  </div>
  <div id="text">
    <h1>Hello
      <asp:Label ID="lblWelcome" runat="server" BorderColor="White" Font-Names="Comic Sans MS" ForeColor="White"></asp:Label>
    </h1>
    <p>Have an amazing experience in your travel planning...</p>
  </div>
</article>
<asp:Button ID="btnLogout" runat="server" style="margin-left: 1200px; margin-top: 0px;" Text="LOGOUT" Width="111px" OnClick="btnLogout_Click" BorderStyle="None" CssClass="button" BackColor="#FF3300" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="White" Height="47px" Font-Size="Medium" /><div class="bar">
<nav class="left">
    <p>Navigate to...</p>
  <ul class="list1">
    <li><a href="../Home.aspx">Home</a></li>
    <li><a href="../Explore.aspx">Explore</a></li>
    <li><a href="../About.aspx">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
<nav class="right">
    <p>Profile options</p>
  <ul class="list">
    <li><a href="../Personals.aspx">View Profile</a></li>
    <li><a href="../Personals.aspx">Edit Profile</a></li>
  </ul>
</nav>
</div>
<div class="main">
  <p>Want to have a journey planned for you?</p>
<button class="button">
        <div class="state"><a href="../Plan.aspx" style="color:white;text-decoration:none" >Plan</a></div>
      </button>
</div>
        </form>
</body>
</html>

