<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Sri_Mobiles.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
   <!-- ================= INTERNAL CSS (CONTACT PAGE ONLY) ================= -->
 <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8fafc;
            color: #111827;
        }

        /* ================= CONTACT SECTION ================= */
        .contact-section {
            padding: 10px 0;
        }

        .contact-section h2 {
            font-weight: 700;
            color: #2a1f1f;
        }

        /* ================= CONTACT INFO CARD ================= */
        .contact-info-card {
            background: #ffffff;
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .contact-item {
            display: flex;
            gap: 16px;
            margin-bottom: 22px;
        }

        .contact-item i {
            font-size: 22px;
            color: #0c0c0c;
            margin-top: 4px;
        }

        .contact-item strong {
            display: block;
            font-size: 15px;
            margin-bottom: 4px;
        }

        .contact-item a {
            color: #374151;
            font-weight: 600;
            text-decoration: none;
        }

        .contact-item a:hover {
            color: #eab308;
            text-decoration: underline;
        }

        /* ================= FORM ================= */
        .form-control {
            border-radius: 8px;
            padding: 12px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .form-control:focus {
            border-color: #facc15;
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .btn-submit {
            background: #facc15;
            border: none;
            font-weight: 700;
        }

        .btn-submit:hover {
            background: #eab308;
        }

        /* ================= MAP ================= */
        .map-animate {
            opacity: 0;
            transform: translateX(80px);
            animation: mapReveal 1.2s ease forwards;
            animation-delay: 0.3s;
        }

        @keyframes mapReveal {
            from {
                opacity: 0;
                transform: translateX(80px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .map-cover {
            height: 100%;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .map-cover h3 {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 15px;
            color: #2a1f1f;
        }

        .map-cover iframe {
            width: 100%;
            height: 93%;
            min-height: 320px;
            border-radius: 14px;
            border: none;
        }

        /* ================= MOBILE ================= */
        @media (max-width: 768px) {
            .map-cover iframe {
                min-height: 260px;
            }

            .map-cover {
                margin-top: 40px;
            }
        }
    </style>

    <!-- ================= CONTACT SECTION ================= -->
    <section class="container contact-section">

        <h2 class="text-center mb-5">Contact Us</h2>

        <div class="row align-items-stretch">

            <!-- LEFT SIDE -->
            <div class="col-md-7">

                <!-- CONTACT INFO -->
                <div class="contact-info-card mb-4">

                    <div class="contact-item">
                        <i class="fa fa-location-dot"></i>
                        <div>
                            <strong>Address</strong>
                            <a href="https://www.google.com/maps/search/?api=1&query=Puthiragoundanpalayam"
                               target="_blank">Puthiragoundanpalayam</a>
                        </div>
                    </div>

                    <div class="contact-item">
                        <i class="fa fa-phone"></i>
                        <div>
                            <a href="tel:+919965808071">99658 08071</a> ,
                            <a href="tel:+919445441016">94454 41016</a>
                        </div>
                    </div>

                    <div class="contact-item">
                        <i class="fa fa-envelope"></i>
                        <div>
                            <strong>Email</strong>
                            <a href="mailto:srisystemspgp@gmail.com">srisystemspgp@gmail.com</a>
                        </div>
                    </div>

                </div>

                <!-- CONTACT FORM -->
                <asp:Panel runat="server">
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="form-control mb-3"
                        Placeholder="Your Name" />

                    <asp:TextBox ID="txtEmail" runat="server"
                        CssClass="form-control mb-3"
                        TextMode="Email"
                        Placeholder="Your Email" />

                    <asp:TextBox ID="txtMessage" runat="server"
                        CssClass="form-control mb-3"
                        TextMode="MultiLine"
                        Rows="4"
                        Placeholder="Message" />

                    <asp:Button ID="btnSend" runat="server"
                        CssClass="btn btn-submit w-100"
                        Text="Send Message" />
                </asp:Panel>

            </div>

            <!-- RIGHT SIDE : MAP -->
            <div class="col-md-5">
                <div class="map-cover map-animate">
                    <h3>Our Location</h3>

                    <iframe src="https://www.google.com/maps?q=Puthiragoundanpalayam&output=embed"
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>

        </div>
    </section>

</asp:Content>





