<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Sri_Mobiles.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
    body {
        background: #f4f6fb;
    }

    /* ===== CARD STYLE ===== */
    .dash-card {
        border-radius: 16px;
        border: none;
        background: #ffffff;
        box-shadow: 0 10px 25px rgba(0,0,0,.06);
        transition: all .25s ease;
        height: 100%;
    }

    .dash-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 16px 35px rgba(0,0,0,.10);
    }

    .dash-title {
/*        font-size: 12px;
        color: #6b7280;
        font-weight: 600;
        letter-spacing: .5px;*/
 font-size:14px;
 font-weight:600;
 color:#374151;
 margin-bottom:2px
    }

    .dash-value {
        font-size: 28px;
        font-weight: 800;
        color: #111827;
    }

    .dash-icon {
        width: 52px;
        height: 52px;
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 22px;
        color: #fff;
    }

    /* ICON COLORS */
    .bg-blue { background: linear-gradient(135deg,#2563eb,#1e40af); }
    .bg-green { background: linear-gradient(135deg,#16a34a,#166534); }
    .bg-yellow { background: linear-gradient(135deg,#f59e0b,#b45309); }
    .bg-cyan { background: linear-gradient(135deg,#0891b2,#155e75); }
    .bg-dark { background: linear-gradient(135deg,#111827,#374151); }
    .bg-purple { background: linear-gradient(135deg,#7c3aed,#4c1d95); }
    .bg-red { background: linear-gradient(135deg,#dc2626,#7f1d1d); }

    /* SALES / PROFIT */
    .big-value {
        font-size: 36px;
        font-weight: 900;
    }
</style>

<div class="container-fluid mt-4">
    <h3 class="fw-bold mb-4">Admin Dashboard</h3>

    <!-- ===== STATS ===== -->
    <div class="row g-4">

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">TOTAL PRODUCTS</div>
                        <div class="dash-value"><asp:Label ID="lblProducts" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-blue"><i class="fa fa-box"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">TOTAL ORDERS</div>
                        <div class="dash-value"><asp:Label ID="lblOrders" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-green"><i class="fa fa-shopping-cart"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">MOBILE PHONES</div>
                        <div class="dash-value"><asp:Label ID="lblMobile" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-yellow"><i class="fa fa-mobile-screen"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">ACCESSORIES</div>
                        <div class="dash-value"><asp:Label ID="lblAccessories" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-cyan"><i class="fa fa-headphones"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">TV</div>
                        <div class="dash-value"><asp:Label ID="lblTV" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-dark"><i class="fa fa-tv"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">TOTAL STOCK</div>
                        <div class="dash-value"><asp:Label ID="lblStock" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-purple"><i class="fa fa-warehouse"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">PENDING DELIVERIES</div>
                        <div class="dash-value"><asp:Label ID="lblPending" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-red"><i class="fa fa-truck-fast"></i></div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-4 col-6">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">CUSTOMERS</div>
                        <div class="dash-value"><asp:Label ID="lblCustomers" runat="server" /></div>
                    </div>
                    <div class="dash-icon bg-green"><i class="fa fa-users"></i></div>
                </div>
            </div>
        </div>

    </div>

    <!-- ===== SALES & PROFIT ===== -->
    <div class="row g-4 mt-4">

        <div class="col-lg-6 col-12">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">TOTAL SALES</div>
                        <div class="big-value text-primary">
                            ₹ <asp:Label ID="lblSales" runat="server" />
                        </div>
                    </div>
                    <i class="fa fa-indian-rupee-sign fa-4x text-primary opacity-25"></i>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-12">
            <div class="card dash-card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="dash-title">TOTAL PROFIT</div>
                        <div class="big-value text-success">
                            ₹ <asp:Label ID="lblProfit" runat="server" />
                        </div>
                    </div>
                    <i class="fa fa-chart-line fa-4x text-success opacity-25"></i>
                </div>
            </div>
        </div>

    </div>

    <!-- ===== CHART ===== -->
    <div class="card dash-card mt-4">
        <div class="card-body">
            <h5 class="fw-bold mb-3">Monthly Orders Report</h5>
            <canvas id="orderChart" height="90"></canvas>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    window.onload = function () {
        var ctx = document.getElementById('orderChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: <%= MonthLabels %>,
            datasets: [{
                data: <%= MonthData %>,
                backgroundColor: '#2563eb'
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } }
        }
    });
    };
</script>

</asp:Content>