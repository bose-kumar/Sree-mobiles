using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }
        void LoadProducts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                using (SqlCommand cmd = new SqlCommand("sp_GetProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvProducts.DataSource = dt;
                        gvProducts.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Optional: show error
                Response.Write("<script>alert('Error loading products: " + ex.Message + "');</script>");
            }
        }
    }
}