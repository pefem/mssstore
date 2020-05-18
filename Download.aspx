<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Download" %>
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
     <style type="text/css">
        .style2
        {
            color: #FFFFFF;
            font-size: large;
            font-weight: bold;
        }
         .style4
         {
             width: 843px;
         }
         .style8
         {
             width: 108px
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
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
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
                                ID="LinkButton2" runat="server" ForeColor="#333300">Edit Profile</asp:LinkButton>
                            &nbsp;|
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/bwres/images/Edit.gif" ToolTip="Edit Account" />
                            <asp:LinkButton ID="LinkButton3" runat="server" 
                                ForeColor="#333300">Change Password</asp:LinkButton>
                            &nbsp;|
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/password.gif" 
                                Height="21px" />
                            &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" 
                                ForeColor="#333300">Download</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;| &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/bwres/images/cart3.png" 
                                Height="21px" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black">My Cart</asp:LinkButton>
                            &nbsp;(<asp:Label ID="lblCount" runat="server" style="font-weight: 700"></asp:Label>
                            )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
        <asp:Panel ID="Panel2" runat="server" Height="27px" BackColor="#1376D7">
            <span class="style2">Your Download</span></asp:Panel>
        <p></p>
        <p>
            <table style="width:100%;">
                <tr>
                    <td class="style8">
                        &nbsp;</td>
                    <td>

                        <br /><br />
                        <asp:GridView ID="grdDownload" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" Width="725px" ForeColor="Black"
                            EmptyDataText="There are no items in your account for download. Please make purchase to download items">
                        <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Product Name" />
                               
                               <asp:HyperLinkField Text="Download PDF" 
                                DataNavigateUrlFormatString="Download.ashx?Id={0}" DataNavigateUrlFields="Id"  
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
                        <br />
    
    



                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style8">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style8">
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
