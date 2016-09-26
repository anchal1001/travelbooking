<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataRegistration.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
                            <asp:TextBox ID="tbxDOB" runat="server" Text='<%# Eval("DOB") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
