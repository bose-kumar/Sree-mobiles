<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sri_Mobiles.Login" %>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sri Mobile | Admin Login</title>
    <link rel="icon" type="image/png" href="../Images/Icon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        * {
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #111111, #FFC107);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-box {
            background: #fff;
            width: 100%;
            max-width: 460px;
            padding: 40px 120px;
            border-radius: 18px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.35);
            text-align: center;
        }

       
        .logo img {
            width: 85px;
            margin-bottom: 15px;
        }

        .brand {
            font-size: 26px;
            font-weight: 700;
            background: linear-gradient( #111111, #F4B400, #FFC107);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 5px;
        }

        .subtitle {
            font-size: 14px;
            color: #777;
            margin-bottom: 30px;
        }

        h2 {
            font-size: 22px;
            color: #222;
            margin-bottom: 25px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 22px;
        }

        label {

            font-size: 14px;
            color: black;
        }

        .input-control {
            width: 100%;
            padding: 15px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 15px;
            transition: 0.3s;
        }

        .input-control:focus {
            outline: none;
            border-color: #FFC107;
            box-shadow: 0 0 0 2px rgba(255,193,7,0.25);
        }

        .login-btn {
            width: 100%;
            padding: 15px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            font-size: 17px;
            font-weight: 600;
            color: #111;
            background: linear-gradient(to right, #F4B400, #FFC107);
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        .msg {
            margin-top: 15px;
            color: red;
            font-size: 14px;
        }

        /* 📱 Mobile */
        @media (max-width: 480px) {
            .login-box {
                padding: 30px 22px;
            }

            .brand {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="login-box">

        <div class="logo">
            <img src="../Images/Icon.png" alt="Sri Mobile Logo" />
        </div>

        <div class="brand">Sri Mobile</div>
        <div class="subtitle">Admin Panel </div>

        <h2>Admin Login</h2>

        <div class="form-group">
            <label>Username</label>
            <asp:TextBox ID="txtUsername" runat="server"
                CssClass="input-control"
                Placeholder="Enter admin username"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input-control"
                TextMode="Password"
                Placeholder="Enter password"></asp:TextBox>
        </div>

        <asp:Button 
            ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-btn"
            OnClick="lnkLogin_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

    </div>

</form>
</body>
</html>
