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

public partial class UserControls_Catalog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    bool checkFile(string fileName)
    {
        return (Path.GetExtension(fileName).ToLower() == ".pdf");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (fupPDF.HasFile)
        {

            string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
            SqlConnection con = new SqlConnection(path);
            SqlCommand cmd = new SqlCommand("INSERT Products (CategoryId,Name,Price,Description,FullDescription,ImageAltText, Image,Pdf ) VALUES(@CategoryId,@Name,@Price,@Description,@FullDescription,@ImageAltText, @Image, @Pdf)", con);
            // cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters

            cmd.Parameters.AddWithValue("@CategoryId", SqlDbType.Int).Value = ddlCategory.SelectedValue;
            cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = txtName.Text;
            cmd.Parameters.AddWithValue("@Price", SqlDbType.Decimal).Value = txtPrice.Text;
            cmd.Parameters.AddWithValue("@Description", SqlDbType.NVarChar).Value = txtDecBrief.Text;
            cmd.Parameters.AddWithValue("@FullDescription", SqlDbType.NVarChar).Value = txtDesciptionFull.Text;
            cmd.Parameters.AddWithValue("@ImageAltText", SqlDbType.NVarChar).Value = txtAlText.Text;
            cmd.Parameters.AddWithValue("@Image", SqlDbType.VarBinary).Value = fupImage.FileContent;
            cmd.Parameters.AddWithValue("@Pdf", SqlDbType.VarBinary).Value = fupPDF.FileContent;

            // Execute command

            con.Open();
            cmd.ExecuteNonQuery();

            string script2 = "<script>alert('Catalog saved successfully. ')</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script2);

            ddlCategory.SelectedIndex = 0;
            txtAlText.Text = "";
            txtDecBrief.Text = "";
            txtDesciptionFull.Text = "";
            txtPrice.Text = "";
            txtPrice.Text = "";
            txtName.Text = "";
        }


    }
}