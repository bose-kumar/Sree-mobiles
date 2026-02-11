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
    <td><label class="form-label">Vendor Id</label></td>
    <td>
        <asp:DropDownList 
            ID="ddlVendorId" 
            runat="server" 
            CssClass="form-control"
            AutoPostBack="true"
            OnSelectedIndexChanged="ddlVendorId_SelectedIndexChanged">
        </asp:DropDownList>
    </td>

    <td>Vendor Name</td>
    <td>
        <asp:TextBox ID="txtVendor" runat="server" CssClass="form-control" ReadOnly="true" />
    </td>

    <td><label class="form-label">Mobile No</label></td>
    <td>
        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" ReadOnly="true" />
    </td>
</tr>

        <tr>
       

            <td>Payment Mode</td>
            <td>
                <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                    <asp:ListItem>SELECT</asp:ListItem>
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Card</asp:ListItem>
                    <asp:ListItem>UPI</asp:ListItem>
                </asp:DropDownList>
            </td>
               <td>Invoice No</td>
   <td><asp:TextBox ID="txtInvoiceNo" runat="server" CssClass="form-control" /></td>

<td>Date</td>
<td><asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" /></td>
        </tr>
    </table>
<!-- PRODUCT GRID -->
<div class="section-title">Product Details</div>

   <asp:GridView ID="gvProducts" runat="server"
    AutoGenerateColumns="false"
    CssClass="table"
    OnRowDataBound="gvProducts_RowDataBound" >

    <Columns>
    <asp:TemplateField HeaderText="ProductId">
    <ItemTemplate>
        <asp:TextBox 
            ID="txtProductId"
            runat="server"
            CssClass="form-control"
            AutoPostBack="true"
            OnTextChanged="txtProductId_TextChanged"
            Text='<%# Bind("ProductId") %>' />
    </ItemTemplate>
</asp:TemplateField>




        <asp:TemplateField HeaderText="Model">
            <ItemTemplate>
                <asp:TextBox ID="txtModel" runat="server"
                    Text='<%# Bind("Model") %>' CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Product">
            <ItemTemplate>
                <asp:TextBox ID="txtProduct" runat="server"
                    Text='<%# Bind("Product") %>' CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Qty">
            <ItemTemplate>
                <asp:TextBox ID="txtQty" runat="server"
                    Text='<%# Bind("Qty") %>' CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Purchase">
            <ItemTemplate>
                <asp:TextBox ID="txtPurchase" runat="server"
                    Text='<%# Bind("Purchase") %>' CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tax %">
            <ItemTemplate>
                <asp:TextBox ID="txtTax" runat="server"
                    Text='<%# Bind("Tax") %>' CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Margin %">
            <ItemTemplate>
                <asp:TextBox ID="txtMargin" runat="server"
                     AutoPostBack="true"
                     OnTextChanged ="GridCell_TextChanged"
                    Text='<%# Bind("Margin") %>' CssClass="form-control" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tax Amt">
            <ItemTemplate>
                <asp:TextBox ID="txtTaxAmt" runat="server"
                     Text='<%# Bind("TaxAmt") %>'
                    CssClass="form-control" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="CGST">
            <ItemTemplate>
                <asp:TextBox ID="txtCGST" runat="server"
                    CssClass="form-control" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="SGST">
            <ItemTemplate>
                <asp:TextBox ID="txtSGST" runat="server"
                    CssClass="form-control" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="MRP">
            <ItemTemplate>
                <asp:TextBox ID="txtMRP" runat="server"
                    CssClass="form-control" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Total">
            <ItemTemplate>
                <asp:TextBox ID="txtTotal" runat="server"
                    CssClass="form-control" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>



<div style="margin-top:10px">
    <asp:Button ID="btnAddItem" runat="server"
        Text="+ Add Item"
        CssClass="btn-new" OnClick="btnAddItem_Click"/>
</div>


   

    <!-- SUMMARY -->
    <div class="section-title">Invoice Summary</div>
    <table class="summary-table">
    <tr>
        <td>Net Quantity</td>
        <td><asp:TextBox ID="txtNetQty" runat="server" ReadOnly="true" CssClass="form-control" /></td>
        <td>Total CGST</td>
        <td><asp:TextBox ID="txtTotalCGST" runat="server" ReadOnly="true" CssClass="form-control" /></td>
    </tr>
    <tr>
        <td>Net Margin</td>
        <td><asp:TextBox ID="txtNetMargin" runat="server" ReadOnly="true" CssClass="form-control" /></td>
        <td>Total SGST</td>
        <td><asp:TextBox ID="txtTotalSGST" runat="server" ReadOnly="true" CssClass="form-control" /></td>
    </tr>
    <tr>
        <td>Discount %</td>
        <td>
            <asp:TextBox ID="txtDiscountPer" runat="server"
                CssClass="form-control"
                AutoPostBack="true"
                OnTextChanged="txtDiscountPer_TextChanged" />
        </td>
        <td>Discount Amount</td>
        <td><asp:TextBox ID="txtDiscountAmt" runat="server" ReadOnly="true" CssClass="form-control" /></td>
    </tr>
    <tr>
        <td colspan="2"></td>
        <td><b>Bill Amount</b></td>
        <td><asp:TextBox ID="txtBillAmount" runat="server" ReadOnly="true"
                CssClass="form-control bill-amount" /></td>
    </tr>
</table>

</table>


    <!-- BUTTONS -->
    <div style="margin-top:22px; text-align:right">
        <asp:Button Text="SAVE" runat="server" CssClass="btn btn-warning" OnClick="Save_Click"/>
        <asp:Button 
                 ID="btnNewInvoice"
                    Text="NEW INVOICE" 
                    runat="server" 
                    CssClass="btn btn-warning"
                    OnClick="btnNewInvoice_Click" />

    </div>

</div>
</asp:Content>
