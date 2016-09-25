<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Personals.aspx.cs" Inherits="Personals" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>
            <asp:GridView ID="GridViewData" runat="server" AllowPaging="False" AutoGenerateColumns="false" OnRowEditing="GridViewData_EditRow" OnRowCancelingEdit="GridViewData_CancelEdit" OnRowUpdating="GridViewData_UpdateRow" OnRowDeleting="GridViewData_DeleteRow">
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
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxPassword" runat="server" Text='<%# Eval("PW") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("PW") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Security Question">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxQues" runat="server" Text='<%# Eval("SecurityQuestion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQues" runat="server" Text='<%# Eval("SecurityQuestion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxAns" runat="server" Text='<%# Eval("Answer") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAns" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxRole" runat="server" Text='<%# Eval("Category_Id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRole" runat="server" Text='<%# Eval("Category_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
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
                            <asp:TextBox ID="tbxCity" runat="server" Text='<%# Eval("ZIP") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("ZIP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
  background: #343d46;
}
        .box{
  margin: 1em auto;
  margin-right: 0;
  width:35em;
  height:3em;
}
.container-1{
  overflow: hidden;
  width:35em;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <div class="container-1">
        <table border ="1">
            <tr>
                <td>
                    <asp:Label ID="lblRegID" runat="server" Texxt="RegID"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblRegIdAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>

                </td>
                <td>
                    <asp:Label ID ="lblNameAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmailAns" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPW" runat="server" Text="PW"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblPWAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSecurityQuestion" runat="server" Text="SecurityQuestion"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblSecurityQuestionAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblAnswerAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCategory_Id" runat="server" Text="Category_Id"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblCategory_IdAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone number"></asp:Label>
                </td>
                <td>
                    <asp:Label ID ="lblPhoneAns" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
        <asp:HyperLink ID="linkChangePassword" runat="server" NavigateUrl="~/ChangePassword.aspx">Change Password</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="gotoHome" runat="server" NavigateUrl="~/UserHomePage.aspx">Back</asp:HyperLink>
                </td>
            </tr>
            </table>
                </div>
            </div>
    </form>
</body>
</html>
