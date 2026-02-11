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

namespace Sreemobiles.Admin
{
    public partial class Purchase : System.Web.UI.Page
    {
        DataTable dtProducts;
        SqlConnection con = new SqlConnection(
    ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int nextId = GetNextProductAutoIdFromDB();
                ViewState["ProductAutoId"] = nextId;
                CreateProductTable();
                BindVendorDropdown();

            }
        }
        private int GetNextProductAutoIdFromDB()
        {
            int nextId = 1;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetNextProductAutoId", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                object result = cmd.ExecuteScalar();
                if (result != null)
                    nextId = Convert.ToInt32(result);
            }

            return nextId;
        }


        protected void gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            TextBox txtProductId = e.Row.FindControl("txtProductId") as TextBox;

            if (string.IsNullOrWhiteSpace(txtProductId.Text))
            {
                int autoId = Convert.ToInt32(ViewState["ProductAutoId"]);

                txtProductId.Text = "PRO" + autoId.ToString("D3");

                ViewState["ProductAutoId"] = autoId + 1;  // increment
            }

            CalculateRow(e.Row);
        }
       


        protected void txtProductId_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            if (txt == null) return;

            GridViewRow row = txt.NamingContainer as GridViewRow;
            if (row == null) return;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetProductById", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", txt.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0) return;

                SetText(row, "txtModel", dt.Rows[0]["Model"]);
                SetText(row, "txtProduct", dt.Rows[0]["Product"]);
                CalculateRow(row);
                CalculateSummary();
            }
        }
        private void SetText(GridViewRow row, string controlId, object value)
        {
            TextBox txt = row.FindControl(controlId) as TextBox;
            if (txt != null && value != null)
                txt.Text = value.ToString();
        }




        protected void ddlProductId_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;

            if (ddl.SelectedValue == "") return;

            using (SqlConnection con = new SqlConnection(
                   ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetProductById", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", ddl.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // ⭐ MODEL
                    ((TextBox)row.FindControl("txtModel")).Text =
                        dt.Rows[0]["Model"].ToString();

                    // ⭐ PRODUCT NAME
                    ((TextBox)row.FindControl("txtProduct")).Text =
                        dt.Rows[0]["Product"].ToString();

                    // OPTIONAL FIELDS
                    ((TextBox)row.FindControl("txtPurchase")).Text =
                        dt.Rows[0]["Purchase"].ToString();

                    ((TextBox)row.FindControl("txtTax")).Text =
                        dt.Rows[0]["Tax"].ToString();

                    ((TextBox)row.FindControl("txtMargin")).Text =
                        dt.Rows[0]["Margin"].ToString();

                    // Default Qty
                    ((TextBox)row.FindControl("txtQty")).Text = "1";
                }
            }

            CalculateRow(row);
            CalculateSummary();
        }
      


        void BindVendorDropdown()
        {
            using (SqlConnection con = new SqlConnection(
                   ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetVendorIds", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlVendorId.DataSource = dt;
                ddlVendorId.DataTextField = "VendorId";
                ddlVendorId.DataValueField = "VendorId";
                ddlVendorId.DataBind();
            }

            ddlVendorId.Items.Insert(0, new ListItem("-- Select Vendor --", ""));
        }

        protected void GridCell_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            GridViewRow row = (GridViewRow)txt.NamingContainer;

            CalculateRow(row);
            CalculateSummary();   // ⭐ only once
        }


        void CalculateRow(GridViewRow row)
        {
            decimal qty = GetDecimal(row, "txtQty");
            decimal purchase = GetDecimal(row, "txtPurchase");
            decimal taxPer = GetDecimal(row, "txtTax");
            decimal marginPer = GetDecimal(row, "txtMargin");

            if (qty <= 0 || purchase <= 0) return;

            decimal baseAmount = qty * purchase;
            decimal marginAmt = (baseAmount * marginPer) / 100;
            decimal sellingPrice = baseAmount + marginAmt;

            decimal taxAmt = (sellingPrice * taxPer) / 100;
            decimal cgst = taxAmt / 2;
            decimal sgst = taxAmt / 2;

            decimal mrp = sellingPrice + taxAmt;
            decimal total = baseAmount + taxAmt;

            SetText(row, "txtTaxAmt", taxAmt.ToString("0.00"));
            SetText(row, "txtCGST", cgst.ToString("0.00"));
            SetText(row, "txtSGST", sgst.ToString("0.00"));
            SetText(row, "txtMRP", mrp.ToString("0.00"));
            SetText(row, "txtTotal", total.ToString("0.00"));
        }
        private decimal GetDecimal(GridViewRow row, string controlId)
        {
            TextBox txt = row.FindControl(controlId) as TextBox;
            decimal value = 0;
            if (txt != null)
                decimal.TryParse(txt.Text, out value);
            return value;
        }




        protected void txtDiscountPer_TextChanged(object sender, EventArgs e)
        {
            CalculateSummary();
        }


        void CalculateSummary()
        {
            decimal netQty = 0;
            decimal totalCGST = 0;
            decimal totalSGST = 0;
            decimal netMargin = 0;
            decimal grossAmount = 0;

            foreach (GridViewRow row in gvProducts.Rows)
            {
                TextBox txtQty = (TextBox)row.FindControl("txtQty");
                TextBox txtCGST = (TextBox)row.FindControl("txtCGST");
                TextBox txtSGST = (TextBox)row.FindControl("txtSGST");
                TextBox txtTotal = (TextBox)row.FindControl("txtTotal");
                TextBox txtPurchase = (TextBox)row.FindControl("txtPurchase");
                TextBox txtMargin = (TextBox)row.FindControl("txtMargin");

                decimal qty = 0, cgst = 0, sgst = 0, total = 0;
                decimal purchase = 0, marginPer = 0;

                decimal.TryParse(txtQty.Text, out qty);
                decimal.TryParse(txtCGST.Text, out cgst);
                decimal.TryParse(txtSGST.Text, out sgst);
                decimal.TryParse(txtTotal.Text, out total);
                decimal.TryParse(txtPurchase.Text, out purchase);
                decimal.TryParse(txtMargin.Text, out marginPer);

                decimal baseAmount = qty * purchase;
                decimal marginAmt = (baseAmount * marginPer) / 100;

                netQty += qty;
                totalCGST += cgst;
                totalSGST += sgst;
                netMargin += marginAmt;
                grossAmount += total;
            }

            // Discount
            decimal discountPer = 0;

            if (!decimal.TryParse(txtDiscountPer.Text, out discountPer))
            {
                discountPer = 0;
                txtDiscountPer.Text = "0";  // force display 0
            }

            decimal discountAmt = (grossAmount * discountPer) / 100;
            decimal billAmount = grossAmount - discountAmt;

            // ===== BIND TO SUMMARY TEXTBOXES =====
            txtNetQty.Text = netQty.ToString("0");
            txtTotalCGST.Text = totalCGST.ToString("0.00");
            txtTotalSGST.Text = totalSGST.ToString("0.00");
            txtNetMargin.Text = netMargin.ToString("0.00");
            txtDiscountAmt.Text = discountAmt.ToString("0.00");
            txtBillAmount.Text = billAmount.ToString("0.00");
        }



        private void CreateProductTable()
        {
            dtProducts = new DataTable();

            dtProducts.Columns.Add("ProductId");
            dtProducts.Columns.Add("Model");
            dtProducts.Columns.Add("Product");
            dtProducts.Columns.Add("Qty");
            dtProducts.Columns.Add("Purchase");
            dtProducts.Columns.Add("Tax");
            dtProducts.Columns.Add("MRP");
            dtProducts.Columns.Add("Margin");
            dtProducts.Columns.Add("TaxAmt");
            dtProducts.Columns.Add("Total");
            dtProducts.Columns.Add("CGST");
            dtProducts.Columns.Add("SGST");

            // first empty row
            dtProducts.Rows.Add(dtProducts.NewRow());

            ViewState["Products"] = dtProducts;
            BindGrid();
        }
        protected void ddlVendorId_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlVendorId.SelectedValue))
            {
                LoadVendorDetails(ddlVendorId.SelectedValue);
            }
            else
            {
                ClearVendorFields();
            }
        }
        void ClearVendorFields()
        {
            txtVendor.Text = "";
            txtMobile.Text = "";
        }

        void LoadVendorDetails(string vendorId)
        {
            using (SqlConnection con = new SqlConnection(
                   ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetVendorByVendorId", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VendorId", vendorId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    txtVendor.Text = dt.Rows[0]["VendorName"].ToString();
                    txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                }
            }
        }

        private void UpdateDataTableFromGrid()
        {
            DataTable dt = ViewState["Products"] as DataTable;
            if (dt == null) return;

            for (int i = 0; i < gvProducts.Rows.Count; i++)
            {
                GridViewRow row = gvProducts.Rows[i];

                TextBox txtProductId = row.FindControl("txtProductId") as TextBox;
                TextBox txtModel = row.FindControl("txtModel") as TextBox;
                TextBox txtProduct = row.FindControl("txtProduct") as TextBox;
                TextBox txtQty = row.FindControl("txtQty") as TextBox;
                TextBox txtPurchase = row.FindControl("txtPurchase") as TextBox;
                TextBox txtTax = row.FindControl("txtTax") as TextBox;
                TextBox txtMargin = row.FindControl("txtMargin") as TextBox;
                TextBox txtTaxAmt = row.FindControl("txtTaxAmt") as TextBox;
                TextBox txtTotal = row.FindControl("txtTotal") as TextBox;
                TextBox txtCGST = row.FindControl("txtCGST") as TextBox;
                TextBox txtSGST = row.FindControl("txtSGST") as TextBox;

                // ⭐ NULL SAFETY
                if (txtProductId == null) continue;

                dt.Rows[i]["ProductId"] = txtProductId.Text;
                dt.Rows[i]["Model"] = txtModel?.Text;
                dt.Rows[i]["Product"] = txtProduct?.Text;
                dt.Rows[i]["Qty"] = txtQty?.Text;
                dt.Rows[i]["Purchase"] = txtPurchase?.Text;
                dt.Rows[i]["Tax"] = txtTax?.Text;
                dt.Rows[i]["Margin"] = txtMargin?.Text;
                dt.Rows[i]["TaxAmt"] = txtTaxAmt?.Text;
                dt.Rows[i]["Total"] = txtTotal?.Text;
                dt.Rows[i]["CGST"] = txtCGST?.Text;
                dt.Rows[i]["SGST"] = txtSGST?.Text;
            }

            ViewState["Products"] = dt;
        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            UpdateDataTableFromGrid();   // ⭐ save old rows first

            DataTable dt = ViewState["Products"] as DataTable;
            DataRow dr = dt.NewRow();    // empty new row
            dt.Rows.Add(dr);

            ViewState["Products"] = dt;
            //ViewState["ProductAutoId"] = GetNextProductAutoIdFromDB();

            BindGrid();
        
        }



        void BindGrid()
        {
            DataTable dt = ViewState["Products"] as DataTable;
            if (dt != null)
            {
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }
        protected void btnNewInvoice_Click(object sender, EventArgs e)
        {
            // 🔹 Clear Vendor section
            ddlVendorId.SelectedIndex = 0;
            txtVendor.Text = "";
            txtMobile.Text = "";
            ddlPayment.SelectedIndex = 0;
            txtInvoiceNo.Text = "";
            txtDate.Text = "";

            // 🔹 Clear Grid (recreate fresh table)
            CreateProductTable();   // this already adds ONE empty row

            // 🔹 Clear Summary
            txtNetQty.Text = "";
            txtTotalCGST.Text = "";
            txtTotalSGST.Text = "";
            txtNetMargin.Text = "";
            txtDiscountPer.Text = "";
            txtDiscountAmt.Text = "";
            txtBillAmount.Text = "";
            ViewState["ProductAutoId"] = GetNextProductAutoIdFromDB();
            ClearAll();
            //ViewState["ProductAutoId"] = GetNextProductAutoIdFromDB();
        }
        private void ClearAll()
        {
            // Vendor section
            ddlVendorId.SelectedIndex = 0;
            txtVendor.Text = "";
            txtMobile.Text = "";
            ddlPayment.SelectedIndex = 0;
            txtInvoiceNo.Text = "";
            txtDate.Text = "";

            // Grid reset
            //ViewState["Products"] = null;
            //ViewState["ProductAutoId"] = 1;
            CreateProductTable();   // one empty row

            // Summary clear
            txtNetQty.Text = "";
            txtTotalCGST.Text = "";
            txtTotalSGST.Text = "";
            txtNetMargin.Text = "";
            txtDiscountPer.Text = "";
            txtDiscountAmt.Text = "";
            txtBillAmount.Text = "";

            txtDiscountPer.Text = "0";   // ✅ important
            txtDiscountAmt.Text = "0.00";
            txtBillAmount.Text = "0.00";
        }


        protected void Save_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(
       ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                con.Open();
                SqlTransaction trans = con.BeginTransaction();

                try
                {
                    foreach (GridViewRow row in gvProducts.Rows)
                    {
                        if (row.RowType != DataControlRowType.DataRow)
                            continue;

                        string productId = GetString(row, "txtProductId");
                        if (string.IsNullOrWhiteSpace(productId))
                            continue;

                        // =====================
                        // 1️⃣ PRODUCT MASTER
                        // =====================
                        using (SqlCommand cmd1 = new SqlCommand("sp_UpsertProductMaster", con, trans))
                        {
                            cmd1.CommandType = CommandType.StoredProcedure;

                            cmd1.Parameters.AddWithValue("@ProductId", productId);
                            cmd1.Parameters.AddWithValue("@Model", GetString(row, "txtModel"));
                            cmd1.Parameters.AddWithValue("@Product", GetString(row, "txtProduct"));
                            cmd1.Parameters.AddWithValue("@Qty", GetDecimal(row, "txtQty"));
                            cmd1.Parameters.AddWithValue("@Purchase", GetDecimal(row, "txtPurchase"));
                            cmd1.Parameters.AddWithValue("@Tax", GetDecimal(row, "txtTax"));
                            cmd1.Parameters.AddWithValue("@Margin", GetDecimal(row, "txtMargin"));

                            cmd1.ExecuteNonQuery();
                        }

                        // =====================
                        // 2️⃣ PURCHASE SAVE
                        // =====================
                        using (SqlCommand cmd2 = new SqlCommand("sp_SavePurchaseSingleTable", con, trans))
                        {
                            cmd2.CommandType = CommandType.StoredProcedure;

                            cmd2.Parameters.AddWithValue("@InvoiceNo", txtInvoiceNo.Text.Trim());
                            cmd2.Parameters.AddWithValue("@InvoiceDate", Convert.ToDateTime(txtDate.Text));
                            cmd2.Parameters.AddWithValue("@VendorId", ddlVendorId.SelectedValue);
                            cmd2.Parameters.AddWithValue("@VendorName", txtVendor.Text.Trim());
                            cmd2.Parameters.AddWithValue("@MobileNo", txtMobile.Text.Trim());
                            cmd2.Parameters.AddWithValue("@PaymentMode", ddlPayment.SelectedValue);

                            cmd2.Parameters.AddWithValue("@ProductId", productId);
                            cmd2.Parameters.AddWithValue("@Model", GetString(row, "txtModel"));
                            cmd2.Parameters.AddWithValue("@Product", GetString(row, "txtProduct"));
                            cmd2.Parameters.AddWithValue("@Qty", GetDecimal(row, "txtQty"));
                            cmd2.Parameters.AddWithValue("@Purchase", GetDecimal(row, "txtPurchase"));
                            cmd2.Parameters.AddWithValue("@Tax", GetDecimal(row, "txtTax"));
                            cmd2.Parameters.AddWithValue("@Margin", GetDecimal(row, "txtMargin"));
                            cmd2.Parameters.AddWithValue("@TaxAmount", GetDecimal(row, "txtTaxAmt"));
                            cmd2.Parameters.AddWithValue("@CGST", GetDecimal(row, "txtCGST"));
                            cmd2.Parameters.AddWithValue("@SGST", GetDecimal(row, "txtSGST"));
                            cmd2.Parameters.AddWithValue("@MRP", GetDecimal(row, "txtMRP"));
                            cmd2.Parameters.AddWithValue("@TotalAmount", GetDecimal(row, "txtTotal"));

                            cmd2.Parameters.AddWithValue("@NetQty", Convert.ToDecimal(txtNetQty.Text));
                            cmd2.Parameters.AddWithValue("@TotalCGST", Convert.ToDecimal(txtTotalCGST.Text));
                            cmd2.Parameters.AddWithValue("@TotalSGST", Convert.ToDecimal(txtTotalSGST.Text));
                            cmd2.Parameters.AddWithValue("@NetMargin", Convert.ToDecimal(txtNetMargin.Text));
                            cmd2.Parameters.AddWithValue("@DiscountPer", Convert.ToDecimal(txtDiscountPer.Text));
                            cmd2.Parameters.AddWithValue("@DiscountAmount", Convert.ToDecimal(txtDiscountAmt.Text));
                            cmd2.Parameters.AddWithValue("@BillAmount", Convert.ToDecimal(txtBillAmount.Text));

                            cmd2.ExecuteNonQuery();
                        }
                    }

                    trans.Commit();

                    // ✅ Success Toast
                    ShowToast("Purchase Saved Successfully ✅", "success");

                    ViewState["ProductAutoId"] = GetNextProductAutoIdFromDB();
                    ClearAll();
                }
                catch (Exception ex)
                {
                    trans.Rollback();

                    // ❌ Error Toast
                    ShowToast("Error: " + ex.Message.Replace("'", ""), "error");
                }
            }

        }
        private string GetString(GridViewRow row, string controlId)
        {
            TextBox txt = row.FindControl(controlId) as TextBox;
            return txt != null ? txt.Text.Trim() : "";
        }
        private void ShowToast(string message, string type)
        {
            string bgColor = type == "success" ? "#28a745" : "#dc3545";

            string script = $@"
        <script>
            var toast = document.createElement('div');
            toast.innerHTML = '{message}';
            toast.style.position = 'fixed';
            toast.style.top = '20px';
            toast.style.right = '20px';
            toast.style.padding = '12px 20px';
            toast.style.background = '{bgColor}';
            toast.style.color = 'white';
            toast.style.borderRadius = '6px';
            toast.style.zIndex = '9999';
            toast.style.boxShadow = '0 4px 8px rgba(0,0,0,0.2)';
            document.body.appendChild(toast);
            setTimeout(function() {{
                toast.remove();
            }}, 3000);
        </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "toast", script, false);
        }


    }
}
