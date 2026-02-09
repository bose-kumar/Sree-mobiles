using Sreemobiles.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.User
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            ProductDAL dal = new ProductDAL();
            rptProducts.DataSource = dal.GetProductsForUser();
            rptProducts.DataBind();
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                int pid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetails.aspx?id=" + pid);
            }
            else if (e.CommandName == "addcart")
            {
                int pid = Convert.ToInt32(e.CommandArgument);

                List<int> cart;

                if (Session["cart"] == null)
                    cart = new List<int>();
                else
                    cart = (List<int>)Session["cart"];

                cart.Add(pid);

                Session["cart"] = cart;

                Response.Redirect("CartPage.aspx");

            }
        }
    }
}