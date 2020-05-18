using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

namespace ShoppingCart
{

    /// <summary>
    /// Represents a product and methods for
    /// working with products
    /// </summary>
    public class Product
    {
        private static readonly string _connectionString;

        private int _id;
        private string _name;
        private bool _isFeatured;
        private decimal _price;
        private string _description;
        private string _fullDescription;
        private bool _hasImage;
        private int _categoryId;
        private string _categoryTitle;
        private string _imageAltText;
        

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public bool IsFeatured
        {
            get { return _isFeatured; }
            set { _isFeatured = value; }
        }


        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
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

        public bool HasImage
        {
            get { return _hasImage; }
        }


        public string ImageAltText
        {
            get { return _imageAltText; }
            set { _imageAltText = value; }
        }


        public int CategoryId
        {
            get { return _categoryId; }
            set { _categoryId = value; }
        }

        public string CategoryTitle
        {
            get { return _categoryTitle; }
            set { _categoryTitle = value; }
        }

        /// <summary>
        /// Create a new product
        /// </summary>
        public static void Insert(int categoryId, string name, decimal price, string description, string fullDescription, string imageAltText, bool image, bool pdf)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ProductInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
           // cmd.Parameters.Add("@ReturnValue",SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@FullDescription", fullDescription);
            cmd.Parameters.AddWithValue("@ImageAltText", imageAltText);
            cmd.Parameters.AddWithValue("@Image", image);
            cmd.Parameters.AddWithValue("@Pdf", pdf);
            
