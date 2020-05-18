using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

namespace ShoppingCart 
{

    /// <summary>
    /// Represents a customer shopping cart and methods
    /// for working with shopping carts
    /// </summary>
    public class ShoppingCart
    {
        private static readonly string _connectionString;

        /// <summary>
        /// Adds a new item to the shopping cart
        /// </summary>
        public static void Insert(int productId, string userName)
        {
            // Get user name
           // string userName = GetUserName();

            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ShoppingCartInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@ProductId", productId);

            // Execute command
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear session cart
            HttpContext context = HttpContext.Current;
            context.Session.Remove("ShoppingCart");
        }

        public static int CountCustomerCartItems(string userName)
        {
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand GetCommand = new SqlCommand("select count(*) as count from ShoppingCarts where UserName = @UserName", con);
            GetCommand.Parameters.AddWithValue("@UserName", userName);
            con.Open();
            int custCartCount = (int)GetCommand.ExecuteScalar();
            return custCartCount;

        }



        /// <summary>
        /// When a user transitions from anonymous to authenticated,
        /// the user's shopping cart is modified to reflect the 
        /// authenticated user name
        /// </summary>
        public static void AuthenticateCart(string anonymousId, string userName)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ShoppingCartAuthenticate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@AnonymousId", anonymousId);
            cmd.Parameters.AddWithValue("@UserName", userName);

            // Execute command
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear session cart
            HttpContext context = HttpContext.Current;
            context.Session.Remove("ShoppingCart");
        }


        /// <summary>
        /// Deletes a shopping cart
        /// </summary>
        public static void Delete(string userName, int Id)
        {
            // Get user name
           // string userName = GetUserName();

            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ShoppingCartDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@Id", Id);

            // Execute command
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear session cart
            HttpContext context = HttpContext.Current;
            context.Session.Remove("ShoppingCart");
        }

        /// <summary>
        /// Retrieves shopping cart for current user
        /// </summary>
        public static List<CartItem> Select(string userName)
        {
            HttpContext context = HttpContext.Current;

            // Attempt to get shopping cart from session
            List<CartItem> results = (List<CartItem>)context.Session["ShoppingCart"];
            if (results == null)
            {
                results = new List<CartItem>();
                results = SelectFromDB(userName);
                context.Session["ShoppingCart"] = results;
            }
            return results;
        }

        /// <summary>
        /// Get shopping cart from database
        /// </summary>
        private static List<CartItem> SelectFromDB(string userName)
        {
            // Trace output
            HttpContext.Current.Trace.Warn("Retrieving shopping cart from database");

            // Get user name
           // string userName = GetUserName();

            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("ShoppingCartSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@UserName", userName);

            List<CartItem> results = new List<CartItem>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new CartItem(reader));
            }
            return results;
        }

       

        /// <summary>
        /// Gets either an anonymous Id or the
        /// authenticated user name
        /// </summary>
        private static string GetUserName()
        {
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
                userName = context.User.Identity.Name;
            return userName;
        }

        /// <summary>
        /// Retrieve connection string from Web configuration file
        /// </summary>
        static ShoppingCart()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["Store"].ConnectionString;
        }

    }

    /// <summary>
    /// Represents an individual item in a shopping cart
    /// </summary>
    public class CartItem
    {
        private int _id;
        private string _name;
        private decimal _price;
        private int _quantity;

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

        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
        }

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        public CartItem(SqlDataReader reader)
        {
            _id = (int)reader["Id"];
            _name = (string)reader["Name"];
            _price = (decimal)reader["Price"];
           _quantity = (int)reader["Quantity"];
        }
    }
}