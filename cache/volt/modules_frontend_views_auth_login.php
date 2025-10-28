<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        background: #122430;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .container {
        background: rgba(30, 36, 46, 0.8);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 40px;
        width: 100%;
        max-width: 420px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
        border: 1px solid rgba(255, 255, 255, 0.1);
        animation: slideIn 0.5s ease-out;
    }

    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateY(30px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .logo {
        text-align: center;
        margin-bottom: 30px;
    }

    .logo-circle {
        width: 60px;
        height: 60px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 50%;
        margin: 0 auto 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 28px;
        color: white;
        animation: pulse 2s ease-in-out infinite;
    }

    @keyframes pulse {

        0%,
        100% {
            transform: scale(1);
        }

        50% {
            transform: scale(1.05);
        }
    }

    h1 {
        color: #ffffff;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 8px;
        text-align: center;
    }

    .subtitle {
        color: #a0a0b0;
        font-size: 14px;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 24px;
    }

    label {
        display: block;
        color: #e0e0e8;
        font-size: 14px;
        font-weight: 500;
        margin-bottom: 8px;
    }

    .input-wrapper {
        position: relative;
    }

    input {
        width: 100%;
        padding: 14px 16px;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        color: #ffffff;
        font-size: 15px;
        transition: all 0.3s ease;
        outline: none;
    }

    input:focus {
        background: rgba(255, 255, 255, 0.08);
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    input::placeholder {
        color: #666677;
    }

    .forgot-password {
        text-align: right;
        margin-top: 8px;
    }

    .forgot-password a {
        color: #667eea;
        text-decoration: none;
        font-size: 13px;
        transition: color 0.3s ease;
    }

    .forgot-password a:hover {
        color: #8799f3;
    }

    .submit-btn {
        width: 100%;
        padding: 14px;
        background: #2983cc;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 24px;
    }

    .submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(88, 165, 189, 0.4);
    }

    .submit-btn:active {
        transform: translateY(0);
    }

    .divider {
        display: flex;
        align-items: center;
        margin: 30px 0;
        color: #666677;
        font-size: 13px;
    }

    .divider::before,
    .divider::after {
        content: '';
        flex: 1;
        height: 1px;
        background: rgba(255, 255, 255, 0.1);
    }

    .divider::before {
        margin-right: 15px;
    }

    .divider::after {
        margin-left: 15px;
    }

    .social-login {
        display: flex;
        gap: 12px;
        margin-bottom: 24px;
    }

    .social-btn {
        flex: 1;
        padding: 12px;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        color: #ffffff;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }

    .social-btn:hover {
        background: rgba(255, 255, 255, 0.1);
        border-color: rgba(255, 255, 255, 0.2);
    }

    .signup-link {
        text-align: center;
        color: #a0a0b0;
        font-size: 14px;
        margin-top: 24px;
    }

    .signup-link a {
        color: #667eea;
        text-decoration: none;
        font-weight: 600;
        transition: color 0.3s ease;
    }

    .signup-link a:hover {
        color: #8799f3;
    }

    .checkbox-wrapper {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-top: 20px;
    }

    .checkbox-wrapper input[type="checkbox"] {
        width: 18px;
        height: 18px;
        cursor: pointer;
    }

    .checkbox-wrapper label {
        margin: 0;
        font-size: 14px;
        color: #a0a0b0;
        cursor: pointer;
    }
</style>
</head>

<body>
    <div class="container">
        <div class="logo">
            <h1>Tirta Tarum</h1>
            <p class="subtitle">GIS</p>
        </div>

        <form id="loginForm">
            <div class="form-group">
                <label for="email">Username</label>
                <div class="input-wrapper">
                    <input type="email" id="email" placeholder="Username" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <input type="password" id="password" placeholder="Password" required>
                </div>
                <!-- <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div> -->
            </div>


            <button type="submit" class="submit-btn" id="login-btn">Login</button>
        </form>

        <!-- <div class="divider">or continue with</div> -->

        <!-- <div class="social-login">
            <button class="social-btn">
                <span>🔍</span>
                Google
            </button>
            <button class="social-btn">
                <span>👤</span>
                GitHub
            </button>
        </div> -->

        <!-- <div class="signup-link">
            Don't have an account? <a href="#">Sign up</a>
        </div> -->
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function (e) {
            e.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const remember = document.getElementById('remember').checked;

            window.location = "<?= $this->url->get('/dashboard') ?>";
        });
        document.getElementById('login-btn').addEventListener('click', function (e) {
            e.preventDefault();
            window.location = "<?= $this->url->get('/dashboard') ?>";
        });
    </script>
</body>