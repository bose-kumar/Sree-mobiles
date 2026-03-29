<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Sreemobiles.User.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
<style>
body{
    background:#faf7f2;
}

.pd-wrap{
    background:#ffffff;
    padding:28px;
    border-radius:18px;
    box-shadow:0 12px 30px rgba(0,0,0,.08);
    position:relative;
}

/* close button */
.pd-close{
    position:absolute;
    top:14px;
    right:14px;
    background:#f3f4f6;
    border:none;
    width:36px;
    height:36px;
    border-radius:50%;
    font-size:18px;
    cursor:pointer;
}

.pd-close:hover{
    background:#e5e7eb;
}

/* LEFT IMAGE PART */

.pd-left{
    display:flex;
    flex-direction:column;
    align-items:center;
}

.pd-main-img{
    width:100%;
    max-width:340px;
    height:340px;
    object-fit:contain;
    background:#f6f6f6;
    border-radius:16px;
    padding:14px;
    border:none;
}

/* Thumbnails */

.pd-thumbs{
    display:flex;
    gap:10px;
    margin-top:14px;
    justify-content:center;
}

.pd-thumbs input[type=image]{
    width:60px;
    height:60px;
    object-fit:contain;
    border-radius:10px;
    padding:6px;
    background:#fff;
    border:1px solid #eee;
    cursor:pointer;
    transition:.2s;
}

.pd-thumbs input[type=image]:hover{
    transform:scale(1.05);
    border-color:#ffc107;
}

/* RIGHT CONTENT */

.pd-right{
    display:flex;
    flex-direction:column;
}

/* Title */

.pd-title{
    font-size:26px;
    font-weight:800;
    color:#1f2937;
    margin-bottom:4px;
}

/* Brand */

.pd-brand{
    color:#6b7280;
    font-size:14px;
    margin-bottom:10px;
}

/* Price */

.pd-price{
    font-size:28px;
    font-weight:800;
    color:#16a34a;
    margin-bottom:14px;
}

/* Buttons */

.pd-actions{
    display:flex;
    gap:12px;
    margin-bottom:16px;
}

.pd-actions .btn-warning{
    background:#ffc107;
    border:none;
    font-weight:700;
    border-radius:12px;
}

.pd-actions .btn-dark{
    border-radius:12px;
    font-weight:700;
}

/* Section titles */

.sec-title{
    font-weight:700;
    font-size:15px;
    color:#111827;
    margin-top:18px;
    margin-bottom:6px;
}

/* Description & spec */

.pd-desc,
.pd-spec{
    font-size:14px;
    line-height:1.7;
    color:#374151;
}

/* Highlights card style */

.pd-right ul{
    padding-left:18px;
    background:#fafafa;
    border-radius:12px;
    padding:12px 16px;
    margin-bottom:0;
}

.pd-right ul li{
    margin-bottom:6px;
    font-size:14px;
}

/* Product details table */

table{
    border-radius:12px;
    overflow:hidden;
}

table th{
    background:#fff7e6;
    font-weight:700;
    font-size:14px;
}

table td{
    font-size:14px;
}

/* Divider */

hr{
    margin:18px 0;
    border-top:1px solid #eee;
}
</style>

<div class="container mt-4 mb-5">
    <div class="pd-wrap">

        <!-- CLOSE BUTTON -->
        <asp:LinkButton ID="btnClose" runat="server"
            CssClass="pd-close"
            ToolTip="Close"
            OnClick="btnClose_Click">
            <i class="fa fa-times"></i>
        </asp:LinkButton>

        <div class="row g-4">

            <!-- LEFT -->
            <div class="col-md-5 pd-left">

                <asp:Image ID="imgMain" runat="server" CssClass="pd-main-img" />

                <div class="pd-thumbs">
                    <asp:ImageButton ID="imgT1" runat="server" OnClick="Thumb_Click" />
                    <asp:ImageButton ID="imgT2" runat="server" OnClick="Thumb_Click" />
                    <asp:ImageButton ID="imgT3" runat="server" OnClick="Thumb_Click" />
                    <asp:ImageButton ID="imgT4" runat="server" OnClick="Thumb_Click" />
                    <asp:ImageButton ID="imgT5" runat="server" OnClick="Thumb_Click" />
                </div>

            </div>

            <!-- RIGHT -->
            <div class="col-md-7 pd-right">

                <div class="pd-title">
                    <asp:Label ID="lblName" runat="server" />
                </div>

                <div class="pd-brand">
                    <asp:Label ID="lblBrand" runat="server" />
                </div>

                <div class="pd-price">
                    ₹ <asp:Label ID="lblPrice" runat="server" />
                </div>

                <div class="pd-actions">
                    <asp:Button runat="server" Text="Add to Cart"
                        CssClass="btn btn-warning px-4"
                        OnClick="btnAddToCart_Click" />

                    <asp:Button runat="server" Text="Buy Now"
                        CssClass="btn btn-dark px-4"
                        OnClick="btnBuyNow_Click" />
                </div>

                <hr />

                <div class="sec-title">Description</div>
                <asp:Label ID="lblDesc" runat="server" CssClass="pd-desc" />

                <div class="sec-title">Specification</div>
                <asp:Label ID="lblSpec" runat="server" CssClass="pd-spec" />

                <hr />

                <div class="row">

                    <div class="col-md-6">
                        <div class="sec-title">Highlights</div>
                        <ul>
                            <li>Brand :
                                <asp:Label ID="lblHBrand" runat="server" /></li>
                            <li>Category :
                                <asp:Label ID="lblHCategory" runat="server" /></li>
                            <li>Available Stock :
                                <asp:Label ID="lblHQty" runat="server" /></li>
                        </ul>
                    </div>

                    <div class="col-md-6">
                        <div class="sec-title">Seller & Service</div>
                        <ul>
                            <li>100% Genuine Product</li>
                            <li>Easy Replacement</li>
                            <li>Secure Payments</li>
                        </ul>
                    </div>

                </div>

                <hr />

                <div class="sec-title">Product Details</div>

                <table class="table table-sm table-bordered">
                    <tr>
                        <th width="30%">Product Name</th>
                        <td><asp:Label ID="lblDName" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Brand</th>
                        <td><asp:Label ID="lblDBrand" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td><asp:Label ID="lblDCategory" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>₹ <asp:Label ID="lblDPrice" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Stock</th>
                        <td><asp:Label ID="lblDQty" runat="server" /></td>
                    </tr>
                </table>

            </div>

        </div>

    </div>
</div>

</asp:Content>

