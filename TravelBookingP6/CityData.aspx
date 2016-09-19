<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CityData.aspx.cs" Inherits="CityData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridViewCity" runat="server" AllowPaging="false" AutoGenerateColumns="false" OnRowEditing="GridViewCity_EditRow" OnRowCancelingEdit="GridViewCity_CancelEdit" OnRowUpdating="GridViewCity_UpdateCity" OnRowDeleting="GridViewCity_DeleteRow">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("cityId") %>' runat="server" CommandName="Edit" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("cityId") %>' runat="server" CommandName="Delete" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("cityId") %>' runat="server" CommandName="Update" Text="Update">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("cityId") %>' runat="server" CommandName="Cancel" Text="Cancel">
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City ID">
                        <ItemTemplate>
                            <asp:Label ID="lblCityId" runat="server" Text='<%# Eval("cityId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbxCityId" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("cityName") %>'></asp:Label>
                        </ItemTemplate>    
                        <FooterTemplate>
                            <asp:TextBox ID="tbxCityName" runat="server"></asp:TextBox>
                        </FooterTemplate>                    
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add City" OnClick ="GridViewCity_InsertCity" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns> 
             </asp:GridView>
        </div>  
    </form>
</body>
</html>
