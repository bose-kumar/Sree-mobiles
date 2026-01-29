using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sreemobiles.Admin
{
    public partial class Vendor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection( ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVendorGrid();   // Page load-la grid bind
            }

        }
        //Save Button Click Event
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_InsertVendor", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@VendorId", txtVendorCode.Text);
            cmd.Parameters.AddWithValue("@VendorName", txtVendorName.Text);
            cmd.Parameters.AddWithValue("@VendorAddress", txtAddress.Text);
            cmd.Parameters.AddWithValue("@GSTNo", txtGST.Text);
            cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
            cmd.Parameters.AddWithValue("@BankName", txtBank.Text);
            cmd.Parameters.AddWithValue("@Branch", txtBranch.Text);
            cmd.Parameters.AddWithValue("@AccountNo", txtAccountNo.Text);
            cmd.Parameters.AddWithValue("@AccountName", txtAccountName.Text);
            cmd.Parameters.AddWithValue("@AccountType", txtAccountType.Text);
            cmd.Parameters.AddWithValue("@IFSCCode", txtIFSC.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClearFields();       // textbox clear
            BindVendorGrid();   // save ku apram grid refresh
        }
        // 🔹 GRID BIND METHOD
        void BindVendorGrid()
        {
            SqlCommand cmd = new SqlCommand("sp_GetVendors", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvVendors.DataSource = dt;
            gvVendors.DataBind();
        }
        // 🔹 CLEAR TEXTBOXES
        void ClearFields()
        {
            txtVendorCode.Text = "";
            txtVendorName.Text = "";
            txtAddress.Text = "";
            txtGST.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtBank.Text = "";
            txtBranch.Text = "";
            txtAccountNo.Text = "";
            txtAccountName.Text = "";
            txtAccountType.Text = "";
            txtIFSC.Text = "";
        }

    }
}
