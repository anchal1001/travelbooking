<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CityData.aspx.cs" Inherits="CityData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridViewCity" runat="server" AllowPaging="true" AutoGenerateColumns="false" DataKeyNames="cityID"  DataSourceID="SqlDataSourceRegistration">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                
           
                 </Columns> 
                 </asp:GridView>
            </div>  
    </form>
</body>
</html>
