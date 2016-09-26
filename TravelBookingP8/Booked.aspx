<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Booked.aspx.cs" Inherits="Booked" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Journey</title>
  <link rel="stylesheet" href="../css/final.css"/>
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no"/>
  <meta charset="UTF-8"/>
</head>
<body onload="myMove()">
<header>
  <img id="head" src="head.png">
</header>
    <form runat="server">
<article>
    <p><a href="UserHomePage.aspx">Go back</a></p>
    <asp:Button ID="btnLogout" runat="server" style="margin-left: 1200px; margin-top: 0px;" Text="LOGOUT" Width="111px" OnClick="btnLogout_Click" BorderStyle="None" CssClass="button" BackColor="#FF3300" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="White" Height="47px" Font-Size="Medium" />
</article>
<div class="bar">
<nav class="left">
    <p>Navigate to...</p>
  <ul class="list1">
    <li><a href="home2.apsx">Home</a></li>
    <li><a href="Search.aspx">Explore</a></li>
    <li><a href="About.aspx">About</a></li>
    <li><a href="Contact.aspx">Contact</a></li>
  </ul>
</nav>
<nav class="right">
    <p>Profile options</p>
  <ul class="list">
    <li><a href="Personals.apsx">View Profile</a></li>
    <li><a href="ChangeUserDetails.aspx">Edit Profile</a></li>
    
  </ul>
</nav>
</div>
    
<div class="main">
  <div class="wrapper">
    <div class="journey">
      <p>You have successfully planned your journey.</p>
      <p>Details for the journey are:</p>
      <table>
      <tr>
        <td class="label">From:</td>
        <td>
            <asp:Label ID="lblStartFrom" runat="server" ForeColor="white"></asp:Label>
            <img  id="myAnimation" src="food.png" height="25px" width="25px" />
        </td>
      </tr>
      <tr>
        <td class="label">To:</td>
        <td>
            <asp:Label ID="lblDestination" runat="server" ForeColor="white"></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="label">Start from:</td>
        <td>
            <asp:Label ID="lblStartdate" runat="server" ForeColor="white"></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="label">End on:</td>
        <td>
            <asp:Label ID="lblEndDate" runat="server" ForeColor="white"></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="label">Your Mode:</td>
        <td>
            <asp:Label ID="lblMode" runat="server" ForeColor="white"></asp:Label>
            <%--<asp:Image ID="imgMode" runat="server" alt="Image Not Found" ImageUrl="food.png"/>--%>
        </td>
      </tr>
      <tr>
        <td><asp:Button id="btnEdit" class="state" Text="Edit" runat="server" OnClick="EditIt">
        </asp:Button></td>
      <td><asp:Button id="btnNew" class="state" Text="New Event" runat="server" OnClick="AddNew">
        </asp:Button></td>      
      <td><asp:Button id="btnDone" class="state" Text="Done" runat="server" OnClick="DidIt">
        </asp:Button></td>
    </tr>
    </table>
  </div>
</div>
</div>
        </form>
<footer>
  <div class="wrap">
  <h1>Travel way</h1>
  <p>Feedback&nbsp&nbsp&#8226&nbsp&nbspTerms and conditions&nbsp&nbsp&#8226&nbsp&nbspPrivacy Policy</p>
  <h6>&#169; Copyrights 2016 travelway.com All Rights Reserved</h6>
</div>
</footer>
    
<script>
    function myMove() {
        var mode = document.getElementById("lblMode");
        if (lblMode.Text == "1")
        {
            myAnimation.ImageUrl = "img1.jpg";
        }
  var elem = document.getElementById("myAnimation");
  var pos = 0;
  var id = setInterval(frame, 10);
  function frame() {
    if (pos == 350) {
      clearInterval(id);
    } else {
      pos++;
      //elem.style.top = pos + 'px';
      elem.style.left = pos + 'px';
    }
  }
}
</script>
</body>
</html>