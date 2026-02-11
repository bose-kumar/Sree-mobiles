using Sreemobiles.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            ProductDAL dal = new ProductDAL();
            gvProducts.DataSource = dal.GetProductsForAdmin();
            gvProducts.DataBind();
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddProduct.aspx");
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int pid = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditRow")
            {
                Response.Redirect("AddProduct.aspx?id=" + pid);
            }

            if (e.CommandName == "DeleteRow")
            {
                try
                {
                    ProductDAL dal = new ProductDAL();
                    dal.DeleteProduct(pid);

                    ScriptManager.RegisterStartupScript(this, GetType(),
                        "deltoast",
                        @"
                        showAdminToast('Product deleted successfully','success');
                        setTimeout(function(){
                            window.location.href = 'Product.aspx';
                        },1500);
                        ",
                        true);
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(),
                        "terr",
                        "showAdminToast('Unable to delete product','error');",
                        true);
                }
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            ProductDAL dal = new ProductDAL();
            gvProducts.DataSource = dal.SearchProducts(txtSearch.Text.Trim());
            gvProducts.DataBind();
        }
    }
}