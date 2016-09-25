<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Way | Sign Up</title>
</head>
<style>            
body{
  font-family: sans-serif;
  height: 100vh;
  background: url("background.jpg") 50% fixed;
  background-size: cover;
}

.img{
  border-bottom: 1px solid #fff;
}

#head{
  display: block;
  height: 100px;
  width: 240px;
  margin: auto;
}


#register{
  position: absolute;
  top:250px;
  width:50%;
  left: 0;
  padding: 18px 6% 60px 6%;
  margin: 0 20% 10% 20%;

  border: 1px solid rgba(0,0,0, 0.8);
  box-shadow: 0pt 2px 5px rgba(0,0,0, 0.7),
              0px 0px 8px 5px rgba(0,0,0, 0.4)inset;
  border-radius: 5px;
  background:#fff;
}

h1{
  font-size: 3em;
  color: #fff;
  padding: 40px 0 10px 0;
  font-family: arial;
  text-align: center;
  text-shadow: 0 1px 1px rgba(255,255,255,0.5);
  margin-top: 0px;
  padding-bottom: 30px;
}

input[type=text],input[type=email],input[type=password],input[type=date]{
  width: 92%;
  margin-top: 4px;
  padding: 10px 5px 10px 32px;
  border: 1px solid rgba(0,0,0,0.8);
  box-sizing: content-box;
  border-radius: 3px;
  box-shadow: 0px 1px 4px 0px rgba(168,168,168,0.6);
  transition: all 0.2s linear;
}

#register input:active, #register input:focus{
  outline: none;
  border: 1px solid rgba(91, 90, 90, 0.7);
  background: rgba(238, 236, 240, .2);
  box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9)inset;
}

#register select{
  width: 98%;
  margin-top: 4px;
  padding: 10px 5px 10px 32px;
}

 #register option{
  font-size: 1em;
 }

#register{
  font-size: 1em;
  color: black;

}

#btnNext {
      width: 10vw;
  cursor: pointer;
  background: #2196F3;
  color: #fff;
  padding: 12px 2px;
  font-size: 24px;
  border: 1px solid rgb(28, 108, 122);
  margin-top: 20px;
  margin-bottom: 10px;
  text-shadow: 0 1px 1px rgba(0,0,0,0.5);
  border-radius: 50px;
  transition: all 0.2s linear;

}

.changelink{
  color: #fff;
  font-size: 1em;
}

a{
  color: #fff;
  font-size: 1em;
  text-decoration: none;
}

footer a{
  display: block;
  padding-top: 50px;
  text-align: center;
  color: #fff;
  font-weight: normal;
  text-shadow: 0px -1px 0px rgba(0,0,0,0.2);
  font-size: 1.5em;
  margin-top: 980px;
  margin-bottom: 100px;

}

</style>
<body onload="resetForm()">
    <header>
    <div class="img">
        <img id="head" src="head.png" height="100px"/>
    </div>
  </header>
  
    <form id="form1" runat="server">
    <div id="container">
        <h1>Create your account</h1>
        <p><asp:Label ID="lblInfo" runat="server"  ForeColor="red"></asp:Label></p>
        <div id="register">
        <p>
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                <p><asp:TextBox ID="tbxName" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="500px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic"  ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <p></p><asp:TextBox ID="tbxEmail" input type="email" runat="server" style="margin-left: 0px; margin-top: 0px" Width="500px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic"  ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <p><asp:TextBox ID="tbxPassword" input type="password" runat="server" style="margin-left: 0px; margin-top: 0px" Width="500px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" Display="Dynamic" controltovalidate="tbxPassword" ErrorMessage="Password is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <p><asp:TextBox ID="tbxConfirmPassword" input type="password" runat="server" style="margin-left: 0px; margin-top: 0px" Width="500px"></asp:TextBox></p>
                <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" Display="Dynamic" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" ForeColor="red"></asp:CompareValidator>
        </p>
        <p>
                <asp:Label ID="lblSecQues" runat="server" Text="Security Question"></asp:Label>
                <p><asp:DropDownList ID="dropQues" runat="server" Height="38px" style="margin-left: 0px; margin-top: 0px" Width="545px">
                    <asp:ListItem Selected="True" Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">Favourite Color</asp:ListItem>
                    <asp:ListItem Value="2">Favourite Animal</asp:ListItem>
                    <asp:ListItem Value="3">Favourite Movie</asp:ListItem>
                    <asp:ListItem Value="4">Favourite Actor</asp:ListItem>
                </asp:DropDownList></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQues" runat="server" Display="Dynamic" controltovalidate="dropQues"  OnClick="SelectDrop()" ForeColor="red">Security Question is required</asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblAns" runat="server" Text="Answer"></asp:Label>
                <p><asp:TextBox ID="tbxAns" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="500px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAns" runat="server" Display="Dynamic" controltovalidate="tbxAns" ErrorMessage="Answer is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblRole" runat="server" Text="Sign Up As"></asp:Label>
                <p><asp:DropDownList ID="dropRoles" runat="server" style="margin-left: 0px; margin-top: 0px" Height="38px" Width ="545px">
                <asp:ListItem Selected="True" Value="">Select</asp:ListItem>
                <asp:ListItem Value="1">Admin</asp:ListItem>
                <asp:ListItem Value="2">User</asp:ListItem>
                </asp:DropDownList></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRoles" runat="server" Display="Dynamic" controltovalidate="dropRoles" OnClick="SelectDrop()" ForeColor="red">Choose your Role</asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                <p><asp:TextBox ID="tbxPhone" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="500px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" controltovalidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" controltovalidate="tbxPhone"  ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
        </p>
        <p>
                <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth"></asp:Label>
                <p><asp:TextBox ID="tbxDOB" input type="date" runat="server" style="margin-left: 0px; margin-top: 0px" Width="540px" Height="28px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" Display="Dynamic" controltovalidate="tbxDOB" ErrorMessage="Date of birth is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                <p><asp:TextBox ID="tbxCity" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="512px"></asp:TextBox></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" controltovalidate="tbxCity" ErrorMessage="City name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Button CssClass="button" ID="btnNext" Text="Sign Up" runat="server" OnClick="btnNext_Click"/>        
        </p>
    
    </div>
    </form>
    <script>
        function resetForm()
        {
            document.getElementById("tbxName").value = "";
            document.getElementById("tbxEmail").value = "";
            document.getElementById("tbxPassword").value = "";
            document.getElementById("tbxConfirmPassword").value = "";
            document.getElementById("dropQues").value = "";
            document.getElementById("tbxAns").value = "";
            document.getElementById("dropRoles").value = "";
            document.getElementById("tbxPhone").value = "";
            document.getElementById("tbxDOB").value = "";
            document.getElementById("tbxCity").value = "";
        }
        function SelectDrop()
        {
            if(document.getElementById("dropRoles").value=="")
                document.getElementById("dropRoles").innerHTML = "Choose your Role";
            if (document.getElementById("dropQues").value == "")
                document.getElementById("dropQues").innerHTML = "Select a Security Question";
        }

        
    </script>
</body>
</html>
