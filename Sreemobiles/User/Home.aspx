<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Sri_Mobiles.User.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
             font-family: 'Poppins', sans-serif;
 background: #f8fafc;
 color: #111827;
        }

    /* CAROUSEL */
    .carousel-img {
        width: 100%;
        height: 300px;
        object-fit: cover;
    }

/*    .carousel-caption {
        background: rgba(0,0,0,0.45);
        padding: 14px 20px;
        border-radius: 10px;
    }*/

    /* CATEGORY BOX */
    .product-box {
        background: #fff7ed;
        padding: 30px;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        transition: 0.3s;
    }

    .product-box i {
        font-size: 32px;
        margin-bottom: 10px;
    }

    .product-box:hover {
        background: linear-gradient(135deg,#22c55e,#ea580c);
        color: #fff;
        transform: translateY(-6px);
    }

    /* PRODUCT CARD */
    .index-product-card {
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.12);
        overflow: hidden;
        transition: 0.3s;
    }

    .index-product-card:hover {
        transform: translateY(-6px);
    }

    .index-product-card img {
        width: 100%;
        height: 140px;
        object-fit: cover;
    }

    .index-product-body {
        padding: 12px;
        text-align: center;
    }

    .index-product-price {
        color: #16a34a;
        font-weight: 700;
    }

    @media(max-width:768px) {
        .carousel-img { height: 220px; }
    }
</style>
     <!-- ================= CAROUSEL ================= -->
    <div id="mainCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <div class="carousel-inner">

            <div class="carousel-item active">
                <img src="../Images/Mobile Phones.png" class="carousel-img" />
                <div class="carousel-caption">
                    <h2>All Brand Mobiles</h2>
                    <p>Latest smartphones available</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../Images/mainAcessories.png" class="carousel-img" />
                <div class="carousel-caption">
                    <h2>Accessories</h2>
                    <p>Best quality products</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="../Images/TV.png" class="carousel-img" />
                <div class="carousel-caption">
                    <h2>Smart LED TVs</h2>
                    <p>All brands & sizes</p>
                </div>
            </div>

        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>

        <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>

    </div>

    <!-- ================= CATEGORIES ================= -->
    <section class="container py-5">
        <h2 class="text-center mb-4">Our Categories</h2>

        <div class="row g-4 text-center">
            <div class="col-6 col-md-3">
    <a href="Product.aspx?cat=mobile" class="text-decoration-none text-dark">
        <div class="product-box">
            <i class="fa fa-mobile-screen"></i>
            <h5>Mobiles</h5>
        </div>
    </a>
</div>

<div class="col-6 col-md-3">
    <a href="Product.aspx?cat=accessories" class="text-decoration-none text-dark">
        <div class="product-box">
            <i class="fa fa-headphones"></i>
            <h5>Headphones</h5>
        </div>
    </a>
</div>

<div class="col-6 col-md-3">
    <a href="Product.aspx?cat=tv" class="text-decoration-none text-dark">
        <div class="product-box">
            <i class="fa fa-tv"></i>
            <h5>LED TVs</h5>
        </div>
    </a>
</div>

<div class="col-6 col-md-3">
    <a href="Product.aspx?cat=accessories" class="text-decoration-none text-dark">
        <div class="product-box">
            <i class="fa fa-plug"></i>
            <h5>Accessories</h5>
        </div>
    </a>
</div>


        </div>
    </section>

    <!-- ================= PRODUCTS ================= -->
    <section class="container py-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="fw-bold">Recently Viewed</h4>

        <a href="Product.aspx" class="text-decoration-none fw-semibold">
            View All →
        </a>
    </div>

    <div class="row g-3">

    <asp:Repeater ID="rptRecent" runat="server"
    OnItemCommand="rptRecent_ItemCommand">


            <ItemTemplate>

                <div class="col-6 col-md-3">

                    <div class="index-product-card">

                        <img src='<%# "../ProductImages/" + Eval("Image1") %>'
                             style="height:140px;object-fit:contain;width:100%;" />

                        <div class="index-product-body">

                            <h6 class="mb-1">
                                <%# Eval("ProductName") %>
                            </h6>

                            <div class="index-product-price">
                                ₹ <%# Eval("Price") %>
                            </div>

                           
                                        <asp:Button
                                            runat="server"
                                            Text="View Details"
                                            CssClass="btn btn-outline-dark btn-sm w-100 mt-2"
                                            CommandName="view"
                                            CommandArgument='<%# Eval("ProductId") %>' />

                                        <asp:Button
                                            runat="server"
                                            Text="Add to Cart"
                                            CssClass="btn btn-warning btn-sm w-100 mt-2"
                                            CommandName="addcart"
                                            CommandArgument='<%# Eval("ProductId") %>' />

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</section>

</asp:Content>






