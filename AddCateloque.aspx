<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCateloque.aspx.cs" Inherits="AddCateloque" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 405px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1" style="text-align: right">
                    Category</td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="Id">
                        <asp:ListItem Value="none">--Category--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Store %>" 
                        SelectCommand="SELECT [Id], [Title] FROM [Categories]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Product Name</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Price</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Description</td>
                <td>
                    <asp:TextBox ID="txtDecBrief" runat="server" Height="67px" TextMode="MultiLine" 
                        Width="229px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Full Description</td>
                <td>
                    <asp:TextBox ID="txtDesciptionFull" runat="server" Height="67px" 
                        TextMode="MultiLine" Width="229px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Image Alternate Text</td>
                <td>
                    <asp:TextBox ID="txtAlText" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Catalog Initial Image</td>
                <td>
                    <asp:FileUpload ID="fupImage" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Catalog PDF</td>
                <td>
                    <asp:FileUpload ID="fupPDF" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
