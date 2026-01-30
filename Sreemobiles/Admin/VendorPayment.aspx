<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="VendorPayment.aspx.cs" Inherits="Sreemobiles.Admin.VendorPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">




<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<div class="container-fluid">

<h4 class="fw-bold mb-3">
<i class="fa fa-indian-rupee-sign text-success me-1"></i>
Vendor Payment
</h4>

<div class="card form-card">
<div class="card-body">

<div class="row g-3">

<div class="col-md-4">
<label class="form-label">Vendor ID</label>
<asp:DropDownList ID="ddlVendorCode" runat="server"
CssClass="form-select"
AutoPostBack="true"
OnSelectedIndexChanged="ddlVendorCode_SelectedIndexChanged" />
</div>

<div class="col-md-4">
<label class="form-label">Vendor Name</label>
<asp:DropDownList ID="ddlVendorName" runat="server"
CssClass="form-select"
AutoPostBack="true"
OnSelectedIndexChanged="ddlVendorName_SelectedIndexChanged" />
</div>

<div class="col-md-4">
<label class="form-label">Invoice No</label>
<asp:DropDownList ID="ddlInvoice" runat="server"
CssClass="form-select"
AutoPostBack="true"
OnSelectedIndexChanged="ddlInvoice_SelectedIndexChanged" />
</div>

<div class="col-md-4">
<label class="form-label">Mobile</label><br />
<asp:Label ID="lblMobile" runat="server" />
</div>

<div class="col-md-8">
<label class="form-label">Address</label><br />
<asp:Label ID="lblAddress" runat="server" />
</div>

<div class="col-md-4">
<label class="form-label">Payment Date</label>
<asp:TextBox ID="txtPaymentDate" runat="server"
TextMode="Date" CssClass="form-control" />
</div>

<div class="col-md-4">
<label class="form-label">Payment Mode</label>
<asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-select">
<asp:ListItem>SELECT</asp:ListItem>
<asp:ListItem>Cash</asp:ListItem>
<asp:ListItem>Bank Transfer</asp:ListItem>
<asp:ListItem>UPI</asp:ListItem>
<asp:ListItem>Cheque</asp:ListItem>
</asp:DropDownList>
</div>

<div class="col-md-4">
<label class="form-label">Total Amount</label>
<asp:TextBox ID="txtTotalAmount" runat="server"
ReadOnly="true" CssClass="form-control" />
</div>

<div class="col-md-4">
<label class="form-label">Paid Amount</label>
<asp:TextBox ID="txtPaidlAmount" runat="server"
CssClass="form-control" />
</div>

<div class="col-md-4">
<label class="form-label">Balance Amount</label>
<asp:TextBox ID="txtBalanceAmount" runat="server"
ReadOnly="true" CssClass="form-control" />
</div>

<div class="col-md-12">
<label class="form-label">Remarks</label>
<asp:TextBox ID="txtRemarks" runat="server"
TextMode="MultiLine" Rows="2"
CssClass="form-control" />
</div>

</div>

<div class="text-end mt-3">
<asp:Button ID="btnSave" runat="server"
Text="Save Payment"
CssClass="btn btn-success me-1"
OnClick="btnSave_Click" />

<asp:Button ID="btnClear" runat="server"
Text="Clear"
CssClass="btn btn-secondary"
OnClick="btnClear_Click" />
</div>

</div>
</div>

<div class="card form-card mt-4">
<div class="card-body">

<h6 class="fw-bold mb-2">Payment List</h6>

<asp:GridView ID="gvPayments" runat="server"
AutoGenerateColumns="False"
CssClass="table table-bordered table-hover table-sm"
OnRowCommand="gvPayments_RowCommand">

<Columns>

<asp:BoundField DataField="VendorName" HeaderText="Vendor" />
<asp:BoundField DataField="InvoiceNo" HeaderText="Invoice" />
<asp:BoundField DataField="PaymentDate" HeaderText="Date"
DataFormatString="{0:dd-MM-yyyy}" />
<asp:BoundField DataField="TotalAmount" HeaderText="Total" />
<asp:BoundField DataField="PaidAmount" HeaderText="Paid" />
<asp:BoundField DataField="BalanceAmount" HeaderText="Balance" />

<asp:TemplateField HeaderText="Edit">
<ItemTemplate>
<asp:LinkButton runat="server"
CommandName="EditPay"
CommandArgument='<%# Eval("PaymentId") %>'>
Edit
</asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Delete">
<ItemTemplate>
<asp:LinkButton runat="server"
CommandName="DeletePay"
CommandArgument='<%# Eval("PaymentId") %>'
OnClientClick="return confirm('Delete?');">
Delete
</asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>

</Columns>
</asp:GridView>

</div>
</div>

</div>

</asp:Content>
