<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
    <title></title>
</head>
<body>

      <form id="form1" runat="server">
          <button class="btn"><a href="Home.aspx" style="color:darkgrey;text-decoration:none">Home</a></button>
           <asp:GridView ID="GridViewData" runat="server" AllowPaging="False" AutoGenerateColumns="false" >
            <Columns>
                                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("cityId") %>' runat="server" CommandName="Visit" Text="Visit" href="../Explore.aspx">
                            </asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>

     <asp:TemplateField HeaderText="City Id">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCityId" runat="server" Text='<%# Eval("cityId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCityId" runat="server" Text='<%# Eval("cityId") %>'></asp:Label>
                        </ItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxcityName" runat="server" Text='<%# Eval("cityName") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblcityName" runat="server" Text='<%# Eval("cityName") %>'></asp:Label>
                        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="State Id">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                            <asp:Label ID="lblStateId" runat="server" Text='<%# Eval("stateId") %>'></asp:Label>
                        </ItemTemplate>
      </asp:TemplateField>
   </Columns>
               </asp:GridView>
          <asp:Label ID="lblInfo" runat="server" ForeColor="red"></asp:Label>
    </form>

</body>

</html>
