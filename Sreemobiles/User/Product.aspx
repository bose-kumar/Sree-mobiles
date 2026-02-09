<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Sri_Mobiles.User.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f8fafc;
        color: #111827;
    }

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

    @media (max-width: 991px) {
        .filter-box {
            margin-bottom: 20px;
        }
    }
</style>

<section class="container pb-5">
    <div class="row">

        <!-- FILTER -->
        <div class="col-md-3">
            <div class="filter-box">
                <h5>Categories</h5>
                <ul>
                    <li class="active" onclick="setCategory('all', this)">All</li>
                    <li onclick="setCategory('mobile', this)">Mobiles</li>
                    <li onclick="setCategory('accessories', this)">Accessories</li>
                    <li onclick="setCategory('tv', this)">LED TVs</li>
                </ul>
            </div>
        </div>

        <!-- PRODUCT LIST -->
        <div class="col-md-9">
            <div class="row g-4" id="product-list">

                <asp:Repeater ID="rptProducts" runat="server"
                    OnItemCommand="rptProducts_ItemCommand">

                    <ItemTemplate>

                        <!-- IMPORTANT : data-category added -->
                        <div class="col-md-4 col-sm-6 product-card-wrapper"
                             data-category='<%# Eval("Category").ToString().ToLower() %>'>

                            <div class="product-card">

                                <div class="text-center p-2">

                                    <!-- main image -->
                                    <img src='<%# "../ProductImages/" + Eval("Image1") %>'
                                         class="img-fluid mb-2"
                                         style="height:180px;object-fit:contain;" />

                                    <!-- thumbnails -->
                                    <div class="d-flex justify-content-center gap-1">

                                       
                                   

                                    </div>

                                </div>

                                <div class="product-body">

                                    <h6>
                                        <a href='ViewDetails.aspx?id=<%# Eval("ProductId") %>'>
                                            <%# Eval("ProductName") %>
                                        </a>
                                    </h6>

                                    <p><%# Eval("Brand") %></p>

                                    <span class="price">
                                        ₹ <%# Eval("Price") %>
                                    </span>

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
        </div>

    </div>
</section>

<!-- CATEGORY FILTER SCRIPT -->
<script>
    function setCategory(cat, el) {

        var items = document.getElementsByClassName("product-card-wrapper");

        for (var i = 0; i < items.length; i++) {

            var itemCat = items[i].getAttribute("data-category");

            if (cat === "all" || itemCat === cat) {
                items[i].style.display = "block";
            }
            else {
                items[i].style.display = "none";
            }
        }

        var lis = el.parentNode.getElementsByTagName("li");

        for (var j = 0; j < lis.length; j++) {
            lis[j].classList.remove("active");
        }

        el.classList.add("active");
    }
</script>

</asp:Content>

