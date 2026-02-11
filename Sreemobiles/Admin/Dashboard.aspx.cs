using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public string MonthLabels = "[]";
        public string MonthData = "[]";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardCounts();
                LoadChartData();
            }
        }

        private void LoadDashboardCounts()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                lblProducts.Text = ExecuteScalar(con,
                    "select count(*) from Products where IsActive = 1");

                lblMobile.Text = ExecuteScalar(con,
                    "select count(*) from Products where IsActive = 1 and Category='Mobile'");

                lblAccessories.Text = ExecuteScalar(con,
                    "select count(*) from Products where IsActive = 1 and Category='Accessories'");

                lblTV.Text = ExecuteScalar(con,
                    "select count(*) from Products where IsActive = 1 and Category='TV'");

                lblStock.Text = ExecuteScalar(con,
                    "select isnull(sum(Quantity),0) from Products where IsActive = 1");

                // temporary values (orders table illa nu sonnenga)
                lblOrders.Text = "0";
                lblPending.Text = "0";
                lblCustomers.Text = "0";
            }
        }

        private string ExecuteScalar(SqlConnection con, string sql)
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                object val = cmd.ExecuteScalar();
                return val == null ? "0" : val.ToString();
            }
        }

   
        private void LoadChartData()
        {
            
        }
    }
}