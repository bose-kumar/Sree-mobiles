<%@ Page Title="Vendor Master" Language="C#" MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="Vendor.aspx.cs"
    Inherits="Sreemobiles.Admin.Vendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
    body { background:#f4f6fb; }

    h3 { margin:0 0 8px; }

    .container-fluid { padding-top:8px; }

    .form-card {
        background:#fff;
        border:none;
        border-radius:12px;
        box-shadow:0 6px 16px rgba(0,0,0,.06);
    }

    .card-body { padding:14px; }

    .form-label {
        font-size:13px;
        font-weight:600;
        color:#374151;
        margin-bottom:2px;
    }

    .form-control {
        border-radius:7px;
        padding:6px 9px;
        font-size:13px;
    }

    .row.g-3 { --bs-gutter-y:8px; }

    .table th, .table td {
        font-size:13px;
        vertical-align:middle;
    }

    .table-hover tbody tr:hover {
        background:#f9fafb;
    }
</style>


   
<div class="d-flex justify-content-between align-items-center mb-2">

    <h3 class="fw-bold mb-0">
        <i class="fa fa-store me-1 text-primary"></i> Vendor Master
    </h3>
</div>

    
   <div class="container mt-4 text-end">
    <asp:LinkButton 
        ID="btnVendorPayment" 
        runat="server" 
        CssClass="btn btn-warning" OnClick="btnVendorPayment_Click1">
        <i class="fa fa-indian-rupee-sign me-1"></i> Vendor Payment
    </asp:LinkButton>
</div>

<div class="mt-3"></div>






    <!-- FORM CARD -->
 <div class="card form-card">
        <div class="card-body">

            <div class="row g-3">

                <!-- LEFT -->
                <div class="col-md-6">
                    <label class="form-label">Vendor Id</label>
                    <asp:TextBox ID="txtVendorCode" runat="server" CssClass="form-control"/>
                  
                    <label class="form-label mt-1">Vendor Name</label>
                    <asp:TextBox ID="txtVendorName" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Vendor Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="2" />

                    <label class="form-label mt-1">GST No</label>
                    <asp:TextBox ID="txtGST" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Email ID</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Mobile No</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" />
                </div>

                <!-- RIGHT -->
                <div class="col-md-6">
                    <label class="form-label">Bank Name</label>
                    <asp:TextBox ID="txtBank" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Branch</label>
                    <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Account No</label>
                    <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Account Name</label>
                    <asp:TextBox ID="txtAccountName" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">Account Type</label>
                    <asp:TextBox ID="txtAccountType" runat="server" CssClass="form-control" />

                    <label class="form-label mt-1">IFSC Code</label>
                    <asp:TextBox ID="txtIFSC" runat="server" CssClass="form-control" />
                </div>

            </div>

            <!-- ACTION BUTTONS -->
            <div class="text-end mt-3">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success me-1" OnClick="btnSave_Click" />
                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-secondary"/>
            </div>

        </div>
    </div>
   <%--grid chnages--%>
    <!-- GRID CARD -->
    <div class="card form-card mt-3">
        <div class="card-body">

            <h6 class="fw-bold mb-2">
                <i class="fa fa-list text-primary me-1"></i> Vendor List
            </h6>

            <asp:GridView ID="gvVendors" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover table-sm"
                EmptyDataText="No Vendors Found">

                <Columns>
                    <asp:BoundField DataField="VendorId" HeaderText="Code" />
                    <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" />
                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
                    <asp:BoundField DataField="GSTNo" HeaderText="GST No" />
                    <asp:BoundField DataField="BankName" HeaderText="Bank" />

                   
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>

                            <!-- EDIT -->
                            <asp:LinkButton runat="server"
                                CommandName="EditVendor"
                                CommandArgument='<%# Eval("VendorId") %>'
                                CssClass="btn btn-sm btn-outline-primary me-1"
                                ToolTip="Edit">
                                <i class="fa fa-pen"></i>
                            </asp:LinkButton>

                            <!-- DELETE -->
                            <asp:LinkButton runat="server"
                                CommandName="DeleteVendor"
                                CommandArgument='<%# Eval("VendorId") %>'
                                CssClass="btn btn-sm btn-outline-danger"
                                ToolTip="Delete"
                                OnClientClick="return confirm('Are you sure to delete?');">
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
