<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Sri_Mobiles.Admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">


<style>
    body {
        background: #f4f6fb;
    }

    .page-title {
        font-size: 20px;
        font-weight: 700;
        color: #111827;
    }

    .form-card {
        border-radius: 16px;
        border: none;
        background: #ffffff;
        box-shadow: 0 12px 30px rgba(0,0,0,.08);
    }

    .card-header-custom {
        background: #f9fafb;
        border-bottom: 1px solid #e5e7eb;
        padding: 16px 22px;
        border-radius: 16px 16px 0 0;
        font-weight: 700;
        color: #1f2937;
    }

    .section-title {
        font-size: 14px;
        font-weight: 700;
        color: #374151;
        margin-bottom: 12px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .form-label {
        font-size: 13px;
        font-weight: 600;
        color: #4b5563;
    }

    .form-control,
    .form-select {
        border-radius: 10px;
        padding: 10px 12px;
    }

    .form-control:focus,
    .form-select:focus {
        border-color: #0ea5e9;
        box-shadow: 0 0 0 .15rem rgba(14,165,233,.2);
    }

    /* SAVE BUTTON */
    .btn-save {
        background: linear-gradient(135deg, #0ea5e9, #0284c7);
        border: none;
        color: #fff;
        font-weight: 700;
        padding: 12px 34px;
        border-radius: 12px;
        transition: all .25s ease;
    }

    .btn-save:hover {
        background: linear-gradient(135deg, #0284c7, #0369a1);
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(2,132,199,.35);
    }
</style>

<div class="container-fluid mt-4">

    <div class="page-title mb-3">🛒 Add / Edit Product</div>

    <div class="card form-card">

        <div class="card-header-custom">
            Product Management
        </div>

        <div class="card-body px-4 py-4">

            <!-- PRODUCT INFO -->
            <div class="section-title">
                <i class="fa fa-circle-info text-primary"></i> Product Information
            </div>

            <div class="row g-4 mb-4">

                <div class="col-md-6">
                    <label class="form-label">Product Name</label>
                    <asp:TextBox runat="server" CssClass="form-control"
                        Placeholder="e.g. Samsung Galaxy S23" />
                </div>

                <div class="col-md-6">
                    <label class="form-label">Brand Name</label>
                    <asp:TextBox runat="server" CssClass="form-control"
                        Placeholder="e.g. Samsung" />
                </div>

                <div class="col-md-4">
                    <label class="form-label">Category</label>
                    <asp:DropDownList runat="server" CssClass="form-select">
                        <asp:ListItem Text="Mobile" />
                        <asp:ListItem Text="Accessories" />
                        <asp:ListItem Text="TV" />
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Price (₹)</label>
                    <asp:TextBox runat="server" CssClass="form-control"
                        Placeholder="e.g. 24999" />
                </div>

            </div>

            <!-- DETAILS -->
            <div class="section-title">
                <i class="fa fa-list text-success"></i> Product Details
            </div>

            <div class="row g-4 mb-4">

                <div class="col-md-6">
                    <label class="form-label">Description</label>
                    <asp:TextBox runat="server" TextMode="MultiLine"
                        Rows="4" CssClass="form-control"
                        Placeholder="Short product description" />
                </div>

                <div class="col-md-6">
                    <label class="form-label">Specifications</label>
                    <asp:TextBox runat="server" TextMode="MultiLine"
                        Rows="4" CssClass="form-control"
                        Placeholder="Technical specifications" />
                </div>

            </div>

            <!-- IMAGES -->
            <div class="section-title">
                <i class="fa fa-image text-warning"></i> Product Images
            </div>

            <div class="row g-3 mb-4">

                <div class="col-12">
                    <label class="form-label">Main Image</label>
                    <asp:FileUpload runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-3">
                    <asp:FileUpload runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <asp:FileUpload runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <asp:FileUpload runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <asp:FileUpload runat="server" CssClass="form-control" />
                </div>

            </div>

            <!-- ACTION -->
            <div class="text-end mt-4">
                <asp:Button runat="server"
                    CssClass="btn btn-save"
                    Text="Save Product" />
            </div>

        </div>
    </div>
</div>

</asp:Content>
   
