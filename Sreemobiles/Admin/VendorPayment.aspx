<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="VendorPayment.aspx.cs" Inherits="Sreemobiles.Admin.VendorPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">



<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
    .form-card {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 6px 16px rgba(0,0,0,.06);
    }
    .form-label {
        font-size: 13px;
        font-weight: 600;
    }
</style>

<div class="container-fluid">

    <!-- PAGE TITLE -->
    <h4 class="fw-bold mb-3">
        <i class="fa fa-indian-rupee-sign text-success me-1"></i>
        Vendor Payment
    </h4>

    <!-- FORM CARD -->
    <div class="card form-card">
        <div class="card-body">

            <div class="row g-3">

                <!-- Vendor Code -->
                <div class="col-md-4">
                    <label class="form-label">Vendor ID</label>
                    <asp:DropDownList ID="ddlVendorCode" runat="server"
                        CssClass="form-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlVendorCode_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <!-- Vendor Name -->
                <div class="col-md-4">
                    <label class="form-label">Vendor Name</label>
                    <asp:DropDownList ID="ddlVendorName" runat="server"
                        CssClass="form-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlVendorName_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <!-- Invoice -->
                <div class="col-md-4">
                    <label class="form-label">Invoice No</label>
                    <asp:DropDownList ID="ddlInvoice" runat="server"
                        CssClass="form-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlInvoice_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

            </div>

            <!-- Vendor view labels -->
            <div class="row g-3 mt-2">

                <div class="col-md-4">
                    <label class="form-label">Mobile</label><br />
                    <asp:Label ID="lblMobile" runat="server" CssClass="text-primary fw-semibold"></asp:Label>
                </div>

                <div class="col-md-8">
                    <label class="form-label">Address</label><br />
                    <asp:Label ID="lblAddress" runat="server" CssClass="text-primary fw-semibold"></asp:Label>
                </div>

            </div>

            <hr />

            <div class="row g-3">

                <!-- Payment Date -->
                <div class="col-md-4">
                    <label class="form-label">Payment Date</label>
                    <asp:TextBox ID="txtPaymentDate" runat="server"
                        CssClass="form-control"
                        TextMode="Date" />
                </div>

                <!-- Payment Mode -->
                <div class="col-md-4">
                    <label class="form-label">Payment Mode</label>
                    <asp:DropDownList ID="ddlPaymentMode" runat="server"
                        CssClass="form-select">
                        <asp:ListItem Text="SELECT" />
                        <asp:ListItem Text="Cash" />
                        <asp:ListItem Text="Bank Transfer" />
                        <asp:ListItem Text="UPI" />
                        <asp:ListItem Text="Cheque" />
                    </asp:DropDownList>
                </div>

                <!-- Total Amount -->
                <div class="col-md-4">
                    <label class="form-label">Total Amount</label>
                    <asp:TextBox ID="txtTotalAmount" runat="server"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>

                <!-- Paid Amount -->
                <div class="col-md-4">
                    <label class="form-label">Paid Amount</label>
                    <asp:TextBox ID="txtPaidlAmount" runat="server"
                        CssClass="form-control" />
                </div>

                <!-- Balance Amount -->
                <div class="col-md-4">
                    <label class="form-label">Balance Amount</label>
                    <asp:TextBox ID="txtBalanceAmount" runat="server"
                        CssClass="form-control"
                        ReadOnly="true" />
                </div>

                <!-- Remarks -->
                <div class="col-md-12">
                    <label class="form-label">Remarks</label>
                    <asp:TextBox ID="txtRemarks" runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="2" />
                </div>

            </div>

            <!-- Buttons -->
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

    <!-- GRID -->
    <div class="card form-card mt-4">
        <div class="card-body">

            <h6 class="fw-bold mb-2">
                <i class="fa fa-list me-1 text-primary"></i> Payment List
            </h6>

            <asp:GridView ID="gvPayments" runat="server"
                CssClass="table table-bordered table-hover table-sm"
                AutoGenerateColumns="False"
                DataKeyNames="PaymentId"
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
                                CommandArgument='<%# Eval("PaymentId") %>'
                                CssClass="btn btn-sm btn-outline-primary">
                                <i class="fa fa-pen"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                CommandName="DeletePay"
                                CommandArgument='<%# Eval("PaymentId") %>'
                                CssClass="btn btn-sm btn-outline-danger"
                                OnClientClick="return confirm('Delete this payment?');">
                                <i class="fa fa-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </div>

</div>

</asp:Content>
