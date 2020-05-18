using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;


namespace ShoppingCart
{

    /// <summary>
    /// Represents a product category and 
    /// contains methods for working with categories
    /// </summary>
    public class Category
    {
        private static readonly string _connectionString;

        private int _id;
        private int _parentId;
        private string _title;
        private string _url;
        private string _description;
        private string _fullDescription;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }


        public int ParentId
        {
            get { return _parentId; }
            set { _parentId = value; }
        }


        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }


        public string FullDescription
        {
            get { return _fullDescription; }
            set { _fullDescription = value; }
        }

        /// <summary>
        /// Select a Category by Category Id
        /// </summary>
        public static Category Select(int id)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("CategorySelect", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", id);

            Category result = null;
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                    result = new Category(reader);
            }
            return result;
        }


        /// <summary>
        /// Select a Category Id by Product Id
        /// </summary>
        public static int SelectIdByProductId(int productId)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("CategorySelectIdByProductId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@ProductId", productId);

            int result = -1;
            using (con)
            {
                con.Open();
                result = (int)cmd.ExecuteScalar();
            }
            return result;
        }


        /// <summary>
        /// Retrieve child categories of a category
        /// </summary>
        public static List<Category> SelectChildren(int id)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("CategorySelectChildren", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", id);

            List<Category> results = new List<Category>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new Category(reader));
            }
            return results;
        }

        /// <summary>
        /// Create a new category
        /// </summary>
        /// <param name="parentId"></param>
        public static void Insert(int parentId, string title, string description, string fullDescription)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("CategoryInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@ParentId", parentId);
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@FullDescription", fullDescription);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Update an existing category
        /// </summary>
        public static void Update(int id, string title, string description, string fullDescription)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("CategoryUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@FullDescription", fullDescription);

            List<Category> results = new List<Category>();
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }


        /// <summary>
        /// Delete a category
        /// </summary>
        public static void Delete(int id)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("CategoryDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", id);
            List<Category> results = new List<Category>();
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Initialize a category from a DataReader
        /// </summary>
        public Category(SqlDataReader reader)
        {
            _id = (int)reader["Id"];
            if (reader["ParentId"] != DBNull.Value)
                _parentId = (int)reader["ParentId"];
            _title = (string)reader["Title"];
            _description = (string)reader["Description"];
            if (reader["FullDescription"] != DBNull.Value)
                _fullDescription = (string)reader["FullDescription"];
        }

        /// <summary>
        /// Load the database connection string from Web configuration
        /// </summary>
        static Category()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        }
    }
}