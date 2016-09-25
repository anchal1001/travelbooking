<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Way | Admin</title>
  <link rel="stylesheet" href="../css/admin.css" />
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no" />
  <meta charset="UTF-8" />
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
                <h1>Hello
                    <asp:Label ID="lblWelcome" runat="server" BorderColor="White" Font-Names="Comic Sans MS" ForeColor="White"></asp:Label>
                </h1>
                    <p>Have an amazing experience in your travel planning...</p>
                </div>
                
                <asp:Button ID="btnLogout" runat="server" style="margin-left: 1200px; margin-top: 0px;" Text="LOGOUT" Width="111px" OnClick="btnLogout_Click" BorderStyle="None" CssClass="button" BackColor="#FF3300" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="White" Height="47px" Font-Size="Medium" />
            <h3>
                
                &nbsp;</h3>
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
                        <li><a href="CityData.aspx">View Cities</a></li>
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
