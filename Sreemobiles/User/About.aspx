<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true"CodeBehind="About.aspx.cs" Inherits="Sri_Mobiles.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   
<style>
/* FIX: avoid body override inside content page */
.page-about {
    font-family: 'Poppins', sans-serif;
    background: #f8fafc;
    color: #111827;
}

/* ================= ABOUT SECTION ================= */
.about-section {
    background: linear-gradient(135deg, #f7d042, #fbbf24);
    padding: 80px 40px;
    text-align: center;
}

.about-section h2 {
    font-size: 36px;
    font-weight: 800;
    margin-bottom: 25px;
    color: #1f2937;
}

.about-section p {
    font-size: 18px;
    line-height: 1.9;
    color: #374151;
    max-width: 900px;
    margin: auto;
}

/* ================= SERVICES ================= */
.services-section {
    padding: 60px 0;
}

.section-title {
    font-size: 32px;
    font-weight: 800;
    margin-bottom: 50px;
    text-align: center;
}

.service-card {
    background: #ffffff;
    padding: 45px 25px;
    border-radius: 18px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.12);
    transition: 0.35s;
    height: 100%;
}

.service-card i {
    font-size: 40px;
    color: #f7d042;
    margin-bottom: 18px;
}

.service-card h5 {
    font-weight: 600;
}

.service-card:hover {
    background: linear-gradient(135deg, #22c55e, #ea580c);
    transform: translateY(-12px);
}

.service-card:hover i,
.service-card:hover h5 {
    color: #ffffff;
}

/* ================= BRANDS ================= */
.brands-section {
    padding: 50px 0;
    background: #ffffff;
    overflow-x: hidden;
}

.brand-chain {
    width: 100%;
    overflow: hidden;
}

.brand-chain:hover .brand-track {
    animation-play-state: paused;
}

.brand-track {
    display: flex;
    width: 200%;
    animation: brandScroll 30s linear infinite;
}

.brand-item {
    width: 140px;
    height: 80px;
    margin: 0 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #ffffff;
    border-radius: 10px;
    flex-shrink: 0;
}

.brand-item img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    padding: 10px;
}

@keyframes brandScroll {
    0% { transform: translateX(0); }
    100% { transform: translateX(-50%); }
}
</style>

<div class="page-about">

<!-- ABOUT -->
<section class="about-section">
    <div class="container">
        <h2>About Sri Mobile</h2>
        <p>
            Sri Mobile is a trusted mobile sales and service center located in
            <strong>Puthiragoundanpalayam</strong>. Established in 2010, we focus on
            providing quality mobile products and services for both urban and rural customers.
            <br /><br />
            We offer branded smartphones, mobile accessories, LED TVs,
            prepaid & postpaid connections, and professional mobile servicing
            at affordable prices.
        </p>
    </div>
</section>

<!-- SERVICES -->
<section class="services-section">
    <div class="container">
        <h2 class="section-title">Our Services</h2>

        <div class="row g-4 text-center">
            <div class="col-md-3 col-sm-6">
                <div class="service-card">
                    <i class="fa fa-mobile-screen-button"></i>
                    <h5>Mobile Services</h5>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="service-card">
                    <i class="fa fa-sim-card"></i>
                    <h5>Prepaid / Postpaid</h5>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="service-card">
                    <i class="fa fa-bolt"></i>
                    <h5>Mobile Recharges</h5>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="service-card">
                    <i class="fa fa-tags"></i>
                    <h5>Branded Mobiles</h5>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- BRANDS -->
<section class="brands-section">
    <div class="container text-center">
        <h2 class="section-title">Our Brands</h2>

        <div class="brand-chain">
            <div class="brand-track">

                <!-- ORIGINAL SET -->
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/apple.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Asus.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/blackberry.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/HTC.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/huawei.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Lg.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Micromax.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/OnePlus.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/OPPO.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/panasonic.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/samsung.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Realme.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/sharp.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/vu.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/sony.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Vivo.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Xiaomi.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Nokia.png") %>" /></div>

  <!-- DUPLICATE SET -->
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/apple.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Asus.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/blackberry.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/HTC.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/huawei.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Lg.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Micromax.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/OnePlus.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/OPPO.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/panasonic.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/samsung.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Realme.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/sharp.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/vu.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/sony.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Vivo.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Xiaomi.png") %>" /></div>
  <div class="brand-item"><img src="<%= ResolveUrl("~/Images/BrandLogo/Nokia.png") %>" /></div>
            </div>
        </div>
    </div>
</section>

</div>
</asp:Content>



