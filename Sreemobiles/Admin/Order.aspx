<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Sri_Mobiles.Admin.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
   

<div class="container mt-4">

    <!-- PAGE TITLE -->
    <h2 class="mb-3">
        <i class="fa fa-shopping-cart me-1"></i> Order History
    </h2>

    <!-- FILTER SECTION (UI ONLY) -->
    <div class="row mb-3 g-2">
        <div class="col-md-3">
            <input type="text" class="form-control"
                   placeholder="Search by Order ID / Customer" />
        </div>

        <div class="col-md-3">
            <input type="date" class="form-control" />
        </div>

        <div class="col-md-3">
            <select class="form-select">
                <option>Status (All)</option>
                <option>Pending</option>
                <option>Confirmed</option>
                <option>Delivered</option>
                <option>Cancelled</option>
            </select>
        </div>
    </div>

    <!-- ORDER TABLE -->
    <div class="card shadow-sm">
        <div class="card-body">

            <div class="table-responsive">
                <asp:GridView runat="server"
                    CssClass="table table-bordered table-hover align-middle"
                    AutoGenerateColumns="false">

                    <Columns>
                        <asp:BoundField HeaderText="Order ID" />
                        <asp:BoundField HeaderText="Customer Name" />
                        <asp:BoundField HeaderText="Mobile No" />
                        <asp:BoundField HeaderText="Total Amount (₹)" />
                        <asp:BoundField HeaderText="Order Date" />
                        <asp:BoundField HeaderText="Status" />
                    </Columns>

                </asp:GridView>
            </div>

        </div>
    </div>

</div>

</asp:Content>


