<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Sreemobiles.User.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   


<style>
    .pd-wrap{
        background:#fff;
        padding:25px;
        border-radius:14px;
        box-shadow:0 8px 20px rgba(0,0,0,.06);
    }

    .pd-left{
        display:flex;
        flex-direction:column;
        align-items:center;
    }

    .pd-main-img{
        width:100%;
        max-width:320px;
        height:320px;
        object-fit:contain;
        border:1px solid #eee;
        border-radius:10px;
        background:#fafafa;
        padding:10px;
    }

    .pd-thumbs{
        display:flex;
        gap:8px;
        margin-top:12px;
        justify-content:center;
    }

   .pd-thumbs input[type=image]{
    width:55px;
    height:55px;
    object-fit:contain;
    border:1px solid #ddd;
    border-radius:6px;
    padding:4px;
    background:#fff;
    cursor:pointer;
}

    }

    .pd-right{
        display:flex;
        flex-direction:column;
    }

    .pd-title{
        font-size:24px;
        font-weight:700;
        margin-bottom:4px;
    }

    .pd-brand{
        color:#6b7280;
        font-size:14px;
        margin-bottom:8px;
    }

    .pd-price{
        font-size:26px;
        font-weight:700;
        color:#16a34a;
        margin-bottom:12px;
    }

    .pd-actions{
        display:flex;
        gap:10px;
        margin-bottom:12px;
    }

    .sec-title{
        font-weight:600;
        margin-top:14px;
        margin-bottom:6px;
    }

    .pd-desc,
    .pd-spec{
        font-size:14px;
        line-height:1.6;
    }

    ul{padding-left:18px}
    table th{background:#f9fafb}
</style>

<div class="container mt-4 mb-5">
    <div class="pd-wrap">

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
                        CssClass="btn btn-warning px-4" />
                    <asp:Button runat="server" Text="Buy Now"
                        CssClass="btn btn-dark px-4" />
                </div>

                <hr />

                <div class="sec-title">Description</div>
                <asp:Label ID="lblDesc" runat="server" CssClass="pd-desc" />

                <div class="sec-title">Specification</div>
                <asp:Label ID="lblSpec" runat="server" CssClass="pd-spec" />

                <hr />

                <!-- Highlights -->
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

                <!-- Product details table -->
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
