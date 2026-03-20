<%@ Page Title="Signup" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="GROUP01_MP_Mockup.Pages.Auth.Signup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        @keyframes fadeIn {
            from { opacity: 0; }
            to   { opacity: 1; }
        }

        .fade-container {
            animation: fadeIn 0.6s ease forwards;
        }

        .rounded-input {
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 0 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .rounded-input:focus {
            border-color: #33CCFF;
            box-shadow: 0 0 6px rgba(51, 204, 255, 0.5);
            outline: none;
        }

        .rounded-btn {
            border-radius: 8px;
            background-color: #33CCFF;
            border: none;
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }

        .rounded-btn:hover {
            background-color: #00BBEE;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(51, 204, 255, 0.4);
        }

        .rounded-btn:active {
            transform: translateY(0);
            box-shadow: none;
        }

        .signup-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .input-error {
            border-color: #e53e3e !important;
            box-shadow: 0 0 6px rgba(229, 62, 62, 0.5) !important;
            background-color: #fff5f5;
        }
    </style>

    <div style="text-align: center" class="signup-form fade-container">
        <h1>CREATE AN ACCOUNT</h1>

        <asp:TextBox ID="txtFirstName" runat="server" Height="50px" Width="300px" placeholder="First Name" CssClass="rounded-input"></asp:TextBox>
        <asp:TextBox ID="txtLastName" runat="server" Height="50px" Width="300px" placeholder="Last Name" CssClass="rounded-input"></asp:TextBox>
        <asp:TextBox ID="txtAddress" runat="server" Height="50px" Width="300px" placeholder="Home Address" CssClass="rounded-input"></asp:TextBox>

        <asp:DropDownList ID="ddlBarangay" runat="server" Height="50px" Width="300px" CssClass="rounded-input">
            <asp:ListItem Value="" Text="--- SELECT BARANGAY ---" />
            <asp:ListItem Value="C101" Text="Baclaran" />
            <asp:ListItem Value="C102" Text="Banay-Banay" />
            <asp:ListItem Value="C103" Text="Banlic" />
            <asp:ListItem Value="C104" Text="Bigaa" />
            <asp:ListItem Value="C105" Text="Butong" />
            <asp:ListItem Value="C106" Text="Casile" />
            <asp:ListItem Value="C107" Text="Diezmo" />
            <asp:ListItem Value="C108" Text="Gulod" />
            <asp:ListItem Value="C109" Text="Mamatid" />
            <asp:ListItem Value="C110" Text="Marinig" />
            <asp:ListItem Value="C111" Text="Niugan" />
            <asp:ListItem Value="C112" Text="Pulo" />
            <asp:ListItem Value="C113" Text="Sala" />
            <asp:ListItem Value="C114" Text="San Isidro" />
            <asp:ListItem Value="C115" Text="Barangay Uno" />
            <asp:ListItem Value="C116" Text="Barangay Dos" />
            <asp:ListItem Value="C117" Text="Barangay Tres" />
        </asp:DropDownList>

        <asp:TextBox ID="txtPassword" runat="server" Height="50px" Width="300px" placeholder="Password" TextMode="Password" CssClass="rounded-input"></asp:TextBox>
        <asp:TextBox ID="txtConfirmPassword" runat="server" Height="50px" placeholder="Confirm Password" Width="300px" TextMode="Password" CssClass="rounded-input"></asp:TextBox>

        <asp:Label ID="lblSignupMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:Button ID="btnSignup" runat="server" Height="50px" Text="Sign Up" Width="300px" OnClick="btnSignup_Click" OnClientClick="return validateForm()" CssClass="rounded-btn" />

        <p>Got an existing account? <a href="Login.aspx">Login</a></p>
    </div>

    <script>
        function validateForm() {
            var fieldIds = [
            '<%= txtFirstName.ClientID %>',
            '<%= txtLastName.ClientID %>',
            '<%= txtAddress.ClientID %>',
            '<%= txtPassword.ClientID %>',
            '<%= txtConfirmPassword.ClientID %>'
            ];

            var isValid = true;

            fieldIds.forEach(function (id) {
                var el = document.getElementById(id);
                if (!el) return;

                el.classList.remove('input-error');
                void el.offsetWidth;

                if (el.value.trim() === '') {
                    el.classList.add('input-error');
                    isValid = false;

                    el.addEventListener('input', function () {
                        if (el.value.trim() !== '') {
                            el.classList.remove('input-error');
                        }
                    }, { once: true });
                }
            });

            var lbl = document.getElementById('<%= lblSignupMessage.ClientID %>');
            if (lbl) {
                if (!isValid) {
                    lbl.innerText = 'Please fill in all required fields.';
                    lbl.style.display = 'inline';
                } else {
                    lbl.style.display = 'none';
                }
            }

            var ddl = document.getElementById('<%= ddlBarangay.ClientID %>');
            if (ddl) {
                ddl.classList.remove('input-error');
                if (ddl.value === '') {
                    ddl.classList.add('input-error');
                    isValid = false;

                    ddl.addEventListener('change', function () {
                        if (ddl.value !== '') {
                            ddl.classList.remove('input-error');
                        }
                    }, { once: true });
                }
            }

            return isValid;
        }
    </script>

</asp:Content>