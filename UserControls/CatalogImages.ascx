<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CatalogImages.ascx.cs" Inherits="UserControls_CatalogImages" %>
<div>
    
        Select Cataloge
        <br />
        <asp:DropDownList ID="ddlCatalog" runat="server" AppendDataBoundItems="True" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
            <asp:ListItem Value="none">--Select--</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCatalog" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" InitialValue="none" SetFocusOnError="True" ValidationGroup="3">*</asp:RequiredFieldValidator>
        <br />
        Image<br />
        <asp:FileUpload ID="fupImage" runat="server" />
        <br />
        Description<br />
        <asp:TextBox ID="txtDesc" runat="server" Height="104px" TextMode="MultiLine" 
            Width="315px"></asp:TextBox>
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="3">*</asp:RequiredFieldValidator>
    
        <br />
    
    </div>
    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" ValidationGroup="3" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Store %>" 
        SelectCommand="SELECT [Id], [Name] FROM [Products]"></asp:SqlDataSource>