<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Water Quality Management System</title>
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
    margin: 0;
    font-family: 'Segoe UI', 'Roboto', sans-serif;
    background: linear-gradient(135deg, var(--dark-bg) 0%, var(--primary-dark) 50%, var(--primary) 100%);
    color: var(--text-light);
}

/* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 5%;
    background-color: rgba(10,61,98,0.95);
    box-shadow: 0 4px 20px rgba(0,0,0,0.25);
    position: sticky;
    top: 0;
    z-index: 1000;
    flex-wrap: wrap;
}

.navbar .brand {
    font-size: 1.8rem;
    font-weight: 800;
    color: var(--accent-light);
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 10px;
}

.navbar .brand i {
    font-size: 2rem;
    color: var(--accent);
}

.navbar .nav-links {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.navbar .nav-links a {
    color: var(--text-light);
    text-decoration: none;
    font-weight: 500;
}

.navbar .nav-links a:hover {
    color: var(--accent);
}

/* Hero Section */
.hero {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 100px 5% 60px;
}

.hero i {
    font-size: 6rem;
    color: #00d2ff;
    margin-bottom: 20px;
}

.hero h1 {
    font-size: 3rem;
    margin-bottom: 20px;
    background: linear-gradient(to right, var(--accent-light), var(--accent));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.hero p {
    max-width: 700px;
    color: #cfd8dc;
    margin-bottom: 40px;
}

.btn-custom {
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 600;
    margin: 5px;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-user { background: linear-gradient(45deg, var(--accent-light), #ffffff); color: var(--primary-dark);}
.btn-user:hover { transform: translateY(-3px); }

.btn-admin { background: linear-gradient(45deg, var(--primary), var(--primary-dark)); color: white; }
.btn-admin:hover { transform: translateY(-3px); }

.btn-register { background: linear-gradient(45deg, #4cc9f0, #4361ee); color: white; }
.btn-register:hover { transform: translateY(-3px); }

/* Features */
.features {
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
    margin-top: 50px;
}

.feature-card {
    background: var(--card-bg);
    padding: 25px;
    border-radius: 15px;
    width: 250px;
    text-align: center;
    border: 1px solid rgba(255,255,255,0.1);
}

.feature-card i {
    font-size: 2.5rem;
    color: var(--accent);
    margin-bottom: 15px;
}

.feature-card h3 {
    color: var(--accent-light);
    margin-bottom: 10px;
}

.feature-card p { color: #cfd8dc; font-size: 0.95rem; }

/* Footer */
footer {
    background: rgba(0,0,0,0.4);
    text-align: center;
    padding: 30px;
    color: #b0bec5;
}

@media(max-width:768px){
    .hero h1 { font-size: 2.2rem; }
    .hero p { font-size: 1rem; }
    .features { gap: 20px; }
    .feature-card { width: 100%; max-width: 300px; }
    .navbar { flex-direction: column; gap: 10px; }
    .navbar .nav-links { flex-direction: column; align-items: center; gap: 10px; }
}
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <a href="#" class="brand"><i class="fas fa-tint"></i> AquaReport</a>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
        <a href="faq.jsp">FAQ</a>
        <a href="reports.jsp">Reports</a>
    </div>
</div>

<!-- Hero Section -->
<div class="hero">
    <i class="fas fa-tint"></i>
    <h1>Water Quality Management System</h1>
    <p>An enterprise solution for monitoring, reporting, and resolving water quality issues in communities.</p>
    
    <div>
        <a href="userLogin.jsp" class="btn-custom btn-user"><i class="fas fa-user"></i> User Login</a>
        <a href="adminLogin.jsp" class="btn-custom btn-admin"><i class="fas fa-lock"></i> Admin Portal</a>
        <a href="register.jsp" class="btn-custom btn-register"><i class="fas fa-user-plus"></i> Register</a>
    </div>

    <div class="features">
        <div class="feature-card">
            <i class="fas fa-bullhorn"></i>
            <h3>Report Issues</h3>
            <p>Quickly report water quality problems in your area.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-chart-line"></i>
            <h3>Track Progress</h3>
            <p>Monitor the status of your reported issues in real-time.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-shield-alt"></i>
            <h3>Verified Data</h3>
            <p>All reports are verified by our quality assurance team.</p>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    © 2025 AquaReport | Designed by Rohit Gawande (B.Tech CSE)
</footer>

</body>
</html>
