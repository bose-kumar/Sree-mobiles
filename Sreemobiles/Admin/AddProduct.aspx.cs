using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
     


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // 🔹 PRODUCT ID VALIDATION
                if (string.IsNullOrWhiteSpace(txtProductId.Text))
                {
                    ShowMessage("Product ID is required ❗");
                    return;
                }

                // 🔹 BASIC VALIDATION
                if (string.IsNullOrWhiteSpace(txtProductName.Text) ||
                    string.IsNullOrWhiteSpace(txtBrand.Text) ||
                    ddlCategory.SelectedIndex == 0)
                {
                    ShowMessage("Please fill all required fields ❗");
                    return;
                }

                if (!decimal.TryParse(txtPrice.Text, out decimal price))
                {
                    ShowMessage("Invalid price ❌");
                    return;
                }

                if (!int.TryParse(txtQuantity.Text, out int quantity) || quantity < 0)
                {
                    ShowMessage("Invalid quantity ❌");
                    return;
                }


                // 🔹 SAVE IMAGES
                string mainImg = SaveImage(fuMain);
                string img1 = SaveImage(fu1);
                string img2 = SaveImage(fu2);
                string img3 = SaveImage(fu3);
                string img4 = SaveImage(fu4);

                // 🔹 INSERT USING STORED PROCEDURE
                using (SqlConnection con = new SqlConnection(conStr))
                using (SqlCommand cmd = new SqlCommand("sp_AddProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@ProductId", SqlDbType.NVarChar).Value = txtProductId.Text.Trim();
                    cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar).Value = txtProductName.Text.Trim();
                    cmd.Parameters.Add("@BrandName", SqlDbType.NVarChar).Value = txtBrand.Text.Trim();
                    cmd.Parameters.Add("@Category", SqlDbType.NVarChar).Value = ddlCategory.SelectedValue;
                    cmd.Parameters.Add("@Price", SqlDbType.Decimal).Value = price;
                    cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = quantity;
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = txtDescription.Text.Trim();
                    cmd.Parameters.Add("@Specifications", SqlDbType.NVarChar).Value = txtSpecs.Text.Trim();
                    cmd.Parameters.Add("@MainImage", SqlDbType.NVarChar).Value = mainImg;
                    cmd.Parameters.Add("@Image1", SqlDbType.NVarChar).Value = img1;
                    cmd.Parameters.Add("@Image2", SqlDbType.NVarChar).Value = img2;
                    cmd.Parameters.Add("@Image3", SqlDbType.NVarChar).Value = img3;
                    cmd.Parameters.Add("@Image4", SqlDbType.NVarChar).Value = img4;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ShowMessage("✅ Product saved successfully");
                ClearForm();
            }
            catch (SqlException ex)
            {
                ShowMessage("Database error ❌ " + ex.Message);
            }
            catch (Exception ex)
            {
                ShowMessage("Error ❌ " + ex.Message);
            }
        }
        // 🔹 IMAGE UPLOAD
        private string SaveImage(System.Web.UI.WebControls.FileUpload fu)
        {
            if (!fu.HasFile) return "";

            string folder = Server.MapPath("~/Uploads/Products/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            // ✅ Check MIME type (accept ALL images)
            if (!fu.PostedFile.ContentType.StartsWith("image/"))
                throw new Exception("Only image files are allowed");

            string ext = Path.GetExtension(fu.FileName); // keep original extension
            string fileName = Guid.NewGuid().ToString() + ext;

            fu.SaveAs(Path.Combine(folder, fileName));

            return "Uploads/Products/" + fileName;
        }


        // 🔹 UI MESSAGE
        private void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(
                 this.GetType(),
                 "alert",
                 $"alert('{msg}');",
                 true);

        }

        // 🔹 CLEAR FORM
        private void ClearForm()
        {
            txtProductId.Text = "";
            txtProductName.Text = "";
            txtBrand.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtDescription.Text = "";
            txtSpecs.Text = "";
            ddlCategory.SelectedIndex = 0;
        }
    }
}
