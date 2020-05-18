<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
        .style3
        {
            width: 68px;
        }
         .style4
         {
             width: 583px;
         }
         .leftForm
{
    float:left;
    width:300px;
    text-align:left;
    margin-right:20px;
    line-height:150%
}

.rightForm
{
    float:left;
    width:400px;
    line-height:150% ;
    margin-left:80px; 
}
.colForm
{
    float:left;
    width:45%;
}
         .style5
         {
             width: 129px;
         }
         .auto-style1 {
             width: 38px;
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
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;&nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/bwres/images/favourite.jpg" 
                                Height="23px" />
                            &nbsp;<asp:LoginView ID="LoginView2" runat="server">
                                <LoggedInTemplate>
                                    Hi,
                                    <asp:LoginName ID="LoginName1" runat="server" />
                                    ,
                                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black" OnClick="LinkButton2_Click">My Profile</asp:LinkButton>
                                    ,
                                </LoggedInTemplate>
                            </asp:LoginView>
&nbsp;&nbsp;<asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="Black" />
&nbsp;<asp:LoginView ID="LoginView1" runat="server">
                                <LoggedInTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/bwres/images/Edit.gif" 
    ToolTip="My Account" />
                                </LoggedInTemplate>
                            </asp:LoginView>
                            |
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/bwres/images/cart3.png" 
                                Height="21px" />
                            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black">View Cart</asp:LinkButton>
                            (<asp:Label ID="lblCount" runat="server" style="font-weight: 700"></asp:Label>
                            ) </td>
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

    <asp:Panel ID="Panel1" runat="server" Height="627px" BorderColor="#0099CC" 
        BorderStyle="Dotted" BorderWidth="1px">
        <p>
            &nbsp;</p>
        <p>
            <table style="width:100%;">
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        
<asp:Panel ID = "subPanel" runat="server" Height="640px">


                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                         
                        <div class="leftForm">
                       
                        <asp:Panel ID ="LoginPanel" runat="server" BorderColor="#0099CC" 
                                BorderStyle="Solid" BorderWidth="1px" Height="279px" Width="373px">
                            <asp:Panel ID="Panel3" runat="server" BackColor="#0099CC" Height="28px">
                                <span class="fa-inverse">
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/login.gif" />
                                Existing customer login here</span></asp:Panel>
                                <asp:Login ID="login1" runat="server">
                                <LayoutTemplate>
                                
                               
                                    <asp:Label ID="FailureText" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                
                               
                            <br />
                            &nbsp; <br />
                            &nbsp;&nbsp;<asp:TextBox ID="UserName" runat="server" Width="350px" 
                                placeholder="Enter username" Height="30px"></asp:TextBox>
                            <br />
                            &nbsp;<br /> &nbsp;
                            <asp:TextBox ID="Password" runat="server" Width="350px" 
                                placeholder="Enter password" Height="30px" TextMode="Password"></asp:TextBox>
                            <br />
                            &nbsp;
                            <br />
                            &nbsp;&nbsp;<asp:CheckBox ID="chkSendLetter0" runat="server" Text="Keep me signedIn" />
                            <br />
                            &nbsp;&nbsp;<br />&nbsp;
                            <asp:Button ID="btnLogin" runat="server" BackColor="#0099CC" 
                                BorderColor="#0099CC" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" 
                                Height="26px" Text="Login" Width="91px" CommandName="Login" />
                                 </LayoutTemplate>
                                </asp:Login>
                             
</asp:Panel>
                        </div>
                        
                        <div class="rightForm">
                        
                            <asp:Panel ID="LoginPanel0" runat="server" BorderColor="#0099CC" 
                                BorderStyle="Solid" BorderWidth="1px" Height="532px" Width="400px">
                                <asp:Panel ID="Panel4" runat="server" BackColor="#0099CC" Height="28px">
                                    <span class="fa-inverse">
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/addContact.bmp" />
                                    &nbsp;New Customer Sign up here </span></asp:Panel>
                                <asp:Label ID="lblResult" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                <br />
                                &nbsp; <br /> &nbsp;&nbsp;<asp:TextBox ID="txtUsername" runat="server" Height="30px" 
                                    placeholder="Enter username" Width="350px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtUsername" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br /> &nbsp;&nbsp;<br />&nbsp;
                                <asp:TextBox ID="txtPassword" runat="server" Height="30px" 
                                    placeholder="Enter password" Width="350px" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPassword" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br />
                                &nbsp; <br />&nbsp;
                                <asp:TextBox ID="txtEmail" runat="server" Height="30px" 
                                    placeholder="Enter email address" Width="350px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtEmail" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br />
                                <br /> &nbsp;&nbsp;<asp:TextBox ID="txtFirstName" runat="server" Height="30px" 
                                    placeholder="Enter Firstname" Width="350px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtFirstName" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br />
                                &nbsp;&nbsp;<br />&nbsp;&nbsp;<asp:TextBox ID="txtLastName" runat="server" Height="30px" 
                                    placeholder="Enter Lastname" Width="350px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="txtLastName" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br />
                                &nbsp;&nbsp;<br />&nbsp;&nbsp;<asp:TextBox ID="txtContactNo" runat="server" Height="30px" 
                                    placeholder="Enter contact number" Width="350px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="txtContactNo" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br />
                                &nbsp;&nbsp;<br />&nbsp;
                                <asp:TextBox ID="txtAddress" runat="server" Height="56px" 
                                    placeholder="Enter address" TextMode="MultiLine" Width="350px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="txtAddress" Display="Dynamic" 
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#990000" 
                                    SetFocusOnError="True" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <br />
                                &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkSendLetter" runat="server" 
                                    Text=" Send me monthly Newsletter" />
                                <br />
                                <br />&nbsp;<asp:Button ID="Button2" runat="server" BackColor="#0099CC" 
                                    BorderColor="#0099CC" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" 
                                    Height="26px" Text="Create Account" Width="133px" onclick="Button2_Click" 
                                    ValidationGroup="1" />
                                <br />
                                <br />
                                <br />
                                <br />
&nbsp;
                            </asp:Panel>
                        </div>
                        
                        <br />
                         
                        </asp:Panel>
                        <br /><br /><br />
    
    

    
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
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
        <p class="pull-left">©mssl (2015)      /div>
      iv>
      
      <!-- Site footer -->
     
       
    </form>
</body>
</html>
