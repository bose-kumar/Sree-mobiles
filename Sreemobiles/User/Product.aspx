<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Sri_Mobiles.User.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
     font-family: 'Poppins', sans-serif;
 background: #f8fafc;
 color: #111827;
}
    /* FILTER */
    .filter-box {
        border: 1px solid #e5e5e5;
        padding: 20px;
        border-radius: 12px;
        background: #ffffff;
    }

    .filter-box h5 {
        font-weight: 700;
        margin-bottom: 15px;
    }

    .filter-box ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .filter-box li {
        padding: 10px 0;
        cursor: pointer;
        font-weight: 500;
    }

    .filter-box li:hover,
    .filter-box li.active {
        color: #f7d042;
    }

    /* PRODUCT CARD */
    .product-card {
        background: #ffffff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: 100%;
    }

    .product-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 14px 30px rgba(0,0,0,0.12);
    }

    .product-body {
        padding: 16px;
        text-align: center;
    }

    .product-body h6 {
        font-weight: 700;
        font-size: 16px;
        margin-bottom: 6px;
    }

    .product-body p {
        font-size: 14px;
        color: #6b7280;
    }

    .price {
        display: block;
        font-size: 18px;
        font-weight: bold;
        color: #16a34a;
        margin-top: 6px;
    }

    .stars i {
        color: #facc15;
        font-size: 14px;
    }

    /* RESPONSIVE */
    @media (max-width: 991px) {
        .filter-box {
            margin-bottom: 20px;
        }
    }

    @media (max-width: 768px) {
        .filter-box ul {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filter-box li {
            width: 48%;
            background: #f9fafb;
            border-radius: 8px;
            text-align: center;
            padding: 8px 0;
        }
    }

    @media (max-width: 480px) {
        .filter-box li {
            width: 100%;
        }

        .product-body h6 {
            font-size: 14px;
        }

        .product-body p {
            font-size: 13px;
        }
    }
</style>

<!-- ================= PRODUCTS ================= -->
<section class="container pb-5">
    <div class="row">

        <!-- FILTER -->
        <div class="col-md-3">
            <div class="filter-box">
                <h5>Categories</h5>
                <ul>
                    <li class="active" onclick="setCategory('all', this)">All</li>
                    <li onclick="setCategory('mobile', this)">Mobiles</li>
                    <li onclick="setCategory('accessory', this)">Accessories</li>
                    <li onclick="setCategory('tv', this)">LED TVs</li>
                </ul>
            </div>
        </div>

        <!-- PRODUCT LIST -->
        <div class="col-md-9">
            <div class="row g-4" id="product-list">

                <!-- PRODUCT 1 -->
                <div class="col-md-4 col-sm-6 product-card-wrapper" data-category="mobile">
                    <div class="product-card">
                        <img src="../Images/Mobile phones.png" class="img-fluid" alt="Mobile" />
                        <div class="product-body">
                            <h6>Samsung Smartphone</h6>
                            <p>64GB, 6GB RAM</p>

                            <div class="stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-alt"></i>
                            </div>

                            <span class="price">₹12,999</span>

                            <asp:Button ID="btnAdd1"
                                runat="server"
                                CssClass="btn btn-warning btn-sm w-100 mt-2"
                                Text="Add to Cart" />
                        </div>
                    </div>
                </div>

                <!-- PRODUCT 2 -->
                <div class="col-md-4 col-sm-6 product-card-wrapper" data-category="accessory">
                    <div class="product-card">
                        <img src="../Images/mainAcessories.png" class="img-fluid" alt="Accessory" />
                        <div class="product-body">
                            <h6>Bluetooth Headset</h6>
                            <p>Noise Cancellation</p>

                            <div class="stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>

                            <span class="price">₹1,299</span>

                            <asp:Button ID="btnAdd2"
                                runat="server"
                                CssClass="btn btn-warning btn-sm w-100 mt-2"
                                Text="Add to Cart" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</section>
</asp:Content>

