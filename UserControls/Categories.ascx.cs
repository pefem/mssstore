using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class UserControls_Categories : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadCategories();
    }

    private void LoadCategories()
    {
        string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        SqlConnection con = new SqlConnection(path);
        SqlCommand cmd = new SqlCommand("select Id, Title,Description from Categories", con);

        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        grdCategories.DataSource = reader;
        grdCategories.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        SqlConnection con = new SqlConnection(path);
        SqlCommand cmd = new SqlCommand("INSERT Categories (Title,Description ) VALUES(@Title,@Description)", con);
        // cmd.CommandType = CommandType.StoredProcedure;

        // Initialize parameters

        cmd.Parameters.AddWithValue("@Title", SqlDbType.NVarChar).Value = txtName.Text;
        cmd.Parameters.AddWithValue("@Description", SqlDbType.NVarChar).Value = txtDescription.Text;

        con.Open();
        cmd.ExecuteNonQuery();
        LoadCategories();
        string script2 = "<script>alert('Category added successfully. ')</script>";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script2);

        txtDescription.Text = "";
        txtName.Text = "";
    }
    protected void grdCategories_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int Id = Convert.ToInt32(e.CommandArgument);
        string cmd = e.CommandName;

        if (cmd.Equals("Del"))
        {
            //Delete
            string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
            SqlConnection con = new SqlConnection(path);
            SqlCommand command = new SqlCommand("Delete Categories where Id = @Id", con);
            // cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters

            command.Parameters.AddWithValue("@Id", SqlDbType.NVarChar).Value = Id;
            
            con.Open();
            command.ExecuteNonQuery();
            LoadCategories();
            string script = "<script>alert('Category deleted successfully! ')</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script);
            
        }
        else if (cmd.Equals("Edt"))
        {
            btnAdd.Enabled = false;
            btnSave.Enabled = true;

            //Delete
            string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
            SqlConnection con = new SqlConnection(path);
            SqlCommand command = new SqlCommand("select Id, Title,Description from Categories where Id = @Id", con);
            // cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters

            command.Parameters.AddWithValue("@Id", SqlDbType.NVarChar).Value = Id;

            con.Open();
            SqlDataReader reader = command.ExecuteReader();
            if(reader.Read())
            {
                txtName.Text = reader["Title"].ToString();
                txtDescription.Text = reader["Description"].ToString();
                txtId.Text = reader["Id"].ToString();
            }
           
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        SqlConnection con = new SqlConnection(path);
        SqlCommand cmd = new SqlCommand("update Categories set Title = @Title, Description = @Description where Id = @Id", con);
        // cmd.CommandType = CommandType.StoredProcedure;

        // Initialize parameters

        cmd.Parameters.AddWithValue("@Id", SqlDbType.Int).Value = txtId.Text;
        cmd.Parameters.AddWithValue("@Title", SqlDbType.NVarChar).Value = txtName.Text;
        cmd.Parameters.AddWithValue("@Description", SqlDbType.NVarChar).Value = txtDescription.Text;

        con.Open();
        cmd.ExecuteNonQuery();
        LoadCategories();
        btnAdd.Enabled = true;
        btnSave.Enabled = false;
        string script2 = "<script>alert('Category updated successfully. ')</script>";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Added", script2);

        txtDescription.Text = "";
        txtName.Text = "";
        txtId.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtDescription.Text = "";
        txtName.Text = "";
    }
}