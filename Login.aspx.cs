using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        LoasCustCartCount();
        HttpContext context = HttpContext.Current;
        context.Session.Remove("ShoppingCart");
    }

    private void LoasCustCartCount()
    {
        try
        {
            //Check to ensure that a customer as login then use his username to count his cart items
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
            {
                userName = context.User.Identity.Name;

                //Count customer cart items using his login username
                int getCustCartCount = ShoppingCart.ShoppingCart.CountCustomerCartItems(userName);
                lblCount.Text = getCustCartCount.ToString();
            }
            else
            {
                lblCount.Text = "0";
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string msg = "User created successfully!";
        try
        {
            MembershipUser newUser = Membership.CreateUser(
               txtUsername.Text, txtPassword.Text, txtEmail.Text);

            string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
            SqlConnection con = new SqlConnection(path);
            SqlCommand cmd = new SqlCommand("Insert into Customers(UserName, Email, FirstName, LastName,ContactNo,Address)values(@UserName, @Email, @FirstName, @LastName,@ContactNo,@Address)", con);
            cmd.Parameters.AddWithValue("@UserName", SqlDbType.NVarChar).Value = txtUsername.Text;
            cmd.Parameters.AddWithValue("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.AddWithValue("@FirstName", SqlDbType.NVarChar).Value = txtFirstName.Text;
            cmd.Parameters.AddWithValue("@LastName", SqlDbType.NVarChar).Value = txtLastName.Text;
            cmd.Parameters.AddWithValue("@ContactNo", SqlDbType.NVarChar).Value = txtContactNo.Text;
            cmd.Parameters.AddWithValue("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;

            con.Open();
            cmd.ExecuteNonQuery();

            txtUsername.Text = "";
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtContactNo.Text = "";
            txtAddress.Text = "";
        }
        catch (MembershipCreateUserException exc)
        {
            msg = "Unable to create the user. ";
            switch (exc.StatusCode)
            {
                case MembershipCreateStatus.DuplicateEmail:
                    msg += "An account with the specified e-mail already exists.";
                    break;
                case MembershipCreateStatus.DuplicateUserName:
                    msg += "An account with the specified username already exists.";
                    break;
                case MembershipCreateStatus.InvalidEmail:
                    msg += "The specified e-mail is not valid.";
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    msg += "The specified password is not valid.";
                    break;
                default:
                    msg += exc.Message;
                    break;
            }
        }

        lblResult.Text = msg;
       
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Download.aspx");
    }
}