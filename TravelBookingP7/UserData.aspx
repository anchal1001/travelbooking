<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserData.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users Data</title>
  <link rel="stylesheet" href="home.css"/>
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="HandheldFriendly" content="true"/>
    <style type="text/css">
        #form1 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
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
                        <li><a href="home2.aspx">Home</a></li>
                        <li><a href="#">Explore</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="AdminHome.aspx">Back</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <asp:Button ID="btnLogout" runat="server" style="margin-left: 1170px; margin-top: 0px;" Text="LOGOUT" Width="111px" OnClick="btnLogout_Click" BorderStyle="None" BackColor="#333333" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="White" Height="47px" Font-Size="Medium" />
            
        <asp:GridView ID="GridViewData" runat="server" AutoGenerateColumns="False" OnRowEditing="GridViewData_EditRow" OnRowCancelingEdit="GridViewData_CancelEdit" OnRowUpdating="GridViewData_UpdateRow" OnRowDeleting="GridViewData_DeleteRow" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" style="margin-left: 47px; margin-top: 40px;" Width="824px">
            <Columns>
                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Edit" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Delete" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Update" Text="Update">
                           </asp:LinkButton>
                           <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("RegId") %>' runat="server" CommandName="Cancel" Text="Cancel">
                           </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reg ID">
                        <ItemTemplate>
                            <asp:Label ID="lblRegID" runat="server" Text='<%# Eval("RegID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Display="Dynamic"  ControlToValidate="tbxName" ErrorMessage="Name is required" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic"  ControlToValidate="tbxEmail" ErrorMessage="Email is required" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Encrypted Password">
                        <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("PW") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="New Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxNewPassword" runat="server" input type="password"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Security Question">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxQues" runat="server" Text='<%# Eval("SecurityQuestion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorQues" runat="server" Display="Dynamic" controltovalidate="tbxQues" ForeColor="red">Security Question is required</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQues" runat="server" Text='<%# Eval("SecurityQuestion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxAns" runat="server" Text='<%# Eval("Answer") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAns" runat="server" Display="Dynamic" controltovalidate="tbxAns" ErrorMessage="Answer is required" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAns" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" controltovalidate="tbxPhone" ErrorMessage="Phone is required" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" Display="Dynamic" controltovalidate="tbxPhone"  ValidationExpression="[0-9]{10}" ErrorMessage="Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Of Birth">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxDOB" runat="server" input type="date" Text='<%# Eval("DOB") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDOB" runat="server" input type="date" Text='<%# Eval("DOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" controltovalidate="tbxCity" ErrorMessage="City name is required" ForeColor="red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        
    </form>
        </div>
</body>
</html>
