using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Sreemobiles.Admin
{


    public class ProductDAL
    {
        string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        

            // ---------------- INSERT ----------------

            public void InsertProduct(
                string name, string brand, string category,
                decimal price, int qty,
                string desc, string spec,
                string img1, string img2, string img3, string img4, string img5)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_Insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ProductName", name);
                    cmd.Parameters.AddWithValue("@Brand", brand);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Quantity", qty);
                    cmd.Parameters.AddWithValue("@Description", desc);
                    cmd.Parameters.AddWithValue("@Specification", spec);

                    cmd.Parameters.AddWithValue("@Image1", string.IsNullOrEmpty(img1) ? (object)DBNull.Value : img1);
                    cmd.Parameters.AddWithValue("@Image2", string.IsNullOrEmpty(img2) ? (object)DBNull.Value : img2);
                    cmd.Parameters.AddWithValue("@Image3", string.IsNullOrEmpty(img3) ? (object)DBNull.Value : img3);
                    cmd.Parameters.AddWithValue("@Image4", string.IsNullOrEmpty(img4) ? (object)DBNull.Value : img4);
                    cmd.Parameters.AddWithValue("@Image5", string.IsNullOrEmpty(img5) ? (object)DBNull.Value : img5);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // ---------------- UPDATE ----------------

            public void UpdateProduct(
                int productId,
                string name,
                string brand,
                string category,
                decimal price,
                int qty,
                string desc,
                string spec,
                string img1, string img2, string img3, string img4, string img5)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_Update", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.Parameters.AddWithValue("@ProductName", name);
                    cmd.Parameters.AddWithValue("@Brand", brand);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Quantity", qty);
                    cmd.Parameters.AddWithValue("@Description", desc);
                    cmd.Parameters.AddWithValue("@Specification", spec);

                    cmd.Parameters.AddWithValue("@Image1", string.IsNullOrEmpty(img1) ? (object)DBNull.Value : img1);
                    cmd.Parameters.AddWithValue("@Image2", string.IsNullOrEmpty(img2) ? (object)DBNull.Value : img2);
                    cmd.Parameters.AddWithValue("@Image3", string.IsNullOrEmpty(img3) ? (object)DBNull.Value : img3);
                    cmd.Parameters.AddWithValue("@Image4", string.IsNullOrEmpty(img4) ? (object)DBNull.Value : img4);
                    cmd.Parameters.AddWithValue("@Image5", string.IsNullOrEmpty(img5) ? (object)DBNull.Value : img5);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // ---------------- ADMIN LIST ----------------

            public DataTable GetProductsForAdmin()
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_AdminList", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }

                return dt;
            }

            // ---------------- USER LIST ----------------

            public DataTable GetProductsForUser()
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_UserList", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }

                return dt;
            }

            // ---------------- BY ID ----------------

            public DataTable GetProductById(int productId)
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_GetById", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }

                return dt;
            }

            // ---------------- DELETE (SOFT DELETE) ----------------

            public void DeleteProduct(int productId)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_Delete", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // ---------------- SEARCH ----------------

            public DataTable SearchProducts(string keyword)
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_Product_Search", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Keyword", keyword);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }

                return dt;
            }
        }
    }
