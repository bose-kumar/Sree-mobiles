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

 
        
        private void BindGrid()
        {
            gvProducts.DataSource = ViewState["Products"];
            gvProducts.DataBind();
        }

        protected void btnAddProduct_Click1(object sender, EventArgs e)
        {
            // 1️⃣ Get DataTable from ViewState
            dtProducts = ViewState["Products"] as DataTable;

            if (dtProducts == null) return;

            // 2️⃣ SAVE existing GridView values into DataTable
            for (int i = 0; i < gvProducts.Rows.Count; i++)
            {
                GridViewRow row = gvProducts.Rows[i];

                dtProducts.Rows[i]["Brand"] = ((TextBox)row.FindControl("txtBrand")).Text;
                dtProducts.Rows[i]["Model"] = ((TextBox)row.FindControl("txtModel")).Text;
                dtProducts.Rows[i]["Product"] = ((TextBox)row.FindControl("txtProduct")).Text;
                dtProducts.Rows[i]["Description"] = ((TextBox)row.FindControl("txtDesc")).Text;
                dtProducts.Rows[i]["Qty"] = ((TextBox)row.FindControl("txtQty")).Text;
                dtProducts.Rows[i]["Purchase"] = ((TextBox)row.FindControl("txtPurchase")).Text;
                dtProducts.Rows[i]["Tax"] = ((TextBox)row.FindControl("txtTax")).Text;
                dtProducts.Rows[i]["MRP"] = ((TextBox)row.FindControl("txtMRP")).Text;
                dtProducts.Rows[i]["Retail"] = ((TextBox)row.FindControl("txtRetail")).Text;
                dtProducts.Rows[i]["Margin"] = ((TextBox)row.FindControl("txtMargin")).Text;
                dtProducts.Rows[i]["TaxAmt"] = ((TextBox)row.FindControl("txtTaxAmt")).Text;
                dtProducts.Rows[i]["Total"] = ((TextBox)row.FindControl("txtTotal")).Text;
                dtProducts.Rows[i]["HSN"] = ((TextBox)row.FindControl("txtHSN")).Text;
                dtProducts.Rows[i]["CGST"] = ((TextBox)row.FindControl("txtCGST")).Text;
                dtProducts.Rows[i]["SGST"] = ((TextBox)row.FindControl("txtSGST")).Text;
            }

            // 3️⃣ ADD new empty row
            dtProducts.Rows.Add(dtProducts.NewRow());

            // 4️⃣ Save back to ViewState & Rebind
            ViewState["Products"] = dtProducts;
            gvProducts.DataSource = dtProducts;
            gvProducts.DataBind();
        }
    }
    }
}