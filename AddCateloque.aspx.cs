using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class AddCateloque : System.Web.UI.Page
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
            }
            //else
            //{
            //    string script = "<script>alert('Invalid document type! file Must be in pdf format only ')</script>";
            //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script);
            //}
        }
        //else
        //{
        //    string script = "<script>alert('Please select pdf document to upload. ')</script>";
        //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script);
        //}

        //if (fupImage.HasFile)
        //{
        //    string extension = Path.GetExtension(fupImage.PostedFile.FileName);
        //    if (((extension == ".JPG" || extension == ".jpg") || ((extension == ".GIF" || extension == ".gif") || ((extension == ".JPEG" || extension == ".jpeg")) || (extension == ".PNG" || extension == ".png"))))
        //    {
        //        Stream fs = fupImage.PostedFile.InputStream;
        //        BinaryReader br = new BinaryReader(fs);  //reads the   binary files
        //        ImageBytes = br.ReadBytes((Int32)fs.Length);  //counting the file length into bytes
        //    }
        //    else
        //    {
        //        string script = "<script>alert('Invalid image upload! Please try again')</script>";
        //        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script);
        //        return;
        //    }
        //}
        //else
        //{
        //    string script = "<script>alert('Please select product image to upload. ')</script>";
        //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script);
        //    return;
        //}

        
    }


    
