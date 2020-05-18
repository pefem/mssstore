using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class ProductDetails : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadCustCartCount();
        LoadComments();

    }

    private void LoadComments()
    {
        int productId = Int32.Parse(Request.QueryString["pid"]);
        string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        SqlConnection con = new SqlConnection(path);

        SqlCommand cmd = new SqlCommand("select Comment,Name,Date from Comments where Id = @Id order by Id DESC", con);
        cmd.Parameters.AddWithValue("@Id", SqlDbType.NVarChar).Value = productId;
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
       
            rptComments.DataSource = reader;
            rptComments.DataBind();
    }

    private void LoadCustCartCount()
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
    protected void srcProduct_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {

    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        //Add item to cart but check first to see if the customer has login we would use his username to identify his cart items

       
            //Check to ensure that a customer as login then use his username to count his cart items
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
            {
                userName = context.User.Identity.Name;

                //get customer cart items using his login username
                int productId = Int32.Parse(Request.QueryString["pid"]);
                ShoppingCart.ShoppingCart.Insert(productId, userName);
                LoadCustCartCount();
            }
            else
            {
                string script2 = "<script>alert('Dear customer, you must login first before you can add items to your shopping cart. ')</script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script2);
                return;
            }
       
        
      
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Cart.aspx");
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/Default.aspx");
    }
    protected void btnAddComments_Click(object sender, EventArgs e)
    {
         //Check to ensure that a customer as login then use his username to add comments
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
            {
                userName = context.User.Identity.Name;

                
                //Add Comments
                int productId = Int32.Parse(Request.QueryString["pid"]);
               string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
               SqlConnection con = new SqlConnection(path);

                SqlCommand cmd = new SqlCommand("Insert into Comments(ProductId,Name,Comment)values(@ProductId,@Name,@Comment)", con);
                cmd.Parameters.AddWithValue("@ProductId", SqlDbType.NVarChar).Value = productId;
                cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = userName;
                cmd.Parameters.AddWithValue("@Comment", SqlDbType.NVarChar).Value = txtcomments.Text;

                con.Open();
                cmd.ExecuteNonQuery();
                LoadComments();
                txtcomments.Text = "";
            }
            else
            {
                string script2 = "<script>alert('Dear customer, you must login first before you can add comments. ')</script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script2);
                return;
            }
        

    }
    
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Download.aspx");
    }
}