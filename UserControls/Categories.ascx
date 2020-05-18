<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Categories.ascx.cs" Inherits="UserControls_Categories" %>


<style type="text/css">
    .style1
    {
        width: 509px;
    }
</style>



<table style="width:100%;">
    <tr>
        <td class="style1" style="text-align: right">
            Name</td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Width="230px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1" style="text-align: right">
            Description</td>
        <td>
            <asp:TextBox ID="txtDescription" runat="server" Height="65px" 
                TextMode="MultiLine" Width="228px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" ValidationGroup="1" />
        &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" Enabled="False" 
                onclick="btnSave_Click" CausesValidation="False" />
        &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                onclick="btnCancel_Click" CausesValidation="False" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td>
            <br />

            <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" Width="725px" ForeColor="Black"
                            
                            
    EmptyDataText="No categories found!" onrowcommand="grdCategories_RowCommand">
                        <Columns>
                          <asp:TemplateField>
                    <ItemTemplate>
                       <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="false" 
                            CommandArgument='<%# Bind("Id") %>' CommandName="Edt" ForeColor="Maroon" 
                            Text="Edit" ToolTip="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="1%" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                         <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="false" 
                            CommandArgument='<%# Bind("Id") %>' CommandName="Del" ForeColor="Maroon" 
                            onclientclick="return confirm(&quot;Do you want to delete Entry?&quot;)" 
                            Text="Delete" ToolTip="Delete"></asp:LinkButton>
                            
                           
                    </ItemTemplate>
                    <ItemStyle Width="1%" />
                </asp:TemplateField>
                          <asp:BoundField DataField="Title" HeaderText="Name" />
                          <asp:BoundField DataField="Description" HeaderText="Description" />
                             
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
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>



