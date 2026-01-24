<%@ Page Title="Add Product" Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="AddProduct.aspx.cs"
    Inherits="Sri_Mobiles.Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

<div class="container-fluid mt-4">

    <h4>🛒 Add Product</h4>

    <div class="row g-3">

        <!-- PRODUCT ID -->
        <div class="col-md-4">
            <label>Product ID</label>
            <asp:TextBox ID="txtProductId" runat="server"
                CssClass="form-control"
                Placeholder="Enter Product Id" />
        </div>

        <div class="col-md-4">
            <label>Product Name</label>
            <asp:TextBox ID="txtProductName" runat="server"
                CssClass="form-control" 
                 Placeholder="Enter Product Name"/>
        </div>

        <div class="col-md-4">
            <label>Brand Name</label>
            <asp:TextBox ID="txtBrand" runat="server"
                CssClass="form-control" 
                 Placeholder="Enter Brand Name"/>
        </div>

        <div class="col-md-4">
            <label>Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server"
                CssClass="form-control"
                 Placeholder="Enter Category">
                <asp:ListItem Text="-- Select --" Value="" />
                <asp:ListItem Text="Mobile" />
                <asp:ListItem Text="Accessories" />
                <asp:ListItem Text="TV" />
            </asp:DropDownList>
        </div>

        <div class="col-md-4">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server"
                CssClass="form-control"
                 Placeholder="Enter Price"/>
        </div>

        <div class="col-md-4">
            <label>Quantity</label>
            <asp:TextBox ID="txtQuantity" runat="server"
                CssClass="form-control" 
                 Placeholder="Enter Quantity"/>
        </div>

        <div class="col-md-6">
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server"
                TextMode="MultiLine" Rows="3"
                CssClass="form-control" 
                 Placeholder="Enter Product Id"/>
        </div>

        <div class="col-md-6">
            <label>Specifications</label>
            <asp:TextBox ID="txtSpecs" runat="server"
                TextMode="MultiLine" Rows="3"
                CssClass="form-control"
                 Placeholder="Enter Specifications"/>
        </div>

        <div class="col-md-12">
            <label>Main Image</label>
            <asp:FileUpload ID="fuMain" runat="server"
                CssClass="form-control" />
        </div>

        <div class="col-md-3"><asp:FileUpload ID="fu1" runat="server" CssClass="form-control" /></div>
        <div class="col-md-3"><asp:FileUpload ID="fu2" runat="server" CssClass="form-control" /></div>
        <div class="col-md-3"><asp:FileUpload ID="fu3" runat="server" CssClass="form-control" /></div>
        <div class="col-md-3"><asp:FileUpload ID="fu4" runat="server" CssClass="form-control" /></div>

        <div class="col-md-12 text-end mt-3">
            <asp:Button ID="btnSave" runat="server"
                Text="Save Product"
                CssClass="btn btn-primary"
                OnClick="btnSave_Click" />
        </div>

    </div>
</div>

</asp:Content>
