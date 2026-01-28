<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="Sreemobiles.Admin.Purchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
  
   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<div class="container-fluid mt-4">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">🧾 Purchase Invoice</h5>
        </div>

        <div class="card-body">

            <!-- Supplier -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <label>Supplier Name</label>
                    <asp:TextBox ID="txtSupplier" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label>Invoice No</label>
                    <asp:TextBox ID="txtInvoice" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label>Purchase Date</label>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
            </div>

            <hr />

            <!-- Add Product -->
            <h6 class="fw-bold">Add Product</h6>
            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:TextBox ID="txtProduct" runat="server" CssClass="form-control" Placeholder="Product Name" />
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" Placeholder="Qty" TextMode="Number" />
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="txtRate" runat="server" CssClass="form-control" Placeholder="Rate" TextMode="Number" />
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="txtTax" runat="server" CssClass="form-control" Text="18" Placeholder="GST %" />
                </div>
                <div class="col-md-2 d-grid">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Item"
                        CssClass="btn btn-success"/>
                </div>
            </div>

            <!-- Grid -->
            <asp:GridView ID="gvProducts" runat="server"
                CssClass="table table-bordered table-striped table-sm"
                AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Product" HeaderText="Product" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                    <asp:BoundField DataField="GST" HeaderText="GST %" />
                    <asp:BoundField DataField="CGST" HeaderText="CGST" />
                    <asp:BoundField DataField="SGST" HeaderText="SGST" />
                    <asp:BoundField DataField="Total" HeaderText="Total" />
                </Columns>
            </asp:GridView>

            <!-- Totals -->
            <div class="row mt-4">
                <div class="col-md-3">
                    <label>Subtotal</label>
                    <asp:TextBox ID="txtSubTotal" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-3">
                    <label>CGST</label>
                    <asp:TextBox ID="txtCGST" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-3">
                    <label>SGST</label>
                    <asp:TextBox ID="txtSGST" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-3">
                    <label>Grand Total</label>
                    <asp:TextBox ID="txtGrandTotal" runat="server"
                        CssClass="form-control fw-bold" ReadOnly="true" />
                </div>
            </div>

            <!-- Remarks -->
            <div class="mt-3">
                <label>Remarks</label>
                <asp:TextBox ID="txtRemarks" runat="server"
                    CssClass="form-control" TextMode="MultiLine" Rows="2" />
            </div>

            <!-- Buttons -->
            <div class="text-center mt-4">
                <asp:Button ID="btnSave" runat="server"
                    Text="Save Purchase" CssClass="btn btn-primary"/>
                   
                <asp:Button ID="btnClear" runat="server"
                    Text="Clear" CssClass="btn btn-danger ms-2"/>
                     
            </div>

        </div>
    </div>
</div>

</asp:Content>
