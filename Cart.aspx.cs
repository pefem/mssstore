using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckUser();
        LoadCart();
        LoadCustCartCount();
        HttpContext context = HttpContext.Current;
        context.Session.Remove("ShoppingCart");
    }

    private void LoadCustCartCount()
    {
        try
        {
            //Check to ensure that a customer as login then use his username to count his cart items
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
            {
                userName = context.User.Identity.Name;

                //Count customer cart items using his login username
                int getCustCartCount = ShoppingCart.ShoppingCart.CountCustomerCartItems(userName);
                lblCount.Text = getCustCartCount.ToString();
            }
            else 
            {
                lblCount.Text = "0";
            }
        }
        catch (Exception ex)
        {

        }
    }

    private void LoadCart()
    {
        //Check to ensure that a customer as login then use his username to get his cart items
        HttpContext context = HttpContext.Current;
        string userName = context.Request.AnonymousID;
        if (context.Request.IsAuthenticated)
        {
            userName = context.User.Identity.Name;

            //get  customer cart items using his login username
            grdShoppingCart.DataSource = ShoppingCart.ShoppingCart.Select(userName);
            grdShoppingCart.DataBind();


          //  subPanel.Visible = true;

            //Links to go back to shopping and empty cart label set to false
           // ContinueShoppingLink.Visible = false;
           // lblEmptyCartMessage.Visible = false;
        }
        
        else
        {
           // subPanel.Visible = false;
           // ContinueShoppingLink.Visible = true;
           // lblEmptyCartMessage.Visible = true;
            return;
        }
       
    }
    protected void srcProduct_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {

    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        //Check to ensure that a customer as login then use his username to get his cart items
        HttpContext context = HttpContext.Current;
        string userName = context.Request.AnonymousID;
        if (context.Request.IsAuthenticated)
        {
            userName = context.User.Identity.Name;

            //get  customer cart items using his login username
            int productId = Int32.Parse(Request.QueryString["pid"]);
            ShoppingCart.ShoppingCart.Insert(productId, userName);
        }
        else
        {
            return;
        }
       
        
    }
    protected void grdShoppingCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Check to ensure that a customer as login then use his username
        HttpContext context = HttpContext.Current;
        string userName = context.Request.AnonymousID;
        if (context.Request.IsAuthenticated)
        {
            userName = context.User.Identity.Name;

            //get  customer cart items using his login username to delete his cart items
            int productId = Int32.Parse(Request.QueryString["pid"]);
            ShoppingCart.ShoppingCart.Delete(userName, productId);
        }
        else
        {
            return;
        }

        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Cart.aspx");
    }
    private decimal _total = 0;

    /// <summary>
    /// Calculate running total as rows are bound to the GridView
    /// </summary>
    protected void grdShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CalculateSubTotal(e);
    }

    private void CalculateSubTotal(GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            decimal price = (decimal)DataBinder.Eval(e.Row.DataItem, "Price");
            int quantity = (int)DataBinder.Eval(e.Row.DataItem, "Quantity");
            _total += (price * quantity);
        }
    }

    /// <summary>
    /// Show price total and check out link
    /// </summary>
    protected void grdShoppingCart_DataBound(object sender, EventArgs e)
    {
        LoadSubTotal();
    }

    private void LoadSubTotal()
    {
        HttpContext context = HttpContext.Current;
        string userName = context.Request.AnonymousID;
        if (_total == 0 && context.Request.IsAuthenticated)
        {
            lnkCheckOut.Visible = false;
           subPanel.Visible = false;
            ContinueShoppingLink.Visible = true;
        }

        else
        {
            Label lblTotal = (Label)grdShoppingCart.FooterRow.FindControl("lblTotal");
            //lblTotal.Text = _total.ToString();
            lblSubTotal.Text = _total.ToString();
            ContinueShoppingLink.Visible = false;
          //subPanel.Visible = true;

        }
    }

    protected void grdShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        string cmd = e.CommandName;


        if (cmd.Equals("Del"))
        {
            //Check to ensure that a customer as login then use his username
            HttpContext context = HttpContext.Current;
            string userName = context.Request.AnonymousID;
            if (context.Request.IsAuthenticated)
            {
                userName = context.User.Identity.Name;
                ShoppingCart.ShoppingCart.Delete(userName, id);
               
                
                LoadCart();
                Response.Redirect("~/Cart.aspx");
            
            }
            else
            {
                return;
            }
           
           
        }
    }

    private void CheckUser()
    {

        HttpContext context = HttpContext.Current;
        string userName = context.Request.AnonymousID;
        if (!context.Request.IsAuthenticated)
        {
            subPanel.Visible = false;
            ContinueShoppingLink.Visible = true;
            lblEmptyCartMessage.Visible = true;
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //After payament and the payment getway retures true. Convert customer cart to order and take him to his download page
        
        HttpContext context = HttpContext.Current;
        string userName = context.Request.AnonymousID;
        if (context.Request.IsAuthenticated)
        {
            userName = context.User.Identity.Name;

            //get  customer cart items using his login username to delete his cart items
            ShoppingCart.Order.AddOrder(userName);
            Response.Redirect("~/Download.aspx");
        }
        else
        {
            return;
        }
        

        
        
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Download.aspx");
    }
}