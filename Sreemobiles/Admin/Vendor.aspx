<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Vendor.aspx.cs" Inherits="Sreemobiles.Admin.Vendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
    body{background:#f4f6fb}

    h3{margin:0 0 8px}

    .container-fluid{padding-top:8px}

    .form-card{
        background:#fff;
        border:none;
        border-radius:12px;
        box-shadow:0 6px 16px rgba(0,0,0,.06)
    }

    .card-body{padding:14px}

    .section-title{
        font-size:13px;
        font-weight:700;
        color:#1f2937;
        margin-bottom:6px;
        display:flex;
        align-items:center;
        gap:6px;
        text-transform:uppercase
    }

    .form-label{
        font-size:14px;
        font-weight:600;
        color:#374151;
        margin-bottom:2px
/* font-size: 12px;
color: #6b7280;
font-weight: 600;
letter-spacing: .5px;*/
}

    }

    .form-control{
        border-radius:7px;
        padding:6px 9px;
        font-size:13px
    }

    .row.g-3{--bs-gutter-y:8px}

    .btn-action{
        background:#f97316;
        color:#fff;
        border:none;
        padding:6px 16px;
        border-radius:6px;
        font-weight:600;
        margin-left:6px
    }

    .btn-action:hover{background:#ea580c}
</style>

<div class="container-fluid">

    <h3 class="fw-bold">
        <i class="fa fa-store me-1 text-primary"></i> Vendor Master
    </h3>

    <div class="card form-card">
        <div class="card-body">

            

            <div class="row g-3">

                <!-- LEFT -->
                <div class="col-md-6">
                    <label class="form-label">Vendor Code</label>
                    <asp:TextBox ID="txtVendorCode" runat="server" CssClass="form-control" ReadOnly="true" />

                    <label class="form-label mt-1">Vendor Name</label>
                    <asp:TextBox ID="txtVendorName" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Vendor Address</label>
                    <asp:TextBox ID="txtAddress" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="2" />

                    <label class="form-label mt-1">TIN No.</label>
                    <asp:TextBox ID="txtTIN" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">GST No.</label>
                    <asp:TextBox ID="txtGST" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Email ID</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Mobile No.</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" />
                </div>

                <!-- RIGHT -->
                <div class="col-md-6">
                    <label class="form-label">Bank Name</label>
                    <asp:TextBox ID="txtBank" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Branch</label>
                    <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Account No.</label>
                    <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Account Name</label>
                    <asp:TextBox ID="txtAccountName" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Account Type</label>
                    <asp:TextBox ID="txtAccountType" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">IFSC Code</label>
                    <asp:TextBox ID="txtIFSC" runat="server" CssClass="form-control" />
                </div>

            </div>

            <!-- ACTIONS -->
            <div class="text-end mt-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-warning" />
                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-warning" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit Table" CssClass="btn btn-warning" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning" />
            </div>

        </div>
    </div>
</div>

</asp:Content>
