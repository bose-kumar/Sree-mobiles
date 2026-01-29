<%@ Page Title="Purchase Invoice" Language="C#" MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="Purchase.aspx.cs"
    Inherits="Sreemobiles.Admin.Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

<style>
  
    .invoice-card {
        background: #fff;
        padding: 22px;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.08);
    }

    /* HEADER */
    .header {
        font-size: 24px;
        font-weight: 700;
        color: #2c2c2c;
/*        border-bottom: 3px solid #ff7043;*/
        padding-bottom: 8px;
        margin-bottom: 18px;
    }

    /* INPUT */
    .form-control {
        width: 100%;
        padding: 6px 8px;
        border-radius: 4px;
        border: 1px solid #cfcfcf;
        font-size: 13px;
    }

    /* TABLE */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 12px;
        background: #fff;
    }

    table th {
        background: #f8f9fa;
        font-weight: 600;
        font-size: 12px;
        padding: 8px;
        border: 1px solid #ddd;
        white-space: nowrap;
    }

    table td {
        border: 1px solid #ddd;
        padding: 6px;
        text-align: center;
        font-size: 12px;
    }

    /* SECTION TITLE */
    .section-title {
        margin-top: 18px;
        font-weight: 600;
        font-size: 14px;
        color: #444;
    }

    /* SUMMARY */
    .summary-table td {
        padding: 8px;
        font-size: 13px;
    }

    .bill-amount {
        font-size: 20px;
        font-weight: 700;
        text-align: right;
    }

    /* BUTTONS */
    .btn-save {
        background: #ff7043;
        color: #fff;
        padding: 9px 28px;
        border: none;
        border-radius: 5px;
        font-weight: 600;
    }

    .btn-new {
        background: #f1f1f1;
        color: #333;
        padding: 9px 28px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-weight: 600;
        margin-left: 10px;
    }
</style>

<div class="container-fluid invoice-card">

    <!-- HEADER -->
    <div class="header">
        <i class="fa fa-file-invoice"></i>Purchase Invoice
    </div>

    <!-- TOP DETAILS -->
    <table>
        <tr>
            <td>Invoice No</td>
            <td><asp:TextBox ID="txtInvoiceNo" runat="server" CssClass="form-control" /></td>

            <td>Date</td>
            <td><asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" /></td>
        </tr>
        <tr>
            <td>Vendor Name</td>
            <td><asp:TextBox ID="txtVendor" runat="server" CssClass="form-control" /></td>

            <td>Payment Mode</td>
            <td>
                <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                    <asp:ListItem>SELECT</asp:ListItem>
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Card</asp:ListItem>
                    <asp:ListItem>UPI</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
<!-- PRODUCT GRID -->
<div class="section-title">Product Details</div>

    <asp:GridView ID="gvProducts" runat="server" EnableViewState="true"
    AutoGenerateColumns="false"
    GridLines="None"
    CssClass="table">

    <Columns>
        <asp:TemplateField HeaderText="Brand">
            <ItemTemplate>
                <asp:TextBox ID="txtBrand" runat="server"
                    Text='<%# Bind("Brand") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Model">
            <ItemTemplate>
                <asp:TextBox ID="txtModel" runat="server"
                    Text='<%# Bind("Model") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Product">
            <ItemTemplate>
                <asp:TextBox ID="txtProduct" runat="server"
                    Text='<%# Bind("Product") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <asp:TextBox ID="txtDesc" runat="server"
                    Text='<%# Bind("Description") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Qty">
            <ItemTemplate>
                <asp:TextBox ID="txtQty" runat="server"
                    Text='<%# Bind("Qty") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Purchase">
            <ItemTemplate>
                <asp:TextBox ID="txtPurchase" runat="server"
                    Text='<%# Bind("Purchase") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tax %">
            <ItemTemplate>
                <asp:TextBox ID="txtTax" runat="server"
                    Text='<%# Bind("Tax") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="MRP">
            <ItemTemplate>
                <asp:TextBox ID="txtMRP" runat="server"
                    Text='<%# Bind("MRP") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Retail">
            <ItemTemplate>
                <asp:TextBox ID="txtRetail" runat="server"
                    Text='<%# Bind("Retail") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Margin %">
            <ItemTemplate>
                <asp:TextBox ID="txtMargin" runat="server"
                    Text='<%# Bind("Margin") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tax Amt">
            <ItemTemplate>
                <asp:TextBox ID="txtTaxAmt" runat="server"
                    Text='<%# Bind("TaxAmt") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Total">
            <ItemTemplate>
                <asp:TextBox ID="txtTotal" runat="server"
                    Text='<%# Bind("Total") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="HSN">
            <ItemTemplate>
                <asp:TextBox ID="txtHSN" runat="server"
                    Text='<%# Bind("HSN") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="CGST">
            <ItemTemplate>
                <asp:TextBox ID="txtCGST" runat="server"
                    Text='<%# Bind("CGST") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="SGST">
            <ItemTemplate>
                <asp:TextBox ID="txtSGST" runat="server"
                    Text='<%# Bind("SGST") %>'
                    CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


<div style="margin-top:10px">
    <asp:Button ID="btnAddProduct" runat="server"
        Text="+ Add Product"
        CssClass="btn-new" OnClick="btnAddProduct_Click"/>
</div>

    <!-- SUMMARY -->
    <div class="section-title">Invoice Summary</div>
    <table class="summary-table">
        <tr>
            <td>Net Quantity</td>
            <td><asp:TextBox runat="server" CssClass="form-control" /></td>
            <td>Total CGST</td>
            <td><asp:TextBox runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td>Net Margin</td>
            <td><asp:TextBox runat="server" CssClass="form-control" /></td>
            <td>Total SGST</td>
            <td><asp:TextBox runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td>Discount %</td>
            <td><asp:TextBox runat="server" CssClass="form-control" /></td>
            <td>Discount Amount</td>
            <td><asp:TextBox runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td><b>Bill Amount</b></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control bill-amount" />
            </td>
        </tr>
    </table>

    <!-- BUTTONS -->
    <div style="margin-top:22px; text-align:right">
        <asp:Button Text="SAVE" runat="server" CssClass="btn btn-warning" />
        <asp:Button Text="NEW INVOICE" runat="server" CssClass="btn btn-warning" />
    </div>

</div>
</asp:Content>
