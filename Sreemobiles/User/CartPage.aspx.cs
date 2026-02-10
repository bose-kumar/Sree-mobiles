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
                BindCart();
        }

        private void BindCart()
        {
            if (Session["cart"] == null)
                return;

            List<int> cart = (List<int>)Session["cart"];
            ProductDAL dal = new ProductDAL();

            var grouped = cart.GroupBy(x => x)
                              .Select(g => new { ProductId = g.Key, Qty = g.Count() });

            DataTable dtFinal = new DataTable();
            dtFinal.Columns.Add("ProductId", typeof(int));
            dtFinal.Columns.Add("ProductName");
            dtFinal.Columns.Add("Price", typeof(decimal));
            dtFinal.Columns.Add("Image1");
            dtFinal.Columns.Add("Qty", typeof(int));
            dtFinal.Columns.Add("RowTotal", typeof(decimal));

            decimal grandTotal = 0;

            foreach (var g in grouped)
            {
                DataTable dt = dal.GetProductById(g.ProductId);

                if (dt.Rows.Count > 0)
                {
                    decimal price = Convert.ToDecimal(dt.Rows[0]["Price"]);
                    decimal rowTotal = price * g.Qty;

                    dtFinal.Rows.Add(
                        g.ProductId,
                        dt.Rows[0]["ProductName"],
                        price,
                        dt.Rows[0]["Image1"],
                        g.Qty,
                        rowTotal
                    );

                    grandTotal += rowTotal;
                }
            }

            rptCart.DataSource = dtFinal;
            rptCart.DataBind();

            lblGrandTotal.Text = grandTotal.ToString("N0");
        }

        protected void rptCart_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            int pid = Convert.ToInt32(e.CommandArgument);
            List<int> cart = (List<int>)Session["cart"];

            if (e.CommandName == "plus")
                cart.Add(pid);

            else if (e.CommandName == "minus")
                cart.Remove(pid);

            else if (e.CommandName == "remove")
                cart.RemoveAll(x => x == pid);

            Session["cart"] = cart;
            BindCart();
        }
    }
}