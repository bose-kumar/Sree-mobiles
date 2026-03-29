using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sreemobiles.User
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    AddToRecentlyViewed(id);

                    LoadProduct(id);
                }
            }
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Product.aspx");
        }
        private void LoadProduct(int id)
        {
            string cs = ConfigurationManager
                        .ConnectionStrings["con"]
                        .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_Product_GetById", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // Main info
                    lblName.Text = dr["ProductName"].ToString();
                    lblBrand.Text = dr["Brand"].ToString();
                    lblPrice.Text = dr["Price"].ToString();
                    lblDesc.Text = dr["Description"].ToString();
                    lblSpec.Text = dr["Specification"].ToString();

                    // Highlights
                    lblHBrand.Text = dr["Brand"].ToString();
                    lblHCategory.Text = dr["Category"].ToString();
                    lblHQty.Text = dr["Quantity"].ToString();

                    // Detail table
                    lblDName.Text = dr["ProductName"].ToString();
                    lblDBrand.Text = dr["Brand"].ToString();
                    lblDCategory.Text = dr["Category"].ToString();
                    lblDPrice.Text = dr["Price"].ToString();
                    lblDQty.Text = dr["Quantity"].ToString();

                    string img1 = dr["Image1"].ToString();
                    string img2 = dr["Image2"].ToString();
                    string img3 = dr["Image3"].ToString();
                    string img4 = dr["Image4"].ToString();
                    string img5 = dr["Image5"].ToString();

                    if (!string.IsNullOrEmpty(img1))
                        imgMain.ImageUrl = "~/ProductImages/" + img1;

                    SetThumb(imgT1, img1);
                    SetThumb(imgT2, img2);
                    SetThumb(imgT3, img3);
                    SetThumb(imgT4, img4);
                    SetThumb(imgT5, img5);
                }
            }
        }

        private void SetThumb(ImageButton btn, string fileName)
        {
            if (!string.IsNullOrEmpty(fileName))
            {
                string url = "~/ProductImages/" + fileName;
                btn.ImageUrl = url;
                btn.CommandArgument = url;
                btn.Visible = true;
            }
            else
            {
                btn.Visible = false;
            }
        }

        protected void Thumb_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            imgMain.ImageUrl = btn.CommandArgument;
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            AddCurrentProductToCart();
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            AddCurrentProductToCart();
        }

        private void AddCurrentProductToCart()
        {
            if (Request.QueryString["id"] == null)
                return;

            int pid = Convert.ToInt32(Request.QueryString["id"]);

            List<int> cart;

            if (Session["cart"] == null)
                cart = new List<int>();
            else
                cart = (List<int>)Session["cart"];

            cart.Add(pid);

            Session["cart"] = cart;

            Response.Redirect("CartPage.aspx");
        }
      
        private void AddToRecentlyViewed(int pid)
        {
            List<int> recent;

            if (Session["recent"] == null)
                recent = new List<int>();
            else
                recent = (List<int>)Session["recent"];

            // already irundha remove pannum
            recent.Remove(pid);

            // top-la add pannum
            recent.Insert(0, pid);

            // max 10 items maintain pannrom
            if (recent.Count > 10)
                recent = recent.Take(10).ToList();

            Session["recent"] = recent;
        }

       
    }
}