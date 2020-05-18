<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>
<%@ Register tagPrefix="user" tagName="ProductView" src="~/UserControls/ProductView.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>MSS Store</title>

    <!-- Bootstrap core CSS -->
    <link href="bwres/css/bootstrap.min.css" rel="stylesheet">
	<link href="bwres/css/style.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="bwres/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
     <style type="text/css">
         .style1
         {
             width: 790px;
         }
         .nav-tabs {
             border-bottom: 1px solid #ddd;
             background-color: #555;
         }
         .pdetails {
             padding-left:0px;
             border:2px;
             border-bottom-color:aliceblue;
             padding-left:350px;
             background-color:aliceblue;
             height:300px;
         }

     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container wrapper">
      <div class="masthead">
	 <ul class="nav nav-justified">
          <li><a href="Default.aspx">Home</a></li>
          <li><a href="faqs.html">Faqs</a></li>
          <li><a href="terms.html">Terms</a></li>
          <li><a href="contact.html">Contact</a></li>
        </ul>
      </div>
      <!-- Example row of columns -->
      <div class="row">
			<div class="header-area">
			    <table style="width:100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/bwres/images/favourite.jpg" 
                                Height="23px" />
                            <asp:LoginView ID="LoginView2" runat="server">
                                <LoggedInTemplate>
                                    Hi,
                                    <asp:LoginName ID="LoginName1" runat="server" />
                                    ,
                                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black" OnClick="LinkButton2_Click1">My Profile</asp:LinkButton>
                                    ,
                                </LoggedInTemplate>
                            </asp:LoginView>
&nbsp;<asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="Black" LogoutAction="Redirect" 
                                LogoutPageUrl="~/Default.aspx" />
&nbsp;<asp:LoginView ID="LoginView1" runat="server">
                                <LoggedInTemplate>
                                    <asp:ImageButton ID="ImageButton2" runat="server" 
                                ImageUrl="~/bwres/images/Edit.gif" 
    ToolTip="My Account" />
                                </LoggedInTemplate>
                            </asp:LoginView>
                            &nbsp; |
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/bwres/images/cart3.png" 
                                Height="21px" />
                            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                                onclick="LinkButton1_Click">View Cart</asp:LinkButton>
                            (<asp:Label ID="lblCount" runat="server" style="font-weight: 700"></asp:Label>
                            ) </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
			</div>
		
    <div style="float: left; padding: 6px; text-align: center;">
   <asp:DataList
    id="frmProduct"
    DataSourceID="srcProduct"
    Runat="server">
    <ItemTemplate>
    <asp:Image
    id="imgProduct"
    Visible='<%# Eval("HasImage") %>'
    ImageUrl='<%# Eval("Id", "~/ProductImage.ashx?id={0}") %>'
    style="width:300px"
    Runat="server" />
    </ItemTemplate>   
     
</asp:DataList>
</div>
          <div class="pdetails">

         
    <asp:FormView
    id="FormView1"
    DataSourceID="srcProduct"
    Runat="server">
    <ItemTemplate>
    &nbsp;&nbsp;Name : &nbsp;&nbsp;<b><%#Eval("Name") %></b><br />&nbsp;&nbsp;Price &nbsp;&nbsp;: <b><asp:Image ID="Image3" runat="server" ImageUrl="~/bwres/images/naira.png" /><%# Eval("Price") %></b>
    <br /><br />
    <%# String.IsNullOrEmpty((string)Eval("Description")) ? Eval("Description") : Eval("Description")%>

    </ItemTemplate>    
</asp:FormView>
          <br /><br /><br /><br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" BackColor="#FF9900" 
                BorderColor="#FF9900" BorderStyle="Solid" BorderWidth="1px" 
                Font-Underline="False" Height="24px" NavigateUrl="~/Default.aspx" Width="140px">&lt;&lt;Continue Shopping</asp:HyperLink>
