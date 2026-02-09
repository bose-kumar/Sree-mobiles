using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.User
{
    public partial class User : System.Web.UI.MasterPage
    {
             protected void Page_Load(object sender, EventArgs e)
        {
            LoadCartCount();
        }

        protected void btn_Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }

        protected void btn_About_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/About.aspx"); 
        }

        protected void btn_Products_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Product.aspx");
        }

        protected void btn_Contact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Contact.aspx");
        }

        protected void btnFooterHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }

        protected void btnFooterAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/About.aspx");
        }

        protected void btnFooterProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Product.aspx");
        }

        protected void btnFooterContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Contact.aspx");
        }
        private void LoadCartCount()
        {
            if (Session["cart"] != null)
            {
                List<int> cart = (List<int>)Session["cart"];
                lblCartCount.Text = cart.Count.ToString();
                lblCartCount.Visible = cart.Count > 0;
            }
            else
            {
                lblCartCount.Visible = false;
            }
        }

    }
}