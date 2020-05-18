<%@ WebHandler Language="C#" Class="ProductImage" %>

using System;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Serve product images from Products
/// database table
/// </summary>
public class ProductImage : IHttpHandler 
{
    
    const string connectionStringName = "Store";    
    
    /// <summary>
    /// Return the image bytes
    /// </summary>
    /// <param name="context"></param>
    public void ProcessRequest (HttpContext context) 
    {
        // Don't buffer response
        context.Response.Buffer = false;

        // Get product id
        int productId = Int32.Parse(context.Request.QueryString["id"]);
        
        // Get image from database
        string conString = WebConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("SELECT Image FROM Products WHERE Id=@Id", con);
        cmd.Parameters.AddWithValue("@Id", productId);
        using (con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SequentialAccess);
            if (reader.Read())
            {
                int bufferSize = 8040;
                byte[] chunk = new byte[bufferSize];
                long retCount;
                long startIndex = 0;
                retCount = reader.GetBytes(0, startIndex, chunk, 0, bufferSize);
                while (retCount == bufferSize)
                {
                    context.Response.BinaryWrite(chunk);

                    startIndex += bufferSize;
                    retCount = reader.GetBytes(0, startIndex, chunk, 0, bufferSize);
                }
                byte[] actualChunk = new Byte[retCount - 1];
                Buffer.BlockCopy(chunk, 0, actualChunk, 0, (int)retCount - 1);
                context.Response.BinaryWrite(actualChunk);
            }
        }
    }
 
    public bool IsReusable {
        get {
            return true;
        }
    }

}