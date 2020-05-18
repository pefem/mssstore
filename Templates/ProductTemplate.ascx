<%@ Control Language="C#" ClassName="ProductTemplate" %>


<div class="productName">

</div>    
<div>
<asp:Image
    id="imgProduct"
    Visible='<%# Eval("HasImage") %>'
    ImageUrl='<%# Eval("Id", "~/ProductImage.ashx?id={0}") %>'
    AlternateText='<%# Eval("ImageAltText") %>'
    CssClass="productImage"
    Runat="server" />
    <br />
<%# Eval("Name") %>
<br />
 <asp:Image ID="myImage" ImageUrl="../bwres/images/naira.png" runat="server" /><%# Eval("Price") %>

<br style="clear:both" />
<asp:HyperLink
    id="lnkView"
    Text="View Details"
    NavigateUrl='<%# Eval("Id", "~/ProductDetails.aspx?pid={0}") %>'
    Runat="server" Font-Bold="False" ForeColor="#0099CC" />


</div>
