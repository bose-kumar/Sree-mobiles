using Sreemobiles.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Sreemobiles.User
{
    public partial class CartPage : System.Web.UI.Page
    {
       
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                    LoadCart();
            }

            private void LoadCart()
            {
                lblTotal.Text = "0";
                lblTotalQty.Text = "0";

                if (Session["cart"] == null)
                {
                    gvCart.DataSource = null;
                    gvCart.DataBind();
                    return;
                }

                List<int> cart = (List<int>)Session["cart"];

                if (cart.Count == 0)
                {
                    gvCart.DataSource = null;
                    gvCart.DataBind();
                    return;
                }

                ProductDAL dal = new ProductDAL();

                // group product and count qty
                var grouped = cart.GroupBy(x => x)
                                  .Select(g => new { ProductId = g.Key, Qty = g.Count() })
                                  .ToList();

                DataTable finalTable = null;

                decimal total = 0;
                int totalQty = 0;

                foreach (var item in grouped)
                {
                    DataTable dt = dal.GetProductById(item.ProductId);

                    if (dt.Rows.Count > 0)
                    {
                        if (finalTable == null)
                        {
                            finalTable = dt.Clone();
                            finalTable.Columns.Add("Qty", typeof(int));
                        }

                        DataRow row = finalTable.NewRow();

                        foreach (DataColumn col in dt.Columns)
                            row[col.ColumnName] = dt.Rows[0][col.ColumnName];

                        row["Qty"] = item.Qty;

                        finalTable.Rows.Add(row);

                        total += Convert.ToDecimal(dt.Rows[0]["Price"]) * item.Qty;
                        totalQty += item.Qty;
                    }
                }

                gvCart.DataSource = finalTable;
                gvCart.DataBind();

                lblTotal.Text = total.ToString("N2");
                lblTotalQty.Text = totalQty.ToString();
            }

            protected void gvCart_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
            {
                if (e.CommandName == "remove")
                {
                    int pid = Convert.ToInt32(e.CommandArgument);

                    if (Session["cart"] != null)
                    {
                        List<int> cart = (List<int>)Session["cart"];

                        // remove all quantity of that product
                        cart.RemoveAll(x => x == pid);

                        Session["cart"] = cart;
                    }

                    LoadCart();
                }
            }
        }
    }