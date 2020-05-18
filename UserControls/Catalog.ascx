<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Catalog.ascx.cs" Inherits="UserControls_Catalog" %>

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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" InitialValue="none" SetFocusOnError="True" ValidationGroup="2">*</asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="2">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" style="text-align: right">
                    Price</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="2">*</asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDecBrief" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="2">*</asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDesciptionFull" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="2">*</asp:RequiredFieldValidator>
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
                <td class="style1" style="text-align: right">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" 
                        Width="72px" ValidationGroup="2" />
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