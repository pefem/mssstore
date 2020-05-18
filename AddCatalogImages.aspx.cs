using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class AddCatalogImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
         if (fupImage.FileName != "")
            {
                string extension = Path.GetExtension(fupImage.PostedFile.FileName);
                if (((extension == ".JPG" || extension == ".jpg") || ((extension == ".GIF" || extension == ".gif") || ((extension == ".JPEG" || extension == ".jpeg")) || (extension == ".PNG" || extension == ".png"))))
                {
                    string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
                    SqlConnection con = new SqlConnection(path);
                    SqlCommand cmd = new SqlCommand("Insert into ProductImages(ProductId, Image, Description)Values(@ProductId, @Image, @Description)", con);
                    cmd.Parameters.AddWithValue("@ProductId", SqlDbType.Int).Value = ddlCatalog.SelectedValue;
                    cmd.Parameters.AddWithValue("@Image", SqlDbType.NVarChar).Value = fupImage.FileName;
                    cmd.Parameters.AddWithValue("@Description", SqlDbType.NVarChar).Value = txtDesc.Text;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    String filePath = "~/catalogImg/" + fupImage.FileName;
                    fupImage.SaveAs(MapPath(filePath));

                    string script2 = "<script>alert('Image added successfully')</script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script2);
                    txtDesc.Text = "";

                }
                else
                {
                    string script = "<script>alert('Invalid image upload! Please try again')</script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script);

                    return;
                }
            }


       


    }
}