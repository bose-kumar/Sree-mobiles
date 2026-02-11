using Sreemobiles.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sri_Mobiles.User
{
    
    
        public partial class Home : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    BindRecentlyViewed();
                }
            }
        protected void rptRecent_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                int pid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetails.aspx?id=" + pid);
            }
        }

        private void BindRecentlyViewed()
            {
                ProductDAL dal = new ProductDAL();

                // -------------------------------
                // Case 1 : Recently viewed exists
                // -------------------------------
                if (Session["recent"] != null)
                {
                    List<int> recent = (List<int>)Session["recent"];

                    if (recent.Count > 0)
                    {
                        DataTable finalTable = null;
                        int count = 0;

                        foreach (int pid in recent)
                        {
                            if (count == 4)
                                break;

                            DataTable dt = dal.GetProductById(pid);

                            if (dt != null && dt.Rows.Count > 0)
                            {
                                if (finalTable == null)
                                    finalTable = dt.Clone();

                                finalTable.ImportRow(dt.Rows[0]);
                                count++;
                            }
                        }

                        if (finalTable != null && finalTable.Rows.Count > 0)
                        {
                            rptRecent.DataSource = finalTable;
                            rptRecent.DataBind();
                            return;
                        }
                    }
                }

                // --------------------------------------
                // Case 2 : No recent → show 4 normal
                // --------------------------------------
                DataTable all = dal.GetProductsForUser();

                if (all != null && all.Rows.Count > 0)
                {
                    DataTable first4 = all.Clone();

                    for (int i = 0; i < all.Rows.Count && i < 4; i++)
                    {
                        first4.ImportRow(all.Rows[i]);
                    }

                    rptRecent.DataSource = first4;
                    rptRecent.DataBind();
                }
            }
        }
    
}
