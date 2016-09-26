<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IfMany.aspx.cs" Inherits="IfMany" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Planning Data</title>
  <link rel="stylesheet" href="city.css"/>
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="HandheldFriendly" content="true"/>
    <style type="text/css">
        #form1 {
            margin-top: 0px;
        }
        .GridView {
            margin-left: 24px;
        }
    </style>
</head>
<body>
    <header>
    <div class="img">
        <img id="head" src="head.png" height="100px"/>
    </div>
    </header>
    <div>
        <form id="form1" runat="server">
            <asp:GridView ID="GridViewUserData" runat="server" AllowPaging="True" CssClass="GridView" AutoGenerateColumns="False" OnRowEditing="GridViewUserData_EditRow" OnRowCancelingEdit="GridViewUserData_CancelEdit" OnRowUpdating="GridViewUserData_UpdateRow" OnRowDeleting="GridViewUserData_DeleteRow" CellPadding="4" ForeColor="#333333" GridLines="None">
        
            <AlternatingRowStyle BackColor="White" />
        
            <Columns>
                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("planID") %>' runat="server" CommandName="Edit" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("planID") %>' runat="server" CommandName="Delete" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("planID") %>' runat="server" CommandName="Update" Text="Update">
                           </asp:LinkButton>
                           <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("planID") %>' runat="server" CommandName="Cancel" Text="Cancel">
                           </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Plan ID">
                        <ItemTemplate>
                            <asp:Label ID="lblplanID" runat="server" Text='<%# Eval("planID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User ID">
                        <ItemTemplate>
                            <asp:Label ID="lbluserId" runat="server" Text='<%# Eval("userId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Point">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxstartPoint" runat="server" Text='<%# Eval("startPoint") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblstartPoint" runat="server" Text='<%# Eval("startPoint") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Destination">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxDestination"  runat="server" Text='<%# Eval("destination") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblDestination" runat="server" Text='<%# Eval("destination") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="From Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxfromDate" runat="server" Text='<%# Eval("fromDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblfromDate" runat="server" Text='<%# Eval("fromDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="To Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxtoDate" runat="server" Text='<%# Eval("toDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbltoDate" runat="server" Text='<%# Eval("toDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mode">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxMode" runat="server" Text='<%# Eval("modeId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMode" runat="server" Text='<%# Eval("modeId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
    <asp:HyperLink ID="linkHome" runat="server" href="UserHomePage.aspx"></asp:HyperLink>
    </form>
        </div>
</body>
</html>
