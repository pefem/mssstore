using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class UserControls_ManageOrders : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
            //get customer Orders

            string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
            SqlConnection con = new SqlConnection(path);
            SqlCommand cmd = new SqlCommand("select p.Id, p.Name, p.Pdf, c.UserName, c.Price, c.Quantity, c.OrderDate from Products as p inner join CustOrder as c on p.Id = c.ProductId", con);
           
            
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            grdDownload.DataSource = reader;
            grdDownload.DataBind();

         

       

    }
}