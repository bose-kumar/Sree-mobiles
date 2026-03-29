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
   <asp:TextBox ID="txtSearch"
    runat="server"
    CssClass="form-control"
    placeholder="Search product..."
    AutoPostBack="true"
    OnTextChanged="txtSearch_TextChanged" />


    <!-- PRODUCT TABLE -->
    <div class="card shadow-sm">
        <div class="card-body">

            <div class="table-responsive">
             <asp:GridView ID="gvProducts" runat="server"
    CssClass="table table-bordered table-hover align-middle"
    AutoGenerateColumns="false"
    DataKeyNames="ProductId"
    OnRowCommand="gvProducts_RowCommand">

    <Columns>

        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
        <asp:BoundField DataField="Brand" HeaderText="Brand" />
        <asp:BoundField DataField="Category" HeaderText="Category" />
        <asp:BoundField DataField="Price" HeaderText="Price (₹)" />

       
        <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton
                    runat="server"
                    Text="Edit"
                    CssClass="btn btn-sm btn-primary"
                    CommandName="EditRow"
                    CommandArgument='<%# Eval("ProductId") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton
                    runat="server"
                    Text="Delete"
                    CssClass="btn btn-sm btn-danger"
                    CommandName="DeleteRow"
                    CommandArgument='<%# Eval("ProductId") %>' />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>


            </div>

        </div>
    </div>

</div>

</asp:Content>
