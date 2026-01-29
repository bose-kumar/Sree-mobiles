using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sreemobiles.Admin
{
    public partial class Vendor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
            }

        }

        protected void btnVendorPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("VendorPayment.aspx");
        }
    }
}