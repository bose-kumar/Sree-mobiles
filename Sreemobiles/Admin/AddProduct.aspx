<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Sri_Mobiles.Admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">



<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
    body{background:#f4f6fb}
    h3{margin-bottom:12px}

    .form-card{
        border-radius:14px;
        border:none;
        background:#fff;
        box-shadow:0 8px 20px rgba(0,0,0,.06)
    }

    .card-body{padding:18px}

    .section-title{
        font-size:12px;
        font-weight:700;
        color:#374151;
        margin-bottom:8px;
        text-transform:uppercase;
        letter-spacing:.5px;
        display:flex;
        align-items:center;
        gap:6px
    }

    .form-label{
/*   font-size: 12px;
color: #6b7280;
font-weight: 600;
letter-spacing: .5px;*/
 font-size:14px;
 font-weight:600;
 color:#374151;
 margin-bottom:2px
}


    .form-control,.form-select{
        border-radius:8px;
        padding:8px 10px;
        font-size:13px
    }

    .stock-warning{
        margin-top:4px;
        padding:6px 10px;
        border-radius:8px;
        font-size:12px;
        font-weight:600;
        display:none;
        background:#fff7ed;
        border:1px solid #fed7aa;
        color:#9a3412
    }

    .stock-danger{
        background:#fef2f2;
        border-color:#fecaca;
        color:#7f1d1d
    }

    .btn-save{
        background:linear-gradient(135deg,#16a34a,#166534);
        border:none;
        color:#fff;
        font-weight:700;
        padding:10px 28px;
        border-radius:10px
    }
</style>

<div class="container-fluid mt-3">
    <h3 class="fw-bold">Add Product</h3>

    <!-- CARD START -->
    <div class="card form-card">
        <div class="card-body">

            <!-- PRODUCT INFO -->
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Product ID</label>
                    <asp:TextBox ID="txtProductID" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>

                <div class="col-md-4">
                    <label class="form-label">Product Name</label>
                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-4">
                    <label class="form-label">Brand</label>
                    <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-4">
                    <label class="form-label">Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                       <asp:ListItem Text="SELECT" />
                        <asp:ListItem Text="Mobile" />
                        <asp:ListItem Text="Accessories" />
                        <asp:ListItem Text="TV" />
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Price (₹)</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-4">
                    <label class="form-label">Quantity</label>
                    <asp:TextBox ID="txtQty" runat="server"
                        CssClass="form-control" onkeyup="checkStock()" />
                    <div id="stockMsg" class="stock-warning"></div>
                </div>
            </div>

            <!-- DETAILS -->
            <div class="section-title mt-3">
                <i class="fa fa-list text-success"></i> Details
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Description</label>
                    <asp:TextBox ID="txtDesc" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>

                <div class="col-md-6">
                    <label class="form-label">Specifications</label>
                    <asp:TextBox ID="txtSpec" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>
            </div>

            <!-- IMAGES -->
            <div class="section-title mt-3">
                <i class="fa fa-image text-warning"></i> Images
            </div>

            <div class="row g-2">
                <div class="col-12">
                    <asp:FileUpload ID="fuMain" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3"><asp:FileUpload runat="server" CssClass="form-control" /></div>
                <div class="col-md-3"><asp:FileUpload runat="server" CssClass="form-control" /></div>
                <div class="col-md-3"><asp:FileUpload runat="server" CssClass="form-control" /></div>
                <div class="col-md-3"><asp:FileUpload runat="server" CssClass="form-control" /></div>
            </div>

            <!-- ACTION -->
            <div class="text-end mt-3">
                <asp:Button ID="btnSave" runat="server"
                    Text="Save Product" CssClass="btn btn-warning" />
            </div>

        </div>
    </div>
    <!-- CARD END -->

</div>

<script>
    function checkStock() {
        let qty = document.getElementById('<%= txtQty.ClientID %>').value || 0;
        let msg = document.getElementById('stockMsg');
        qty = parseInt(qty);

        if (qty === 0) {
            msg.style.display = "block";
            msg.classList.add("stock-danger");
            msg.innerHTML = "Out of Stock";
        }
        else if (qty <= 5) {
            msg.style.display = "block";
            msg.classList.remove("stock-danger");
            msg.innerHTML = "Low stock (" + qty + ")";
        }
        else {
            msg.style.display = "none";
        }
    }
</script>

</asp:Content>