            // Execute command
            //int returnValue = 0;
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
               // returnValue = (int)cmd.Parameters["@ReturnValue"].Value;
            }
           // return returnValue;
        }

        /// <summary>
        /// Delete an existing product
        /// </summary>
        public static void Delete(int id)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ProductDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", id);

            // Execute command
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Update an existing product
        /// </summary>
        public static void Update(int id, int categoryId, string name, bool isFeatured, decimal price, string description, string fullDescription, string imageAltText)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ProductUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@IsFeatured", isFeatured);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@FullDescription", fullDescription);
            cmd.Parameters.AddWithValue("@ImageAltText", imageAltText);

            // Execute command
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }


        /// <summary>
        /// Select all products from database
        /// </summary>
        //public static List<Product> Select()
        //{
        //    // Initialize command
        //    SqlConnection con = new SqlConnection(_connectionString);
        //    SqlCommand cmd = new SqlCommand("ProductSelectAll", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    List<Product> results = new List<Product>();
        //    using (con)
        //    {
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //            results.Add(new Product(reader));
        //    }
        //    return results;
        //}

        /// <summary>
        /// Select all featured products from database
        /// </summary>
        //public static List<Product> SelectFeatured()
        //{
        //    // Initialize command
        //    SqlConnection con = new SqlConnection(_connectionString);
        //    SqlCommand cmd = new SqlCommand("ProductSelectFeatured", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    List<Product> results = new List<Product>();
        //    using (con)
        //    {
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //            results.Add(new Product(reader));
        //    }
        //    return results;
        //}

        /// <summary>
        /// Select all products in a particular category
        /// </summary>
        //public static List<Product> SelectByCategoryId(int categoryId)
        //{
        //    // Initialize command
        //    SqlConnection con = new SqlConnection(_connectionString);
        //    SqlCommand cmd = new SqlCommand("ProductSelectByCategoryId", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    // Add parameters
        //    cmd.Parameters.AddWithValue("@CategoryId", categoryId);

        //    List<Product> results = new List<Product>();
        //    using (con)
        //    {
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            Product p = new Product(reader);
        //            p.Id = (int)reader["Id"];
        //            p.CategoryId = (int)reader["CategoryId"];
        //            p.Name = reader["Name"].ToString();
        //            p.Price = (decimal)reader["Price"];
        //            p.Description = reader["Description"].ToString();
        //            p.FullDescription = reader["FullDescription"].ToString();
        //            p.IsFeatured = (bool)reader["IsFeatured"];
        //            p.ImageAltText = reader["ImageAltText"].ToString();
        //            p.Image = reader["Image"].ToString();
        //            p.Pdf = reader["Pdf"].ToString();

        //            results.Add(p);
        //        }

        //        reader.Close();
        //        return results;
        //    }
        //   // return results;
        //}


        //public static List<Product> SelectByCategoryId(int categoryId)
        //{
        //    // Initialize command
        //    SqlConnection con = new SqlConnection(_connectionString);
        //    SqlCommand cmd = new SqlCommand("ProductSelectByCategoryId", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    // Add parameters
        //    cmd.Parameters.AddWithValue("@CategoryId", categoryId);

        //    List<Product> results = new List<Product>();
        //    using (con)
        //    {
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //            results.Add(new Product(reader));
        //    }
        //    return results;
        //}


        //public static List<fasUsers> getUserImage(string email)
        //{
        //    List<fasUsers> Users = new List<fasUsers>();
        //    SqlConnection Connection = FaSdatabaseConnection.GetConnection();
        //    SqlCommand GetCommand = new SqlCommand("Select ImageUrl from Users Where Email = @Email", Connection);
        //    GetCommand.Parameters.AddWithValue("@Email", email);

        //    Connection.Open();
        //    SqlDataReader reader = GetCommand.ExecuteReader();
        //    while (reader.Read())
        //    {
        //        Product p = new Product();
        //        p.Id = (int)reader["Id"];
        //        p.CategoryId = (int)reader["CategoryId"];
        //        p.Name = reader["Name"].ToString();
        //        p.Price = (decimal)reader["Price"];
        //        p.Description = reader["Description"].ToString();
        //        p.FullDescription = reader["FullDescription"].ToString();
        //        p.IsFeatured = (bool)reader["IsFeatured"];
        //        p.ImageAltText = reader["ImageAltText"].ToString();
        //        p.HasImage = (byte)reader["Image"];
        //        p.Pdf = (byte)reader["Pdf"];
        //    }

        //    reader.Close();
        //    return Users;
        //}


        public static List<Product> SelectByCategoryId(int categoryId)
        {
            List<Product> products = new List<Product>();
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ProductSelectByCategoryId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Add parameters
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);


            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                   
                    Product p = new Product();
                    p.Id = Convert.ToInt32(reader["Id"]);
                    if (reader["CategoryId"] != DBNull.Value)
                    p.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                    p.Name = reader["Name"].ToString();
                    p.Price = Convert.ToDecimal(reader["Price"]);
                    p.Description = reader["Description"].ToString();
                    p.FullDescription = reader["FullDescription"].ToString();
                    p.IsFeatured = Convert.ToBoolean(reader["IsFeatured"]);
                    p.ImageAltText = reader["ImageAltText"].ToString();
                    p._hasImage = Convert.ToBoolean(reader["ImageSize"]);

                    products.Add(p);

                }

                reader.Close();
                return products;

            }

        }

        /// <summary>
        /// Select a single product by Id
        /// </summary>
        public static Product Select(int id)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ProductSelectById", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Add parameters
            cmd.Parameters.AddWithValue("@Id", id);

           
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Product p = new Product();
                    p.Id = Convert.ToInt32(reader["Id"]);
                    p.Name = reader["Name"].ToString();
                    p.Description = reader["Description"].ToString();
                    p.FullDescription = reader["FullDescription"].ToString();
                    p.Price = Convert.ToDecimal(reader["Price"]);
                    p.ImageAltText = reader["ImageAltText"].ToString();
                    p._hasImage = Convert.ToBoolean(reader["ImageSize"]);

                    return p;
                }
                else
                {
                    return null;
                }
                    
            }
           // return result;
        }



        /// <summary>
        /// Adds a new product image by buffering the image
        /// </summary>
        public static void InsertImage(int id, Stream upload)
        {
            int bufferLen = 8040;
            BinaryReader br = new BinaryReader(upload);
            byte[] chunk = br.ReadBytes(bufferLen);

            // Create connection
            SqlConnection con = new SqlConnection(_connectionString);
            using (con)
            {
                con.Open();

                // Create command
                SqlCommand cmd = new SqlCommand("UPDATE Products SET Image=@Buffer WHERE Id=@Id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.Add("@Buffer", SqlDbType.VarBinary, bufferLen).Value = chunk;
                cmd.ExecuteNonQuery();


                SqlCommand cmdAppend = new SqlCommand("UPDATE Products SET Image .WRITE(@Buffer, NULL, 0) WHERE Id=@id", con);
                cmdAppend.Parameters.AddWithValue("@id", id);
                cmdAppend.Parameters.Add("@Buffer", SqlDbType.VarBinary, bufferLen);
                chunk = br.ReadBytes(bufferLen);

                while (chunk.Length > 0)
                {
                    cmdAppend.Parameters["@Buffer"].Value = chunk;
                    cmdAppend.ExecuteNonQuery();
                    chunk = br.ReadBytes(bufferLen);
                }

                br.Close();
            }
        }

        /// <summary>
        /// Initializes a product from a DataReader
        /// </summary>
        /// <param name="reader"></param>
        //public Product(SqlDataReader reader)
        //{
        //    _id = Convert.ToInt32(reader["Id"]);
        //    _name = (string)reader["Name"];
        //    _isFeatured = (bool)reader["IsFeatured"];
        //    _price = (decimal)reader["Price"];
        //    _description = (string)reader["Description"];
        //    if (reader["FullDescription"] != DBNull.Value)
        //        _fullDescription = (string)reader["fullDescription"];
        //    _hasImage = reader["ImageSize"] != DBNull.Value;
        //    if (reader["ImageAltText"] != DBNull.Value)
        //        _imageAltText = (string)reader["ImageAltText"];
        //    if (reader["CategoryId"] != DBNull.Value)
        //        _categoryId = Convert.ToInt32(reader["categoryId"]);
        //    if (reader["CategoryTitle"] != DBNull.Value)
        //        _categoryTitle = (string)reader["CategoryTitle"]; ;
        //}

        /// <summary>
        /// Retrieve database connection string from Web configuration
        /// </summary>
        static Product()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        }
    }
}