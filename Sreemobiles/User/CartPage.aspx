<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="Sreemobiles.User.CartPage" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Your Cart</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body{
            background:#faf7f2;
        }
        .cart-wrap{
            background:#fff;
            border-radius:14px;
            padding:20px;
            box-shadow:0 10px 30px rgba(0,0,0,.06);
        }
        .cart-img{
            width:60px;
            height:60px;
            object-fit:contain;
        }
        .qty-btn{
            width:32px;
            height:32px;
            border:none;
            border-radius:8px;
            background:#eee;
        }
        .cart-close{
            position:absolute;
            right:20px;
            top:20px;
            font-size:22px;
            color:#333;
            text-decoration:none;
        }
        .summary{
            background:#fff;
            border-radius:14px;
            padding:20px;
            box-shadow:0 10px 30px rgba(0,0,0,.06);
        }
    </style>
</head>
<body>

<form runat="server">

<div class="container mt-5 mb-5 position-relative">

    <!-- Close -->
    <a href="Product.aspx" class="cart-close">
        <i class="fa fa-times"></i>
    </a>

    <h3 class="text-center mb-4 fw-bold">Your Cart</h3>

    <div class="row g-4">

        <!-- LEFT CART -->
        <div class="col-lg-8">

            <div class="cart-wrap">

                <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                    <HeaderTemplate>
                        <div class="row fw-bold mb-3">
                            <div class="col-2">Product</div>
                            <div class="col-3">Name</div>
                            <div class="col-2">Price</div>
                            <div class="col-2">Qty</div>
                            <div class="col-2">Total</div>
                            <div class="col-1">Remove</div>
                        </div>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <div class="row align-items-center mb-3">

                            <div class="col-2">
                                <img src='<%# ResolveUrl("~/ProductImages/" + Eval("Image1")) %>'
                                     class="cart-img" />
                            </div>

                            <div class="col-3">
                                <%# Eval("ProductName") %>
                            </div>

                            <div class="col-2">
                                ₹ <%# Eval("Price") %>
                            </div>

                            <div class="col-2">
                                <asp:Button runat="server" Text="-" CssClass="qty-btn"
                                    CommandName="minus"
                                    CommandArgument='<%# Eval("ProductId") %>' />

                                <span class="mx-2 fw-bold"><%# Eval("Qty") %></span>

                                <asp:Button runat="server" Text="+" CssClass="qty-btn"
                                    CommandName="plus"
                                    CommandArgument='<%# Eval("ProductId") %>' />
                            </div>

                            <div class="col-2 fw-bold">
                                ₹ <%# Eval("RowTotal") %>
                            </div>

                            <div class="col-1">
                                <asp:LinkButton runat="server"
                                    CssClass="text-danger"
                                    CommandName="remove"
                                    CommandArgument='<%# Eval("ProductId") %>'>
                                    <i class="fa fa-trash"></i>
                                </asp:LinkButton>
                            </div>

                        </div>
                    </ItemTemplate>

                </asp:Repeater>

            </div>

        </div>

        <!-- RIGHT SUMMARY -->
        <div class="col-lg-4">

            <div class="summary">

                <h5 class="fw-bold">Cart Total</h5>
                <p class="text-muted">Total Amount</p>

                <h3 class="text-success fw-bold">
                    ₹ <asp:Label ID="lblGrandTotal" runat="server" />
                </h3>

                <asp:Button runat="server"
                    Text="Proceed to Checkout"
                    CssClass="btn btn-warning w-100 mt-3" />

                <a href="Product.aspx" class="d-block text-center mt-3">
                    ← Continue Shopping
                </a>

            </div>

        </div>

    </div>

</div>

</form>
</body>
</html>
