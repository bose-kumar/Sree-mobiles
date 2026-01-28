<%@ Page Title="Product List" Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="Product.aspx.cs"
    Inherits="Sri_Mobiles.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

<div class="container mt-4">

    <a href="AddProduct.aspx" class="btn btn-primary mb-3">+ Add Product</a>

    <asp:GridView ID="gvProducts" runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-bordered">

        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="ID"/>
            <asp:BoundField DataField="ProductName" HeaderText="Name"/>
            <asp:BoundField DataField="BrandName" HeaderText="Brand"/>
            <asp:BoundField DataField="Category" HeaderText="Category"/>
            <asp:BoundField DataField="Price" HeaderText="Price"/>
            <asp:BoundField DataField="Quantity" HeaderText="Qty"/>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" Width="50"
                        ImageUrl='<%# Eval("MainImage") %>'/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <a href='AddProduct.aspx?id=<%# Eval("ProductId") %>'
                       class="btn btn-warning btn-sm">Edit</a>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server"
                        Text="Delete"
                        CssClass="btn btn-danger btn-sm"
                        CommandArgument='<%# Eval("ProductId") %>'
                        OnClientClick="return confirm('Delete?');"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</div>

</asp:Content>
