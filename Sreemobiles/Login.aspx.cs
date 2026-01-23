using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();

                // TEMP VALIDATION
                if (username == "" || password == "")
                {
                    lblMsg.Text = "Please enter username and password";
                    return;
                }

                // TEMP LOGIN (NO DATABASE)
                if (username == "admin" && password == "1234")
                {
                    Session["Admin"] = username;
                    Response.Redirect("~/Admin/Dashboard.aspx");
                }
                else
                {
                    lblMsg.Text = "Invalid Username or Password";
                }
            }
        }
    }
}