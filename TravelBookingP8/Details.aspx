<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="map" style="width:100%;height:500px"></div>
    <div>
        <asp:Label ID="lblStartFrom" runat="server" Text="From"></asp:Label>
        <asp:Label ID="lblDestinationCity" runat="server" Text="To"></asp:Label>
        <asp:Label ID="lblMode" runat="server" Text="Mode"></asp:Label>
        <asp:RadioButton ID="rbtnCar" runat="server" Text="Car" GroupName="Mode" />
        <asp:RadioButton ID="rbtnBus" runat="server" Text="Bus" GroupName="Mode" />
        <asp:RadioButton ID="rbtnTrain" runat="server" Text="Train" Checked="True" GroupName="Mode" />
        <asp:RadioButton ID="rbtnFlight" runat="server" Text="Flight" GroupName="Mode" />
        <br />
        <asp:Label ID="lblDateOfJourney" runat="server" Text="Date of journey"></asp:Label>
        <asp:TextBox ID="tbxDateOfJourney" input type="date" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblReturnDate" runat="server" Text="Return Date"></asp:Label>
        <asp:TextBox ID="tbxReturnDate" input type="date" runat="server"></asp:TextBox>
    
    </div>
        <asp:Label ID="lblHotels" runat="server" >Hotels</asp:Label>
        <asp:DropDownList ID="ddlHotels" runat="server">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
         <asp:Button id="btnSubmit" runat="server" Text="Submit" OnClick="Submit_Click"/>
        <asp:Label ID="lblDates" runat="server" ></asp:Label>
    </form>
    <script>
function myMap() {
  var mapCanvas = document.getElementById("map");
  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.2),
    zoom: 10
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);
}
</script>

<script src="https://maps.googleapis.com/maps/AIzaSyAoDqPeaFVEITr2tpxOvU30wRmrxCnlrwo/js?callback=myMap"></script>
</body>
</html>
