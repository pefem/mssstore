<%@ WebHandler Language="C#" Class="Download" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;


public class Download : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context)
    {
       
        context.Response.ContentType = "application/pdf";

        string connectionString = WebConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        SqlCommand SelectCommand = new SqlCommand("Select Pdf from Products Where Id = @Id", connection);
        SelectCommand.Parameters.AddWithValue("@Id", context.Request["Id"]);

        connection.Open();
        byte[] file = (byte[])SelectCommand.ExecuteScalar();

        context.Response.BinaryWrite(file);
        
        
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}