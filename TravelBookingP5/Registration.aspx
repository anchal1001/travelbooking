<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Way | Sign Up</title>
</head>
<style>            
body{
  background: rgb(230,230,230);
}

.txt{
  display: inline;
  float:left;
  color: rgb(0,100,240);
  font-family: cursive;
  position: absolute;
  font-size: 3em;
  margin-left: 5%;
  top: -1em;
}

#img{
  float: left;
  margin-top: 1.5%;
}


#register{
  position: absolute;
  top:53%;
  width:50%;
  left: 0%;
  padding: 18px 6% 60px 6%;
  margin: 0 20% 10% 20%;
  background: rgb(247,247,247);
  box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7),
              0px 0px 8px 5px rgba(208, 223, 226, 0.4)inset;
  border-radius: 5px;
        height: 1104px;
    }

#container h1{
  font-size: 3em;
  color: #000;
  padding: 10px 0 10px 0;
  font-family: Calibri;
  text-align: center;
  margin-top: 8%;
  padding-bottom: 30px;
}
#register input{
  width: 92%;
  margin-top: 4px;
  padding: 10px 5px 10px 32px;
  border: 1px solid rgb(178,178,178);
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

#register label{
  font-size: 1em;

}

#register p.button input{
  width: 30%;
  cursor: pointer;
  background: rgb(61, 157, 179);
  padding: 8px 5px;
  color: #fff;
  font-size: 24px;
  border: 1px solid rgb(28, 108, 122);
  margin-bottom: 10px;
  text-shadow: 0 1px 1px rgba(0,0,0,0.5);
  border-radius: 3px;
  box-shadow: 0px 1px 6px 4px rgba(0,0,0,0.07)inset,
              0px 0px 0px 3px rgb(254,254,254),
              0px 5px 3px 3px rgb(210,210,210);
  transition: all 0.2s linear;
}
</style>
<body onload="resetForm()">
    <header>
        <div class="txt">
            <p><img id="img" src="logo.png" width="70em" height="70em" />travel way</p>
        </div>
    </header>
    <form id="form1" runat="server">
    <div id="container">
        <h1>Create your account</h1>
        <p><asp:Label ID="lblInfo" runat="server"  ForeColor="red"></asp:Label></p>
        <div id="register">
        <p>
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="tbxName" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="419px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server"  ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="tbxEmail" input type="email" runat="server" style="margin-left: 0px; margin-top: 0px" OnTextChanged="tbxEmail_TextChanged" Width="418px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server"  ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
        <p>
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="tbxPassword" input type="password" runat="server" style="margin-left: 0px; margin-top: 0px" Width="420px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" controltovalidate="tbxPassword" ErrorMessage="Password is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="tbxConfirmPassword" input type="password" runat="server" style="margin-left: 0px; margin-top: 0px" Width="421px"></asp:TextBox>
                <asp:CompareValidator ErrorMessage="Passwords do not match" runat="server" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" ForeColor="red"></asp:CompareValidator>
        </p>
        <p>
                <asp:Label ID="lblSecQues" runat="server" Text="Security Question"></asp:Label>
                <p><asp:DropDownList ID="dropQues" runat="server" Height="38px" style="margin-left: 0px; margin-top: 0px" Width="458px">
                    <asp:ListItem Selected="True" Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">Favourite Color</asp:ListItem>
                    <asp:ListItem Value="2">Favourite Animal</asp:ListItem>
                    <asp:ListItem Value="3">Favourite Movie</asp:ListItem>
                    <asp:ListItem Value="4">Favourite Actor</asp:ListItem>
                </asp:DropDownList></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQues" runat="server" controltovalidate="dropQues"  OnClick="SelectDrop()" ForeColor="red">Security Question is required</asp:RequiredFieldValidator>
        <p>
                <asp:Label ID="lblAns" runat="server" Text="Answer"></asp:Label>
                <asp:TextBox ID="tbxAns" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="426px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAns" runat="server" controltovalidate="tbxAns" ErrorMessage="Answer is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblRole" runat="server" Text="Sign Up As"></asp:Label>
                <p><asp:DropDownList ID="dropRoles" runat="server" style="margin-left: 0px; margin-top: 0px" Height="38px" Width="464px">
                <asp:ListItem Selected="True" Value="">Select</asp:ListItem>
                <asp:ListItem Value="1">Admin</asp:ListItem>
                <asp:ListItem Value="2">User</asp:ListItem>
                </asp:DropDownList></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRoles" runat="server" controltovalidate="dropRoles" OnClick="SelectDrop()" ForeColor="red">Choose your Role</asp:RequiredFieldValidator>
        <p>
                <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="tbxPhone" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="423px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" controltovalidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"  controltovalidate="tbxPhone"  ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
        </p>
        <p>
                <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth"></asp:Label>
                <asp:TextBox ID="tbxDOB" input type="date" runat="server" style="margin-left: 0px; margin-top: 0px" Width="423px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" controltovalidate="tbxDOB" ErrorMessage="Date of birth is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="tbxCity" input type="text" runat="server" style="margin-left: 0px; margin-top: 0px" Width="426px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" controltovalidate="tbxCity" ErrorMessage="City name is required" ForeColor="red"></asp:RequiredFieldValidator>
        </p>
        <p>
                <asp:Button ID="btnNext" runat="server" style="margin-left: 165px" Width="160px" OnClick="btnNext_Click" Font-Bold="True" Text="NEXT" Font-Names="Comic Sans MS" ForeColor="#FF6600" BackColor="#FFFFCC" Font-Size="Large" />        
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
