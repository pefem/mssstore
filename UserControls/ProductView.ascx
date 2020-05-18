<%@ Control Language="C#" ClassName="ProductView" %>
<%--<%@ OutputCache Duration="99999" Shared="true" VaryByParam="id" SqlDependency="StoreDB:Products" %>--%>
<%@ Register tagPrefix="user" tagName="ProductTemplate" src="~/Templates/ProductTemplate.ascx" %>

<script runat="server">

    /// <summary>
    /// Get products contained in Category represented by current SiteMapNode
    /// </summary>
    protected void srcProducts_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        //e.InputParameters["CategoryId"] = SiteMap.CurrentNode.Key;
        Trace.Warn("Selecting products from database");
    }


    
</script>


<asp:DataList
    id="dlstProducts"
    DataSourceID="srcProducts"
    RepeatColumns="4"
    CssClass="productList"
    Runat="server" CellPadding="50" GridLines="Vertical">
    <ItemTemplate>
    <asp:Image
    id="imgProduct"
    Visible='<%# Eval("HasImage") %>'
    ImageUrl='<%# Eval("Id", "~/ProductImage.ashx?id={0}") %>'
    AlternateText='<%# Eval("ImageAltText") %>'
    CssClass="productImage"
    Runat="server" />
    <br />
<%# Eval("Name") %>

<%-- <asp:Image ID="myImage" ImageUrl="../bwres/images/naira.png" runat="server" /><%# Eval("Price") %>--%>

<br style="clear:both" />
<asp:HyperLink
    id="lnkView"
    Text="View Details"
    NavigateUrl='<%# Eval("Id", "~/ProductDetails.aspx?pid={0}") %>'
    Runat="server" Font-Bold="False" ForeColor="#0099CC" />


       
    </ItemTemplate>
   

</asp:DataList>


<asp:ObjectDataSource
    id="srcProducts"
    TypeName="ShoppingCart.Product"
    SelectMethod="SelectByCategoryId"
    Runat="server" OnSelecting="srcProducts_Selecting">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlCategory" Name="CategoryId" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
