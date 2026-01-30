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

            void LoadVendors()
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da =
                    new SqlDataAdapter("SELECT VendorCode,VendorName FROM dbo.VendorMaster", con))
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

            void LoadVendorDetails(int id)
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd =
                    new SqlCommand("SELECT MobileNo,VendorAddress FROM dbo.VendorMaster WHERE VendorCode=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lblMobile.Text = dr["MobileNo"].ToString();
                        lblAddress.Text = dr["VendorAddress"].ToString();
                    }
                }
            }

            void LoadInvoices(int id)
            {
                ddlInvoice.Items.Clear();

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da =
                    new SqlDataAdapter("SELECT InvoiceNo,TotalAmount FROM dbo.VendorInvoice WHERE VendorCode=@id", con))
                {
                    da.SelectCommand.Parameters.AddWithValue("@id", id);

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlInvoice.DataSource = dt;
                    ddlInvoice.DataTextField = "InvoiceNo";
                    ddlInvoice.DataValueField = "InvoiceNo";
                    ddlInvoice.DataBind();
                    ddlInvoice.Items.Insert(0, "SELECT");
                }
            }

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

            protected void ddlInvoice_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (ddlInvoice.SelectedIndex == 0) return;

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd =
                    new SqlCommand(@"SELECT TotalAmount FROM dbo.VendorInvoice
                                 WHERE VendorCode=@v AND InvoiceNo=@i", con))
                {
                    cmd.Parameters.AddWithValue("@v", ddlVendorCode.SelectedValue);
                    cmd.Parameters.AddWithValue("@i", ddlInvoice.SelectedValue);

                    con.Open();
                    object o = cmd.ExecuteScalar();

                    if (o != null)
                    {
                        txtTotalAmount.Text = o.ToString();
                        txtBalanceAmount.Text = o.ToString();
                    }
                }
            }

            void LoadPayments()
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da =
                    new SqlDataAdapter(
                    @"SELECT P.PaymentId,V.VendorName,P.InvoiceNo,
                         P.PaymentDate,P.TotalAmount,
                         P.PaidAmount,P.BalanceAmount
                  FROM dbo.VendorPayment P
                  JOIN dbo.VendorMaster V
                  ON P.VendorCode=V.VendorCode", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvPayments.DataSource = dt;
                    gvPayments.DataBind();
                }
            }

            protected void btnSave_Click(object sender, EventArgs e)
            {
                if (ddlVendorCode.SelectedIndex == 0 ||
                    ddlInvoice.SelectedIndex == 0 ||
                    string.IsNullOrEmpty(txtPaymentDate.Text))
                    return;

                decimal total = Convert.ToDecimal(txtTotalAmount.Text);
                decimal paid = Convert.ToDecimal(txtPaidlAmount.Text);
                decimal bal = total - paid;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd;

                    if (ViewState["EditId"] == null)
                    {
                        cmd = new SqlCommand(
                        @"INSERT INTO dbo.VendorPayment
                    (VendorCode,InvoiceNo,PaymentDate,PaymentMode,
                     TotalAmount,PaidAmount,BalanceAmount,Remarks)
                    VALUES(@v,@i,@d,@m,@t,@p,@b,@r)", con);
                    }
                    else
                    {
                        cmd = new SqlCommand(
                        @"UPDATE dbo.VendorPayment SET
                        VendorCode=@v,InvoiceNo=@i,PaymentDate=@d,
                        PaymentMode=@m,TotalAmount=@t,
                        PaidAmount=@p,BalanceAmount=@b,Remarks=@r
                      WHERE PaymentId=@id", con);

                        cmd.Parameters.AddWithValue("@id", ViewState["EditId"]);
                    }

                    cmd.Parameters.AddWithValue("@v", ddlVendorCode.SelectedValue);
                    cmd.Parameters.AddWithValue("@i", ddlInvoice.SelectedValue);
                    cmd.Parameters.AddWithValue("@d", txtPaymentDate.Text);
                    cmd.Parameters.AddWithValue("@m", ddlPaymentMode.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@t", total);
                    cmd.Parameters.AddWithValue("@p", paid);
                    cmd.Parameters.AddWithValue("@b", bal);
                    cmd.Parameters.AddWithValue("@r",
                        string.IsNullOrWhiteSpace(txtRemarks.Text) ? (object)DBNull.Value : txtRemarks.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearForm();
                LoadPayments();
            }

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
                using (SqlCommand cmd =
                    new SqlCommand("SELECT * FROM dbo.VendorPayment WHERE PaymentId=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
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
                        txtPaymentDate.Text = Convert.ToDateTime(dr["PaymentDate"]).ToString("yyyy-MM-dd");

                        ddlPaymentMode.SelectedIndex =
                            ddlPaymentMode.Items.IndexOf(
                            ddlPaymentMode.Items.FindByText(dr["PaymentMode"].ToString()));

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
                using (SqlCommand cmd =
                    new SqlCommand("DELETE FROM dbo.VendorPayment WHERE PaymentId=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            void ClearForm()
            {
                ddlVendorCode.SelectedIndex = 0;
                ddlVendorName.SelectedIndex = 0;

                ddlInvoice.Items.Clear();
                ddlInvoice.Items.Insert(0, "SELECT");

                txtPaymentDate.Text = "";
                txtTotalAmount.Text = "";
                txtPaidlAmount.Text = "";
                txtBalanceAmount.Text = "";
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