&nbsp;<asp:Button ID="btnAddToCart" runat="server" Text="Add to Shopping Cart " 
                onclick="btnAddToCart_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
    &nbsp;</div>
       </div>
    <asp:ObjectDataSource
    id="srcProduct"
    TypeName="ShoppingCart.Product"
    SelectMethod="Select"
    EnableCaching="true"
    OnSelected="srcProduct_Selected"
    Runat="server">
    <SelectParameters>
    <asp:QueryStringParameter Name="Id" QueryStringField="pid" Type="int32" />
    </SelectParameters>
</asp:ObjectDataSource>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:StoredbConnectionString %>" 
            SelectCommand="SELECT [FullDescription] FROM [Products] WHERE ([Id] = @Id)">
             <SelectParameters>
                 <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
             </SelectParameters>
        </asp:SqlDataSource>
         <br />
         <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Catalog Images</a></li>
    <li><a data-toggle="tab" href="#menu1">Detailed Description</a></li>
    <li><a data-toggle="tab" href="#menu2">How to Buy</a></li>
    <li><a data-toggle="tab" href="#menu3">Comments</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" 
            RepeatColumns="3" RepeatDirection="Horizontal" CellSpacing="10">
        <ItemTemplate>
         <img src="catalogImg/<%#Eval("Image") %>" alt ="" />
            <br />
            
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Eval("Description") %>' />
            <br />
            <br />
        </ItemTemplate>
        </asp:DataList>
        
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:StoredbConnectionString %>" 
            SelectCommand="SELECT [Image], [Description] FROM [ProductImages] WHERE ([ProductId] = @ProductId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductId" QueryStringField="pid"/>
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div>
    <div id="menu1" class="tab-pane fade">
      <br />
      <p>
    <asp:FormView
    id="FormView2"
    DataSourceID="srcProduct"
    Runat="server">
    <ItemTemplate>
  <%--<%#Eval("FullDescription")%>--%>
   <%# String.IsNullOrEmpty((string)Eval("FullDescription")) ? Eval("FullDescription") : Eval("FullDescription")%>

    </ItemTemplate>    
</asp:FormView>
         
         </p>
    </div>
    <div id="menu2" class="tab-pane fade">
       <br />
      <p>You can buy our architectural designs using your Master or VISA cards. Once payment is received, you will be redirected to the download page to download your purchased design.
      Please note that the download links can only be valid within 72 hours of purchased. 
      
      </p>
    </div>
    <div id="menu3" class="tab-pane fade">
       <br /><br />
      <p></p>
      <asp:Repeater ID = "rptComments" runat = "server">
      <ItemTemplate>
      <%#Eval("Comment") %>&nbsp; by &nbsp;<%#Eval("Name") %>&nbsp; on  &nbsp;<%#Eval("Date") %> 
      </ItemTemplate>
      <SeparatorTemplate>
      <hr />
      </SeparatorTemplate>
      </asp:Repeater>
       <asp:SqlDataSource ID="srcComments" runat="server" 
            ConnectionString="<%$ ConnectionStrings:StoredbConnectionString %>" 
            SelectCommand="SELECT [Comment], [Name], [Date] FROM [Comments] WHERE ([ProductId] = @ProductId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductId" QueryStringField="pid"/>
            </SelectParameters>
        </asp:SqlDataSource>
      <br /><br />
      <asp:TextBox ID = "txtcomments" placeholder = "Add Comments here" runat = "server" TextMode ="MultiLine" Height ="150" Width="400"></asp:TextBox>
      <br />
      <asp:RequiredFieldValidator ID ="rf1" runat="server" ControlToValidate = "txtcomments" Text = "Please enter comments" Display="Dynamic" ValidationGroup = "1" Font-Italic="True" ForeColor="#990000"></asp:RequiredFieldValidator>
      <br />
      <asp:Button ID = "btnAddComments" runat = "server" Text ="Comment" 
            BackColor="#1376D7" BorderColor="#1376D7" BorderStyle="Solid" BorderWidth="1px" 
            ForeColor="White" onclick="btnAddComments_Click" ValidationGroup ="1"/>
    </div>
  </div>
         <div class="footer">
        <p class="pull-left">©mssl (2015)    </p>
      </div>
      </div>
      
      <!-- Site footer -->
     
       
    </form>
</body>
</html>
