using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class ManageCatalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        //HttpContext context = HttpContext.Current;
        //string userName = context.Request.AnonymousID;
        //if (context.Request.IsAuthenticated)
        //{
        //    userName = context.User.Identity.Name;

        //    //Count customer downloads using his login username

        //    string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        //    SqlConnection con = new SqlConnection(path);
        //    SqlCommand cmd = new SqlCommand("GetCustomerDownload", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@UserName", SqlDbType.NVarChar).Value = userName;
        //    con.Open();
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    grdDownload.DataSource = reader;
        //    grdDownload.DataBind();

        //    LoasCustCartCount();
           
        //}
        //else
        //{
        //    return;
        //}



    }

    //private void LoasCustCartCount()
    //{
    //    try
    //    {
    //        //Check to ensure that a customer as login then use his username to count his cart items
    //        HttpContext context = HttpContext.Current;
    //        string userName = context.Request.AnonymousID;
    //        if (context.Request.IsAuthenticated)
    //        {
    //            userName = context.User.Identity.Name;

    //            //Count customer cart items using his login username
    //            int getCustCartCount = ShoppingCart.ShoppingCart.CountCustomerCartItems(userName);
    //            lblCount.Text = getCustCartCount.ToString();
    //        }
    //        else
    //        {
    //            lblCount.Text = "0";
    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}







    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ManageCatalog.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/CatalogImages.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Orders.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Categories.aspx");
    }
}