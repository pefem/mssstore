<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageOrders.ascx.cs" Inherits="UserControls_ManageOrders" %>


                        <asp:GridView ID="grdDownload" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" Width="725px" ForeColor="Black"
                            
                            
    EmptyDataText="There are no items in your account for download. Please make purchase to download items">
                        <Columns>
                          <asp:BoundField DataField="UserName" HeaderText="Customer" />
                          <asp:BoundField DataField="Name" HeaderText="Product Name" />
                          <asp:BoundField DataField="Price" HeaderText="Price" />
                           <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                               
                               <asp:HyperLinkField Text="View PDF" 
                                DataNavigateUrlFormatString="~/Download.ashx?Id={0}" DataNavigateUrlFields="Id"  
                                HeaderStyle-ForeColor="Black">
                                   <ControlStyle ForeColor="Black" />
                                   <HeaderStyle ForeColor="Black" />
                            <ItemStyle ForeColor="Black" />
                            </asp:HyperLinkField>
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
                        

