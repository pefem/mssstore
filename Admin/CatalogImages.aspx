<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CatalogImages.aspx.cs" Inherits="CatalogImages" %>
<%@ Register tagPrefix="user" tagName="ProductView" src="~/UserControls/ProductView.ascx" %>
<%@ Register src="../UserControls/Catalog.ascx" tagname="Catalog" tagprefix="uc1" %>
<%@ Register src="../UserControls/CatalogImages.ascx" tagname="CatalogImages" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>MSS Store</title>

    <!-- Bootstrap core CSS -->
    <link href="bwres/css/bootstrap.min.css" rel="stylesheet">
	<link href="bwres/css/style.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="bwres/css/font-awesome.min.css" rel="stylesheet">
     <style type="text/css">
        .style2
        {
            color: #FFFFFF;
            font-size: large;
            font-weight: bold;
        }
         .style4
         {
             width: 1031px;
         }
         .style9
         {
             width: 19px;
         }
         .style11
         {
             width: 355px
         }
         .style12
         {
             width: 298px
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container wrapper">
      <div class="masthead">
      </div>
      <!-- Example row of columns -->
      <div class="row">
			<div class="header-area">
			    <table style="width:100%;">
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;&nbsp;&nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/bwres/images/favourite.jpg" 
                                Height="23px" />
                            <asp:LoginView ID="LoginView2" runat="server">
                                <LoggedInTemplate>
                                    Hi,
                                    <asp:LoginName ID="LoginName1" runat="server" />
                                </LoggedInTemplate>
                            </asp:LoginView>
&nbsp;<asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="Black" LogoutAction="Redirect" 
                                LogoutPageUrl="~/Default.aspx" />
&nbsp;|
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/my_profile.gif" 
                                Height="21px" />
                            &nbsp;<asp:LinkButton 
                                ID="LinkButton2" runat="server" ForeColor="#333300" 
                                onclick="LinkButton2_Click">Manage Categories</asp:LinkButton>
                            &nbsp;|
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/bwres/images/Edit.gif" ToolTip="Edit Account" />
                            <asp:LinkButton ID="LinkButton3" runat="server" 
                                ForeColor="#333300" onclick="LinkButton3_Click">Manage Catalog</asp:LinkButton>
                            &nbsp;|
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/password.gif" 
                                Height="21px" />
                            &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" 
                                ForeColor="#333300" onclick="LinkButton4_Click">Manage Orders</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;| &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/bwres/images/cart3.png" 
                                Height="21px" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                                onclick="LinkButton1_Click">Add Catalog Images</asp:LinkButton>
                            &nbsp;| <asp:LinkButton ID="LinkButton5" runat="server" ForeColor="Black">Login Account</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
			</div>
		
            <p>
                &nbsp;<br />
            </p>
            <script runat="server">

  
    
</script>
    <asp:Panel ID="Panel1" runat="server" Height="627px" BorderColor="#CC3300" 
        BorderStyle="Dotted" BorderWidth="1px">
        <asp:Panel ID="Panel2" runat="server" Height="27px" BackColor="#1376D7" 
            style="color: #006699; background-color: #006699">
            <span class="style2">Add&nbsp; Catalog Images</span></asp:Panel>
        <p></p>
        <p>
            <table style="width:100%;">
                <tr>
                    <td class="style12">
                        &nbsp;</td>
                    <td>

                        <br />
                        <uc2:CatalogImages ID="CatalogImages1" runat="server" />
                        <br />
                        <br />
    
    



                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </p>
    </asp:Panel>
          <br /><br />
    </div>
      
         <div class="footer">
        <p class="pull-left">©mssl (2015)      </div>
      </div>
      
      <!-- Site footer -->
     
       
    </form>
</body>
</html>
