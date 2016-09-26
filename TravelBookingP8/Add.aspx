<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Plan your journey</title>
    <link rel="stylesheet" href="../css/plan.css">
    <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
    <meta charset="UTF-8">
</head>
<body>
    <header>
        <img id="head" src="../Images/head.png">
    </header>
    <article>
        <p><a href="UserHomePage.aspx">Go back</a></p>
    </article>
    <div class="bar">
        <nav class="left">
            <p>Navigate to...</p>
            <ul class="list1">
                <li><a href="#" Onserverclick="logout" runat="server" >Home</a></li>
                <li><a href="Explore.aspx">Explore</a></li>
                <li><a href="About.aspx">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <nav class="right">
            <p>Profile options</p>
            <ul class="list">
                <li><a href="Personals.aspx">View Profile</a></li>
                <li><a href="Personals.aspx">Edit Profile</a></li>
                <li><a href="#" onServerClick="logout"  runat="server">Logout</a></li> <%--bvjhjghjhj--%>
            </ul>
        </nav>
    </div>
    <form id="planning" runat="server">
        <div class="main">
            <div class="wrapper">
                <table class="journey">
                    <tr>
                        <td class="title">Plan your journey</td>
                        <td class="title"></td>
                    </tr>
                    <tr>
                        <td class="label">From</td>
                        <td>
                            <asp:DropDownList runat="server" class="city" ID="ddlStartFrom" OnSelectedIndexChanged="ddlStartFrom_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem runat="server" Value="select">choose city</asp:ListItem>
                            </asp:DropDownList></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorStartCity" validationgroup="Details" runat="server" ControlToValidate="ddlStartFrom" ErrorMessage="City is required" ForeColor="red"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td class="label">To</td>
                        <td>
                            <asp:DropDownList runat="server" class="city" ID="ddlDestinationState" OnSelectedIndexChanged="ddlDestinationState_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem runat="server" Value="select">choose city</asp:ListItem>
                            </asp:DropDownList></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDestinationState"  validationgroup="Details" runat="server" ControlToValidate="ddlDestinationState" ErrorMessage="State is required" ForeColor="red"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:DropDownList runat="server" class="city" ID="ddlDestinationCity" AutoPostBack="True">
                                <asp:ListItem runat="server" Value="select">choose city</asp:ListItem>
                            </asp:DropDownList></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDestinationCity"  validationgroup="Details" runat="server" ControlToValidate="ddlDestinationCity" ErrorMessage="City is required" ForeColor="red"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td class="label">Select date</td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxDateOfJourney" type="date"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorStartDate"  validationgroup="Details" runat="server" ControlToValidate="tbxDateofJourney" ErrorMessage="Date is required" ForeColor="red"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td class="label">Select return date</td>
                        <td>
                            <asp:TextBox runat="server" ID="tbxReturnDate" type="date"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorReturnDate"  validationgroup="Details" runat="server" ControlToValidate="tbxReturnDate" ErrorMessage="Date is required" ForeColor="red"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td class="label">Mode of transport</td>
                        <td>
                            <asp:RadioButtonList ID="rblMode"  validationgroup="Details" runat="server">
                                <asp:ListItem Text="Train" Value="Train" />
                                <asp:ListItem Text="Bus" Value="Bus" />
                                <asp:ListItem Text="Car" Value="Car" />
                            </asp:RadioButtonList>
                          <%--  <input class="radio" id="rbtTrain" name="chooseone" type="radio" selected="true" value="train">Train
          <input class="radio" id="rbtBus" name="chooseone" type="radio" value="bus">Bus
          <input class="radio" id="rbtCar" name="chooseone" type="radio" value="car">Car--%>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="button" class="state"  validationgroup="Details" runat="server" Text="Submit" OnClick="Submit_Click"></asp:Button></td>
                    </tr>
                </table>
                <asp:Label ID="lblDates" runat="server"></asp:Label>
            </div>
        </div>
        <asp:Label ID="lblInfo" runat="server" ForeColor="red"></asp:Label>
    </form>
<%--    <footer>
        <div class="wrap">
            <h1>Travel way</h1>
            <p>Feedback&nbsp&nbsp&#8226&nbsp&nbspTerms and conditions&nbsp&nbsp&#8226&nbsp&nbspPrivacy Policy</p>
            <h6>&#169; Copyrights 2016 travelway.com All Rights Reserved</h6>
        </div>
    </footer>--%>
</body>
</html>


