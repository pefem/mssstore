using System;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

namespace ShoppingCart
{


/// <summary>
/// Represents a custom order and methods for 
/// working with orders
/// </summary>
public class Order
{

    private static readonly string _connectionString;

    private int _id;
    private string _userName;
    private string _ccName;
    private CreditCardType _ccType;
    private string _ccNumber;
    private int _ccExpiryMonth;
    private int _ccExpiryYear;
    private string _billingStreet;
    private string _billingCity;
    private string _billingState;
    private string _billingPostalCode;
    private string _billingCountry;
    private string _shippingStreet;
    private string _shippingCity;
    private string _shippingState;
    private string _shippingPostalCode;
    private string _shippingCountry;
    private DateTime _entryDate;


    public int Id
    {
        get { return _id; }
    }

    public string UserName
    {
        get { return _userName; }
        set { _userName = value; }
    }


    public string CCName
    {
        get { return _ccName; }
        set { _ccName = value; }
    }


    public CreditCardType CCType
    {
        get { return _ccType; }
        set { _ccType = value; }
    }


    public string CCNumber
    {
        get { return _ccNumber; }
        set { _ccNumber = value; }
    }


    public int CCExpiryMonth
    {
        get { return _ccExpiryMonth; }
        set { _ccExpiryMonth = value; }
    }


    public int CCExpiryYear
    {
        get { return _ccExpiryYear; }
        set { _ccExpiryYear = value; }
    }


    public string BillingStreet
    {
        get { return _billingStreet; }
        set { _billingStreet = value; }
    }


    public string BillingCity
    {
        get { return _billingCity; }
        set { _billingCity = value; }
    }


    public string BillingState
    {
        get { return _billingState; }
        set { _billingState = value; }
    }


    public string BillingPostalCode
    {
        get { return _billingPostalCode; }
        set { _billingPostalCode = value; }
    }


    public string BillingCountry
    {
        get { return _billingCountry; }
        set { _billingCountry = value; }
    }



    public string ShippingStreet
    {
        get { return _shippingStreet; }
        set { _shippingStreet = value; }
    }


    public string ShippingCity
    {
        get { return _shippingCity; }
        set { _shippingCity = value; }
    }


    public string ShippingState
    {
        get { return _shippingState; }
        set { _shippingState = value; }
    }


    public string ShippingPostalCode
    {
        get { return _shippingPostalCode; }
        set { _shippingPostalCode = value; }
    }


    public string ShippingCountry
    {
        get { return _shippingCountry; }
        set { _shippingCountry = value; }
    }


    public DateTime EntryDate
    {
        get { return _entryDate; }
    }

    /// <summary>
    /// Retrieve all customer orders from database
    /// </summary>
    /// 
    public static void AddOrder(string userName)
    { 
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("PlaceOrder", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", userName);

            con.Open();
            cmd.ExecuteNonQuery();
  
    }
    public static List<Order> GetCustDownload(string userName)
    {
        // Initialize command
        SqlConnection con = new SqlConnection(_connectionString);
        SqlCommand cmd = new SqlCommand("GetCustomerDownload", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", userName);

        List<Order> results = new List<Order>();
        using (con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                results.Add(new Order(reader));
        }
        return results;
    }

  
    /// <summary>
    /// Initialize an order from a DataReader
    /// </summary>
    public Order(SqlDataReader reader)
    {
        _id = (int)reader["Id"];
        _userName = (string)reader["UserName"];
        _ccName = (string)reader["CCName"];
        _ccType = (CreditCardType)reader["CCType"];
        _ccNumber = Secret.Decrypt((byte[])reader["CCNumber_Encrypted"]);
        _ccExpiryMonth = (int)reader["CCExpiryMonth"];
        _ccExpiryYear = (int)reader["CCExpiryYear"];
        _billingStreet = (string)reader["BillingStreet"];
        _billingCity = (string)reader["BillingCity"];
        _billingState = (string)reader["BillingState"];
        _billingPostalCode = (string)reader["BillingPostalCode"];
        _billingCountry = (string)reader["BillingCountry"];
        _shippingStreet = (string)reader["ShippingStreet"];
        _shippingCity = (string)reader["ShippingCity"];
        _shippingState = (string)reader["ShippingState"];
        _shippingPostalCode = (string)reader["ShippingPostalCode"];
        _shippingCountry = (string)reader["ShippingCountry"];
        _entryDate = (DateTime)reader["EntryDate"];
    }


    public Order()
	{
	}

    /// <summary>
    /// Retrieve database connection string from Web configuration
    /// </summary>
    static Order()
    {
        _connectionString = WebConfigurationManager.ConnectionStrings["Store"].ConnectionString;
    }


}
    /// <summary>
    /// Represents an individual order item. There is
    /// a one-to-one correspondence between shopping
    /// cart items and order items
    /// </summary>
    public class OrderItem
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
        
        public OrderItem(SqlDataReader reader)
        {
            _id = (int)reader["Id"];
            _name = (string)reader["Name"];
            _price = (decimal)reader["Price"];
            _quantity = (int)reader["Quantity"];
        }

    }



}