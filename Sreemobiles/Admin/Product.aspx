<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Sri_Mobiles.Admin.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
 
<div class="container mt-4">

    <!-- TITLE LEFT | BUTTON RIGHT -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mb-0">
            <i class="fa fa-box"></i> Product List
        </h2>

        <!-- TOP RIGHT BUTTON -->
        <asp:Button ID="btnAddProduct"
            runat="server"
            Text="Add Product"
            CssClass="btn btn-warning" OnClick="btnAddProduct_Click" />
    </div>

    <!-- SEARCH BAR (UI ONLY) -->
    <div class="row mb-3">
        <div class="col-md-4">
            <input type="text"
                   class="form-control"
                   placeholder="Search product..." />
        </div>
    </div>

    <!-- PRODUCT TABLE -->
    <div class="card shadow-sm">
        <div class="card-body">

            <div class="table-responsive">
                <asp:GridView runat="server"
                    CssClass="table table-bordered table-hover align-middle"
                    AutoGenerateColumns="false">

                    <Columns>
                        <asp:BoundField HeaderText="Product Name" />
                        <asp:BoundField HeaderText="Brand" />
                        <asp:BoundField HeaderText="Category" />
                        <asp:BoundField HeaderText="Price (₹)" />
                        <asp:BoundField HeaderText="Rating" />
                    </Columns>

                </asp:GridView>
            </div>

        </div>
    </div>

</div>

</asp:Content>
