<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CityData.aspx.cs" Inherits="CityData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cities Data</title>
  <link rel="stylesheet" href="home.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
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
    <asp:Button ID="btnLogout" runat="server" style="margin-left: 1155px; margin-top: 0px;" Text="LOGOUT" Width="111px" OnClick="btnLogout_Click" BorderStyle="None" BackColor="#333333" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="White" Height="47px" Font-Size="Medium" />
        <asp:GridView ID="GridViewState" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="812px" style="margin-top: 100px; margin-left: 236px;" Height="170px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField HeaderText="State ID">
                        <ItemTemplate>
                            <asp:Label ID="lblStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State Name">
                        <ItemTemplate>
                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("stateName") %>'></asp:Label>
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
            <asp:GridView ID="GridViewCity" runat="server" ShowFooter="True" EnablePaging="True" AutoGenerateColumns="False" OnRowEditing="GridViewCity_EditRow" OnRowCancelingEdit="GridViewCity_CancelEdit" OnRowUpdating="GridViewCity_UpdateCity" OnRowDeleting="GridViewCity_DeleteRow" CellPadding="4" ForeColor="Black"  Width="812px" style="margin-top: 100px; margin-left: 236px;" Height="170px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CommandArgument='<%# Eval("cityId") %>' CommandName="Edit" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%# Eval("cityId") %>'  CommandName="Delete" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CommandArgument='<%# Eval("cityId") %>'  CommandName="Update" Text="Update">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" runat="server" CommandArgument='<%# Eval("cityId") %>' CommandName="Cancel" Text="Cancel">
                            </asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add City" OnClick ="GridViewCity_InsertCity" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City ID">
                        <ItemTemplate>
                            <asp:Label ID="lblCityId" Text='<%# Container.DataItemIndex + 1 %>'  runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCityId" runat="server" Text='<%# Eval("cityId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxCityId" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City Name">
                        <ItemTemplate>
                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxCityName" runat="server"></asp:TextBox>
                        </FooterTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State ID">
                        <ItemTemplate>
                            <asp:Label ID="lblStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:Label>
                        </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxStateId" runat="server"></asp:TextBox>
                        </FooterTemplate> 
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
</body>
</html>
