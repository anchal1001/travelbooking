<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
  <link rel="stylesheet" href="admin.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
</head>
<body>
    <form id="form1" runat="server">
    <div>
             <p>
            <asp:Label ID="LblWelcome" runat="server" Text="Welcome "></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </p>
    <header>
    <div class="txt">
      <p><img id="img" src="logo.png" width="70em" height="70em"/>travel way</p>
    </div>
    <div class="box">
      <div class="container-1">
        <input type="search" id="search" placeholder="search places"/>
        <button class="icon"><img src="search.png" height="25px" width="25px"></button>
      </div>
    </div>
    <div>
      <ul class="list">
        <li><a href="#">Home</a></li>
        <li><a href="#">Explore</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
  </div>

<div class="content">
  <p><a href="UserData.aspx">View registered users</a></p>
  <p><a href="AdminData.aspx">View other admins</a></p>
  <p><a href="CityData.aspx">View other places</a></p>
</div>
<div class="main">
  <p>Want to have a journey planned for you?</p>
<button>
  <span class="plan">Click here</span>

    </div>
    </form>
</body>
</html>
