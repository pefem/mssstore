using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

        string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        SqlConnection con = new SqlConnection(path);
        SqlCommand cmd = new SqlCommand("ProductSelectAll", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
      
        dlstProducts.DataSource = reader;
        dlstProducts.DataBind();
      
            //Check to ensure that a customer as login then use his username to count his cart items
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
            {
                userName = context.User.Identity.Name;

                //Count customer cart items using his login username
                int getCustCartCount = ShoppingCart.ShoppingCart.CountCustomerCartItems(userName);
                lblCount.Text = getCustCartCount.ToString();
                //LoadCatalog();
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

    private void LoadCatalog()
    {
        try
        {
            string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
            SqlConnection con = new SqlConnection(path);
            SqlCommand cmd = new SqlCommand("ProductSelectByCategoryId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Add parameters
            cmd.Parameters.AddWithValue("@CategoryId", SqlDbType.Int).Value = ddlCategory.SelectedValue;
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            dlstProducts.DataSource = reader;
            dlstProducts.DataBind();
        }
        catch (Exception ex)
        { }
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Cart.aspx");
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCatalog();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Download.aspx");
    }
}