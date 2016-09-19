<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminData.aspx.cs" Inherits="AdminData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style= "background-image:url(back2.jpg);">
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" Height="133px" ImageUrl="~/logo.png" Width="147px" />
        <asp:Label ID="TravelWay" runat="server" Text="Travel Way" style="font-family: cursive; color: #000; margin-top: 0px;" Font-Size="XX-Large" Height="50px" Width="200px"></asp:Label>
        <p></p>
        <p></p>
    <asp:GridView ID="GridViewAdminData" runat="server" AutoGenerateColumns="False" OnRowEditing="GridViewAdminData_EditRow" OnRowCancelingEdit="GridViewAdminData_CancelEdit" OnRowUpdating="GridViewAdminData_UpdateRow" OnRowDeleting="GridViewAdminData_DeleteRow" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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
                <asp:TemplateField HeaderText="Admin ID">
                        <ItemTemplate>
                            <asp:Label ID="lblAdminID" runat="server" Text='<%# Eval("AdminID") %>'></asp:Label>
                        </ItemTemplate>
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
                            <asp:TextBox ID="tbxCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Approved">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxApprove" runat="server" Text='<%# Eval("Approved") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblApprove" runat="server" Text='<%# Eval("Approved") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Admin Request">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Add Admin" OnClick="btnApprove_Click"  />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Add Admin" OnClick="btnApprove_Click"  />
                        </EditItemTemplate>
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
    </div>
    </form>
</body>
</html>
