<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
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

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style type="text/css">
         .style1
         {
             width: 810px;
         }
         .style2
         {
             width: 11px;
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

      <!-- Jumbotron -->
      <div class="banner">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
		  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <a href="#"><img src="bwres/images/11.jpg" alt="..."></a>
      <div class="carousel-caption">
        <h1></h1> 
		<p></p> 
      </div>
    </div>
	
   <div class="item">
      <a href="#"><img src="bwres/images/4.jpg" alt="..."></a>
      <div class="carousel-caption">
        <h1></h1> 
		<p></p> 
      </div>
    </div>
	

    <div class="item">
      <a href="#"><img src="bwres/images/5.jpg" alt="..."></a>
      <div class="carousel-caption">
        <h1></h1> 
		<p></p> 
      </div>
    </div>

  </div>

  <!-- Controls -->
  
 
</div>
      </div>

      <!-- Example row of columns -->
      <div class="row">
       
		
			<div class="header-area">
          
            
           
			    <table style="width:100%;">
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style1">
                            Filter By :
                            <asp:DropDownList ID="ddlCategory" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="Id" 
                                AutoPostBack="True" 
                                onselectedindexchanged="ddlCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;|&nbsp;
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/bwres/images/favourite.jpg" 
                                Height="23px" />
                            <asp:LoginView ID="LoginView2" runat="server">
                                <LoggedInTemplate>
                                    Hi,
                                    <asp:LoginName ID="LoginName1" runat="server" />
                                    ,
                                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black" OnClick="LinkButton2_Click">My Profile</asp:LinkButton>
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
                            |
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
		
            <p>
                &nbsp;</p>
            <p>
                <asp:DataList
    id="dlstProducts"
    RepeatColumns="4"
    CssClass="productList"
    Runat="server">
    <ItemTemplate>
        
    <asp:Image
    id="imgProduct"
    ImageUrl='<%# Eval("Id", "~/ProductImage.ashx?id={0}") %>'
    AlternateText='<%# Eval("ImageAltText") %>'
    CssClass="productImage"
   
     Runat="server" />
    <br />
<%# Eval("Name") %>
<br />
<%-- <asp:Image ID="myImage" ImageUrl="~/bwres/images/naira.png" runat="server" /><%# Eval("Price") %>--%>

<asp:HyperLink
    id="lnkView"
    Text="View Details"
    NavigateUrl='<%# Eval("Id","~/ProductDetails.aspx?pid={0}") %>'
    Runat="server" Font-Bold="False" ForeColor="#0099CC" />


       
    </ItemTemplate>
   

</asp:DataList>
            </p>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Store %>" 
                                SelectCommand="SELECT [Id], [Title] FROM [Categories]"></asp:SqlDataSource>

   
      </div>

      <!-- Site footer -->
      <div class="footer">
        <p class="pull-left">©mssl (2015)  </p>
      </div>

    </div> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bwres/js/jquery-1.10.2.js"></script>
    <script src="bwres/js/bootstrap.min.js"></script>

	<script>
	    (function (i, s, o, g, r, a, m) {
	        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
	            (i[r].q = i[r].q || []).push(arguments)
	        }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
	    })(window, document, 'script', '../www.google-analytics.com/analytics.js', 'ga');

	    ga('create', 'UA-56640119-1', 'auto');
	    ga('send', 'pageview');

	    $(function () {
	        $('[data-toggle="popover"]').popover()
	    })

</script>
    </form>
</body>
</html>
