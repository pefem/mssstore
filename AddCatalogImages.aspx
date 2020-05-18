<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCatalogImages.aspx.cs" Inherits="AddCatalogImages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Select Cataloge
        <br />
        <asp:DropDownList ID="ddlCatalog" runat="server" AppendDataBoundItems="True" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
            <asp:ListItem>--Select--</asp:ListItem>
        </asp:DropDownList>
        <br />
        Image<br />
        <asp:FileUpload ID="fupImage" runat="server" />
        <br />
        Description<br />
        <asp:TextBox ID="txtDesc" runat="server" Height="104px" TextMode="MultiLine" 
            Width="315px"></asp:TextBox>
    
    </div>
    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StoredbConnectionString %>" 
        SelectCommand="SELECT [Id], [Name] FROM [Products]"></asp:SqlDataSource>
    </form>
</body>
</html>
