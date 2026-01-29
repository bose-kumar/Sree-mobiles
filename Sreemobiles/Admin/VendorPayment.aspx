<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="VendorPayment.aspx.cs" Inherits="Sreemobiles.Admin.VendorPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
    .form-card {
        background:#fff;
        border-radius:12px;
        box-shadow:0 6px 16px rgba(0,0,0,.06);
    }
    .form-label {
        font-size:13px;
        font-weight:600;
    }
</style>

<div class="container-fluid">

    <!-- TITLE -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold mb-0">
            <i class="fa fa-indian-rupee-sign text-success me-1"></i> Vendor Payment
        </h4>
    </div>

    <!-- FORM CARD -->
    <div class="card form-card">
        <div class="card-body">

            <div class="row g-3">

                <!-- VENDOR ID -->
                <div class="col-md-4">
                    <label class="form-label">Vendor ID</label>
                    <asp:DropDownList 
                        ID="ddlVendorCode" 
                        runat="server" 
                        CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <!-- VENDOR NAME -->
                <div class="col-md-4">
                    <label class="form-label">Vendor Name</label>
                    <asp:DropDownList 
                        ID="ddlVendorName" 
                        runat="server" 
                        CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <!-- PAYMENT DATE -->
                <div class="col-md-4">
                    <label class="form-label">Payment Date</label>
                    <asp:TextBox 
                        ID="txtPaymentDate" 
                        runat="server" 
                        CssClass="form-control" 
                        TextMode="Date" />
                </div>

                <!-- PAYMENT MODE -->
                <div class="col-md-4">
                    <label class="form-label">Payment Mode</label>
                    <asp:DropDownList 
                        ID="ddlPaymentMode" 
                        runat="server" 
                        CssClass="form-select">
                         <asp:ListItem Text="SELECT" />
                        <asp:ListItem Text="Cash" />
                        <asp:ListItem Text="Bank Transfer" />
                        <asp:ListItem Text="UPI" />
                        <asp:ListItem Text="Cheque" />
                    </asp:DropDownList>
                </div>

                <!-- AMOUNT -->
                <div class="col-md-4">
                    <label class="form-label">Amount</label>
                    <asp:TextBox 
                        ID="txtAmount" 
                        runat="server" 
                        CssClass="form-control" />
                </div>

                <!-- REFERENCE -->
                <div class="col-md-4">
                    <label class="form-label">Reference No</label>
                    <asp:TextBox 
                        ID="txtReference" 
                        runat="server" 
                        CssClass="form-control" />
                </div>

                <!-- REMARKS -->
                <div class="col-md-12">
                    <label class="form-label">Remarks</label>
                    <asp:TextBox 
                        ID="txtRemarks" 
                        runat="server" 
                        CssClass="form-control"
                        TextMode="MultiLine" Rows="2" />
                </div>

            </div>

            <!-- ACTION BUTTONS -->
            <div class="text-end mt-3">
                <asp:Button 
                    ID="btnSave" 
                    runat="server" 
                    Text="Save Payment" 
                    CssClass="btn btn-success me-1" />
                <asp:Button 
                    ID="btnClear" 
                    runat="server" 
                    Text="Clear" 
                    CssClass="btn btn-secondary" />
            </div>

        </div>
    </div>

</div>

</asp:Content>


