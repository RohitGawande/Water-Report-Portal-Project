<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - AquaReport</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-dark: #0a3d62;
            --primary: #1e6fa3;
            --accent: #00b4d8;
            --accent-light: #90e0ef;
            --dark-bg: #152532;
            --text-light: #f8f9fa;
            --card-bg: rgba(255,255,255,0.08);
        }
        
        body {
            font-family: 'Segoe UI', 'Roboto', sans-serif;
            background: linear-gradient(135deg, var(--dark-bg) 0%, var(--primary-dark) 50%, var(--primary) 100%);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-attachment: fixed;
        }
        
        .login-container {
            width: 100%;
            max-width: 430px;
            margin: 0 auto;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 35px 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease;
        }
        
        .login-card:hover {
            transform: translateY(-5px);
        }
        
        .brand-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .brand-header i {
            font-size: 3.5rem;
            color: var(--accent);
            margin-bottom: 15px;
            display: block;
            text-shadow: 0 0 15px rgba(0, 180, 216, 0.4);
        }
        
        .brand-header h2 {
            font-weight: 700;
            color: var(--accent-light);
            margin-bottom: 5px;
        }
        
        .brand-header p {
            color: #cfd8dc;
            font-size: 0.95rem;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 10px;
            padding: 12px 15px;
            color: var(--text-light);
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            background: rgba(255, 255, 255, 0.12);
            border-color: var(--accent);
            box-shadow: 0 0 0 0.25rem rgba(0, 180, 216, 0.25);
            color: var(--text-light);
        }
        
        .form-label {
            color: var(--accent-light);
            font-weight: 500;
            margin-bottom: 8px;
        }
        
        .input-group-text {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-right: none;
            color: var(--accent);
        }
        
        .btn-login {
            background: linear-gradient(45deg, var(--accent), var(--primary));
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .btn-login:hover {
            background: linear-gradient(45deg, var(--primary), var(--accent));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .alternate-options {
            margin-top: 25px;
            text-align: center;
            color: #cfd8dc;
            font-size: 0.9rem;
        }
        
        .alternate-options a {
            color: var(--accent-light);
            text-decoration: none;
            transition: color 0.3s ease;
            font-weight: 500;
        }
        
        .alternate-options a:hover {
            color: var(--accent);
            text-decoration: underline;
        }
        
        .alert-danger {
            background: rgba(220, 53, 69, 0.2);
            border: 1px solid rgba(220, 53, 69, 0.3);
            color: #ff8a8a;
            border-radius: 10px;
            padding: 12px 15px;
            margin-top: 20px;
            backdrop-filter: blur(5px);
        }
        
        .water-wave {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 20%;
            background: url('data:image/svg+xml;utf8,<svg viewBox="0 0 1200 120" xmlns="http://www.w3.org/2000/svg" fill="rgba(10,61,98,0.3)"><path d="M0 0v46.29c47.79 22.2 103.59 32.17 158 28 70.36-5.37 136.33-33.31 206.8-37.5 73.84-4.36 147.54 16.88 218.2 35.26 69.27 18 138.3 24.88 209.4 13.08 36.15-6 69.85-17.84 104.45-29.34C989.49 25 1113-14.29 1200 52.47V0z" /></svg>');
            background-size: cover;
            background-repeat: no-repeat;
            z-index: -1;
            animation: waveAnimation 10s linear infinite;
        }
        
        @keyframes waveAnimation {
            0% {
                background-position-x: 0;
            }
            100% {
                background-position-x: 1200px;
            }
        }
        
        @media (max-width: 576px) {
            .login-card {
                padding: 25px 20px;
            }
            
            .brand-header i {
                font-size: 2.8rem;
            }
            
            .brand-header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Water wave animation at bottom -->
    <div class="water-wave"></div>
    
    <div class="login-container">
        <div class="login-card">
            <div class="brand-header">
                <i class="fas fa-tint"></i>
                <h2>User Login</h2>
                <p>Access your AquaReport account</p>
            </div>
            
            <form action="UserLoginServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" name="username" placeholder="Enter your username" required>
                    </div>
                </div>
                
                <div class="mb-4">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-login">
                    <i class="fas fa-sign-in-alt me-2"></i> Login
                </button>
            </form>

            <% if(request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-3">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <%= request.getParameter("error") %>
                </div>
            <% } %>
            
            <div class="alternate-options mt-4">
                <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                <p><a href="#">Forgot your password?</a></p>
                <p class="mt-2"><a href="index.jsp"><i class="fas fa-arrow-left me-1"></i> Back to Home</a></p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>