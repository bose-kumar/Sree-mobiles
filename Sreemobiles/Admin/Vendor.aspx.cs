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
                BindVendorGrid();
                GetAutoID();
            }

        }

        private void GetAutoID()
        
        {

            try
            {
                SqlCommand cmd = new SqlCommand("Proc_GetAutoId", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                int id = Convert.ToInt32(cmd.ExecuteScalar());

                string prefix = "VEN";
                txtVendorCode.Text = prefix + id.ToString("D2");
            }
            catch (Exception ex)
            {
                ShowError("Error while generating Vendor ID", ex);
            }
            finally
            {
                con.Close();
            }
         }

        //Save Button Click Event
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hfRowId.Value))
            {
                InsertVendor();   // NEW RECORD
            }
            else
            {
                UpdateVendor();   // EDIT EXISTING ROW
            }


            ClearFields();
            hfRowId.Value = "";   // exit edit mode
            GetAutoID();
            BindVendorGrid();
        }
        void InsertVendor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(
                       ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("sp_InsertVendor", con))
                {
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
                }

                ShowSuccess("Vendor saved successfully");
            }
            catch (Exception ex)
            {
                ShowError("Error while saving vendor", ex);
            }
        }

        void UpdateVendor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(
                       ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("sp_UpdateVendor", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@RowId", Convert.ToInt32(hfRowId.Value));
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
                }

                ShowSuccess("Vendor updated successfully");
            }
            catch (Exception ex)
            {
                ShowError("Error while updating vendor", ex);
            }
        }

        // 🔹 GRID BIND METHOD
        void BindVendorGrid()
          {
            try
            {
                using (SqlConnection con = new SqlConnection(
                       ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("sp_GetVendors", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvVendors.DataSource = dt;
                        gvVendors.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError("Error loading vendor list", ex);
            }
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

       

        protected void btnVendorPayment_Click1(object sender, EventArgs e)
        {
            Response.Redirect("VendorPayment.aspx");
        }


        protected void gvVendors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteVendor")
            {
                int rowId = Convert.ToInt32(e.CommandArgument);
                DeleteVendorRow(rowId);
                BindVendorGrid();
            }

            if (e.CommandName == "EditVendor")
            {
                int rowId = Convert.ToInt32(e.CommandArgument);
                LoadVendorForEdit(rowId);
            }
        }
        void DeleteVendorRow(int rowId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("sp_deleteVendorRow", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RowId", rowId);

                con.Open();
                cmd.ExecuteNonQuery();

                ShowSuccess("Vendor deleted successfully");
            }
            catch (Exception ex)
            {
                ShowError("Error while deleting vendor", ex);
            }
            finally
            {
                con.Close();
            }
        }


        void LoadVendorForEdit(int rowId)
        {
            try
            {
                hfRowId.Value = rowId.ToString();

                using (SqlConnection con = new SqlConnection(
                       ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("sp_GetVendorByRowId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RowId", rowId);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            txtVendorCode.Text = dt.Rows[0]["VendorId"].ToString();
                            txtVendorName.Text = dt.Rows[0]["VendorName"].ToString();
                            txtAddress.Text = dt.Rows[0]["VendorAddress"].ToString();
                            txtGST.Text = dt.Rows[0]["GSTNo"].ToString();
                            txtEmail.Text = dt.Rows[0]["EmailId"].ToString();
                            txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                            txtBank.Text = dt.Rows[0]["BankName"].ToString();
                            txtBranch.Text = dt.Rows[0]["Branch"].ToString();
                            txtAccountNo.Text = dt.Rows[0]["AccountNo"].ToString();
                            txtAccountName.Text = dt.Rows[0]["AccountName"].ToString();
                            txtAccountType.Text = dt.Rows[0]["AccountType"].ToString();
                            txtIFSC.Text = dt.Rows[0]["IFSCCode"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError("Error loading vendor", ex);
            }
        }

        void ShowError(string message, Exception ex)
        {
            // 🔒 log ex.Message here if needed
            ScriptManager.RegisterStartupScript(
                this, GetType(), "err",
                $"alert('{message}');", true);
        }

        void ShowSuccess(string message)
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "ok",
                $"alert('{message}');", true);
        }




    }
}
