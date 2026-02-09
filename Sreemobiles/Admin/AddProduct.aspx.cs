using Sreemobiles.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int pid = Convert.ToInt32(Request.QueryString["id"]);
                    LoadProduct(pid);
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string img1 = hfImg1.Value;
            string img2 = hfImg2.Value;
            string img3 = hfImg3.Value;
            string img4 = hfImg4.Value;
            string img5 = hfImg5.Value;

            SaveImage(fuImg1, ref img1);
            SaveImage(fuImg2, ref img2);
            SaveImage(fuImg3, ref img3);
            SaveImage(fuImg4, ref img4);
            SaveImage(fuImg5, ref img5);

            ProductDAL dal = new ProductDAL();

            if (txtProductID.Text == "")
            {
                // INSERT
                dal.InsertProduct(
                    txtProductName.Text,
                    txtBrand.Text,
                    ddlCategory.SelectedValue,
                    Convert.ToDecimal(txtPrice.Text),
                    Convert.ToInt32(txtQty.Text),
                    txtDesc.Text,
                    txtSpec.Text,
                    img1, img2, img3, img4, img5
                );
                
            }
            else
            {
                // UPDATE
                dal.UpdateProduct(
                    Convert.ToInt32(txtProductID.Text),
                    txtProductName.Text,
                    txtBrand.Text,
                    ddlCategory.SelectedValue,
                    Convert.ToDecimal(txtPrice.Text),
                    Convert.ToInt32(txtQty.Text),
                    txtDesc.Text,
                    txtSpec.Text,
                    img1, img2, img3, img4, img5
                );
                
            }

            ClearForm();

        }

        private void ClearForm()
        {
            txtProductID.Text = "";
            txtProductName.Text = "";
            txtBrand.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtPrice.Text = "";
            txtQty.Text = "";
            txtDesc.Text = "";
            txtSpec.Text = "";

            hfImg1.Value = "";
            hfImg2.Value = "";
            hfImg3.Value = "";
            hfImg4.Value = "";
            hfImg5.Value = "";

            img1.ImageUrl = "";
            img2.ImageUrl = "";
            img3.ImageUrl = "";
            img4.ImageUrl = "";
            img5.ImageUrl = "";
        }
        private void SaveImage(FileUpload fu, ref string fileName)
        {
            if (fu.HasFile)
            {
                fileName = Guid.NewGuid().ToString() + "_" + fu.FileName;
                fu.SaveAs(Server.MapPath("~/ProductImages/" + fileName));
            }
        }



        private void LoadProduct(int pid)
        {
            ProductDAL dal = new ProductDAL();
            DataTable dt = dal.GetProductById(pid);

            if (dt.Rows.Count > 0)
            {
                txtProductID.Text = dt.Rows[0]["ProductId"].ToString();
                txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
                txtBrand.Text = dt.Rows[0]["Brand"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["Category"].ToString();
                txtPrice.Text = dt.Rows[0]["Price"].ToString();
                txtQty.Text = dt.Rows[0]["Quantity"].ToString();
                txtDesc.Text = dt.Rows[0]["Description"].ToString();
                txtSpec.Text = dt.Rows[0]["Specification"].ToString();



                hfImg1.Value = dt.Rows[0]["Image1"].ToString();
                hfImg2.Value = dt.Rows[0]["Image2"].ToString();
                hfImg3.Value = dt.Rows[0]["Image3"].ToString();
                hfImg4.Value = dt.Rows[0]["Image4"].ToString();
                hfImg5.Value = dt.Rows[0]["Image5"].ToString();

                if (hfImg1.Value != "")
                    img1.ImageUrl = "~/ProductImages/" + hfImg1.Value;

                if (hfImg2.Value != "")
                    img2.ImageUrl = "~/ProductImages/" + hfImg2.Value;

                if (hfImg3.Value != "")
                    img3.ImageUrl = "~/ProductImages/" + hfImg3.Value;

                if (hfImg4.Value != "")
                    img4.ImageUrl = "~/ProductImages/" + hfImg4.Value;

                if (hfImg5.Value != "")
                    img5.ImageUrl = "~/ProductImages/" + hfImg5.Value;

            }
        }


    }
}
