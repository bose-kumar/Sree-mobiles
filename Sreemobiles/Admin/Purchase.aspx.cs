using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sreemobiles.Admin
{
    public partial class Purchase : System.Web.UI.Page
    {
        DataTable dtProducts;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateProductTable();
            }
           
            
        }
        private void CreateProductTable()
        {
            dtProducts = new DataTable();

            dtProducts.Columns.Add("Brand");
            dtProducts.Columns.Add("Model");
            dtProducts.Columns.Add("Product");
            dtProducts.Columns.Add("Description");
            dtProducts.Columns.Add("Qty");
            dtProducts.Columns.Add("Purchase");
            dtProducts.Columns.Add("Tax");
            dtProducts.Columns.Add("MRP");
            dtProducts.Columns.Add("Retail");
            dtProducts.Columns.Add("Margin");
            dtProducts.Columns.Add("TaxAmt");
            dtProducts.Columns.Add("Total");
            dtProducts.Columns.Add("HSN");
            dtProducts.Columns.Add("CGST");
            dtProducts.Columns.Add("SGST");

            // first empty row
            dtProducts.Rows.Add(dtProducts.NewRow());

           ViewState["Products"] = dtProducts;
            BindGrid();
        }
        private void UpdateDataTableFromGrid()
        {
            DataTable dt = ViewState["Products"] as DataTable;

            for (int i = 0; i < gvProducts.Rows.Count; i++)
            {
                GridViewRow row = gvProducts.Rows[i];

                dt.Rows[i]["Brand"] = ((TextBox)row.FindControl("txtBrand")).Text;
                dt.Rows[i]["Model"] = ((TextBox)row.FindControl("txtModel")).Text;
                dt.Rows[i]["Product"] = ((TextBox)row.FindControl("txtProduct")).Text;
                dt.Rows[i]["Description"] = ((TextBox)row.FindControl("txtDesc")).Text;
                dt.Rows[i]["Qty"] = ((TextBox)row.FindControl("txtQty")).Text;
                dt.Rows[i]["Purchase"] = ((TextBox)row.FindControl("txtPurchase")).Text;
                dt.Rows[i]["Tax"] = ((TextBox)row.FindControl("txtTax")).Text;
                dt.Rows[i]["MRP"] = ((TextBox)row.FindControl("txtMRP")).Text;
                dt.Rows[i]["Retail"] = ((TextBox)row.FindControl("txtRetail")).Text;
                dt.Rows[i]["Margin"] = ((TextBox)row.FindControl("txtMargin")).Text;
                dt.Rows[i]["TaxAmt"] = ((TextBox)row.FindControl("txtTaxAmt")).Text;
                dt.Rows[i]["Total"] = ((TextBox)row.FindControl("txtTotal")).Text;
                dt.Rows[i]["HSN"] = ((TextBox)row.FindControl("txtHSN")).Text;
                dt.Rows[i]["CGST"] = ((TextBox)row.FindControl("txtCGST")).Text;
                dt.Rows[i]["SGST"] = ((TextBox)row.FindControl("txtSGST")).Text;
            }

            ViewState["Products"] = dt;
        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            UpdateDataTableFromGrid();
            DataTable dt = ViewState["Products"] as DataTable;


            dt.Rows.Add(dt.NewRow());

            ViewState["Products"] = dt;
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
    }
}