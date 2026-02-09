<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="Sreemobiles.User.CartPage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>My Cart</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .cart-img{
            width:60px;
            height:60px;
            object-fit:contain;
        }

        .cart-close{
            position:absolute;
            right:15px;
            top:10px;
            font-size:22px;
            text-decoration:none;
        }
    </style>
</head>
<body>

<form runat="server">

<div class="container mt-4 position-relative">

    <!-- CLOSE BUTTON -->
    <a href="Product.aspx" class="cart-close">&times;</a>

    <h4 class="mb-3">My Cart</h4>

    <asp:GridView ID="gvCart" runat="server"
        AutoGenerateColumns="False"
        CssClass="table table-bordered align-middle"
        OnRowCommand="gvCart_RowCommand">

        <Columns>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <img src='<%# ResolveUrl("~/ProductImages/" + Eval("Image1")) %>'
                         class="cart-img" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" />

            <asp:BoundField DataField="Qty" HeaderText="Qty" />

            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="₹ {0:N2}" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button runat="server"
                        Text="Remove"
                        CssClass="btn btn-sm btn-danger"
                        CommandName="remove"
                        CommandArgument='<%# Eval("ProductId") %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>

    <div class="text-end">
        <b>Total Quantity : </b>
        <asp:Label ID="lblTotalQty" runat="server"></asp:Label>
        <br />
        <b>Total Amount : ₹ </b>
        <asp:Label ID="lblTotal" runat="server"></asp:Label>
    </div>

</div>

</form>
</body>
</html>
