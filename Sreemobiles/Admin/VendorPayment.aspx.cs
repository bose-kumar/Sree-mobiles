using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sreemobiles.Admin
{
    public partial class VendorPayment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!IsPostBack)
                {
                    LoadVendors();
                    LoadPayments();
                    ClearForm();
                }
            }

            // -------------------------
            // Load vendor dropdown
            // -------------------------
            void LoadVendors()
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT VendorCode,VendorName FROM dbo.VendorMaster", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlVendorCode.DataSource = dt;
                    ddlVendorCode.DataTextField = "VendorCode";
                    ddlVendorCode.DataValueField = "VendorCode";
                    ddlVendorCode.DataBind();
                    ddlVendorCode.Items.Insert(0, "SELECT");

                    ddlVendorName.DataSource = dt;
                    ddlVendorName.DataTextField = "VendorName";
                    ddlVendorName.DataValueField = "VendorCode";
                    ddlVendorName.DataBind();
                    ddlVendorName.Items.Insert(0, "SELECT");
                }
            }

            // -------------------------
            // ID select panna ellaa labelum show
            // -------------------------
            void LoadVendorDetails(int vendorCode)
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT MobileNo,VendorAddress
                  FROM dbo.VendorMaster
                  WHERE VendorCode=@VendorCode", con))
                {
                    cmd.Parameters.Add("@VendorCode", SqlDbType.Int).Value = vendorCode;

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        lblMobile.Text = dr["MobileNo"].ToString();
                        lblAddress.Text = dr["VendorAddress"].ToString();
                    }
                    else
                    {
                        lblMobile.Text = "";
                        lblAddress.Text = "";
                    }
                }
            }

            // -------------------------
            // Load invoice dropdown
            // -------------------------
            void LoadInvoices(int vendorCode)
            {
                ddlInvoice.Items.Clear();

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da = new SqlDataAdapter(
                    @"SELECT InvoiceNo,TotalAmount
                  FROM dbo.VendorInvoice
                  WHERE VendorCode=@VendorCode", con))
                {
                    da.SelectCommand.Parameters.Add("@VendorCode", SqlDbType.Int)
                        .Value = vendorCode;

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlInvoice.DataSource = dt;
                    ddlInvoice.DataTextField = "InvoiceNo";
                    ddlInvoice.DataValueField = "InvoiceNo";
                    ddlInvoice.DataBind();
                    ddlInvoice.Items.Insert(0, "SELECT");
                }
            }

            // -------------------------
            // Vendor change
            // -------------------------
            protected void ddlVendorCode_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddlVendorName.SelectedValue = ddlVendorCode.SelectedValue;

                if (ddlVendorCode.SelectedIndex > 0)
                {
                    int id = Convert.ToInt32(ddlVendorCode.SelectedValue);
                    LoadInvoices(id);
                    LoadVendorDetails(id);
                }
            }

            protected void ddlVendorName_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddlVendorCode.SelectedValue = ddlVendorName.SelectedValue;

                if (ddlVendorName.SelectedIndex > 0)
                {
                    int id = Convert.ToInt32(ddlVendorName.SelectedValue);
                    LoadInvoices(id);
                    LoadVendorDetails(id);
                }
            }

            // -------------------------
            // Invoice select
            // -------------------------
            protected void ddlInvoice_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (ddlInvoice.SelectedIndex == 0) return;

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT TotalAmount
                  FROM dbo.VendorInvoice
                  WHERE VendorCode=@VendorCode
                  AND InvoiceNo=@InvoiceNo", con))
                {
                    cmd.Parameters.Add("@VendorCode", SqlDbType.Int)
                        .Value = Convert.ToInt32(ddlVendorCode.SelectedValue);

                    cmd.Parameters.Add("@InvoiceNo", SqlDbType.VarChar, 50)
                        .Value = ddlInvoice.SelectedValue;

                    con.Open();
                    object val = cmd.ExecuteScalar();

                    if (val != null)
                    {
                        txtTotalAmount.Text = val.ToString();
                        txtBalanceAmount.Text = val.ToString();
                    }
                }
            }

            // -------------------------
            // Grid load
            // -------------------------
            void LoadPayments()
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da = new SqlDataAdapter(
                    @"SELECT P.PaymentId,
                         V.VendorName,
                         P.InvoiceNo,
                         P.PaymentDate,
                         P.TotalAmount,
                         P.PaidAmount,
                         P.BalanceAmount
                  FROM dbo.VendorPayment P
                  JOIN dbo.VendorMaster V
                  ON P.VendorCode=V.VendorCode
                  ORDER BY P.PaymentId DESC", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvPayments.DataSource = dt;
                    gvPayments.DataBind();
                }
            }

            // -------------------------
            // Save / Update
            // -------------------------
            protected void btnSave_Click(object sender, EventArgs e)
            {
                if (ddlVendorCode.SelectedIndex == 0 || ddlInvoice.SelectedIndex == 0)
                    return;

                decimal total = Convert.ToDecimal(txtTotalAmount.Text);
                decimal paid = Convert.ToDecimal(txtPaidlAmount.Text);
                decimal balance = total - paid;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd;

                    if (ViewState["EditId"] == null)
                    {
                        cmd = new SqlCommand(@"
                    INSERT INTO dbo.VendorPayment
                    (VendorCode,InvoiceNo,PaymentDate,PaymentMode,
                     TotalAmount,PaidAmount,BalanceAmount,Remarks)
                    VALUES
                    (@VendorCode,@InvoiceNo,@PaymentDate,@PaymentMode,
                     @TotalAmount,@PaidAmount,@BalanceAmount,@Remarks)", con);
                    }
                    else
                    {
                        cmd = new SqlCommand(@"
                    UPDATE dbo.VendorPayment SET
                        VendorCode=@VendorCode,
                        InvoiceNo=@InvoiceNo,
                        PaymentDate=@PaymentDate,
                        PaymentMode=@PaymentMode,
                        TotalAmount=@TotalAmount,
                        PaidAmount=@PaidAmount,
                        BalanceAmount=@BalanceAmount,
                        Remarks=@Remarks
                    WHERE PaymentId=@PaymentId", con);

                        cmd.Parameters.Add("@PaymentId", SqlDbType.Int)
                            .Value = Convert.ToInt32(ViewState["EditId"]);
                    }

                    cmd.Parameters.Add("@VendorCode", SqlDbType.Int)
                        .Value = Convert.ToInt32(ddlVendorCode.SelectedValue);

                    cmd.Parameters.Add("@InvoiceNo", SqlDbType.VarChar, 50)
                        .Value = ddlInvoice.SelectedValue;

                    cmd.Parameters.Add("@PaymentDate", SqlDbType.Date)
                        .Value = DateTime.Parse(txtPaymentDate.Text);

                    cmd.Parameters.Add("@PaymentMode", SqlDbType.VarChar, 30)
                        .Value = ddlPaymentMode.SelectedItem.Text;

                    cmd.Parameters.Add("@TotalAmount", SqlDbType.Decimal).Value = total;
                    cmd.Parameters.Add("@PaidAmount", SqlDbType.Decimal).Value = paid;
                    cmd.Parameters.Add("@BalanceAmount", SqlDbType.Decimal).Value = balance;

                    cmd.Parameters.Add("@Remarks", SqlDbType.VarChar, 200)
                        .Value = string.IsNullOrWhiteSpace(txtRemarks.Text)
                        ? (object)DBNull.Value
                        : txtRemarks.Text;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearForm();
                LoadPayments();
            }

            // -------------------------
            // Edit / Delete
            // -------------------------
            protected void gvPayments_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
            {
                int id = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "EditPay")
                    LoadForEdit(id);

                if (e.CommandName == "DeletePay")
                {
                    DeletePayment(id);
                    LoadPayments();
                }
            }

            void LoadForEdit(int id)
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM dbo.VendorPayment WHERE PaymentId=@id", con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        ViewState["EditId"] = id;

                        ddlVendorCode.SelectedValue = dr["VendorCode"].ToString();
                        ddlVendorName.SelectedValue = dr["VendorCode"].ToString();

                        int vid = Convert.ToInt32(dr["VendorCode"]);
                        LoadInvoices(vid);
                        LoadVendorDetails(vid);

                        ddlInvoice.SelectedValue = dr["InvoiceNo"].ToString();

                        txtPaymentDate.Text =
                            Convert.ToDateTime(dr["PaymentDate"]).ToString("yyyy-MM-dd");

                        ddlPaymentMode.SelectedValue = dr["PaymentMode"].ToString();
                        txtTotalAmount.Text = dr["TotalAmount"].ToString();
                        txtPaidlAmount.Text = dr["PaidAmount"].ToString();
                        txtBalanceAmount.Text = dr["BalanceAmount"].ToString();
                        txtRemarks.Text = dr["Remarks"].ToString();

                        btnSave.Text = "Update Payment";
                    }
                }
            }

            void DeletePayment(int id)
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(
                    "DELETE FROM dbo.VendorPayment WHERE PaymentId=@id", con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // -------------------------
            void ClearForm()
            {
                ddlVendorCode.SelectedIndex = 0;
                ddlVendorName.SelectedIndex = 0;

                ddlInvoice.Items.Clear();
                ddlInvoice.Items.Insert(0, "SELECT");

                txtTotalAmount.Text = "";
                txtPaidlAmount.Text = "";
                txtBalanceAmount.Text = "";
                txtPaymentDate.Text = "";
                txtRemarks.Text = "";

                lblMobile.Text = "";
                lblAddress.Text = "";

                ViewState["EditId"] = null;
                btnSave.Text = "Save Payment";
            }

            protected void btnClear_Click(object sender, EventArgs e)
            {
                ClearForm();
            }
        }
    }

