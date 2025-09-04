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
        --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', 'Roboto', sans-serif;
        background: linear-gradient(135deg, var(--dark-bg) 0%, var(--primary-dark) 50%, var(--primary) 100%);
        color: var(--text-light);
        line-height: 1.6;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        background-attachment: fixed;
    }

    /* Animated Background Elements */
    .bg-bubbles {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        overflow: hidden;
        pointer-events: none;
    }

    .bg-bubbles li {
        position: absolute;
        list-style: none;
        display: block;
        width: 40px;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.1);
        bottom: -160px;
        border-radius: 50%;
        animation: square 25s infinite;
        transition-timing-function: linear;
    }

    .bg-bubbles li:nth-child(1) {
        left: 10%;
        animation-delay: 0s;
        width: 80px;
        height: 80px;
    }

    .bg-bubbles li:nth-child(2) {
        left: 20%;
        animation-delay: 2s;
        animation-duration: 17s;
    }

    .bg-bubbles li:nth-child(3) {
        left: 25%;
        animation-delay: 4s;
    }

    .bg-bubbles li:nth-child(4) {
        left: 40%;
        animation-delay: 0s;
        animation-duration: 22s;
        width: 60px;
        height: 60px;
    }

    .bg-bubbles li:nth-child(5) {
        left: 70%;
        animation-delay: 3s;
    }

    .bg-bubbles li:nth-child(6) {
        left: 80%;
        animation-delay: 2s;
        width: 120px;
        height: 120px;
    }

    .bg-bubbles li:nth-child(7) {
        left: 32%;
        animation-delay: 6s;
        width: 160px;
        height: 160px;
    }

    .bg-bubbles li:nth-child(8) {
        left: 55%;
        animation-delay: 8s;
        animation-duration: 18s;
        width: 20px;
        height: 20px;
    }

    .bg-bubbles li:nth-child(9) {
        left: 25%;
        animation-delay: 2s;
        animation-duration: 20s;
        width: 10px;
        height: 10px;
    }

    .bg-bubbles li:nth-child(10) {
        left: 90%;
        animation-delay: 11s;
        width: 60px;
        height: 60px;
    }

    @keyframes square {
        0% {
            transform: translateY(0) rotate(0deg);
            opacity: 0.5;
        }
        100% {
            transform: translateY(-1000px) rotate(720deg);
            opacity: 0;
        }
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
        backdrop-filter: blur(10px);
    }

    .navbar .brand {
        font-size: 1.8rem;
        font-weight: 800;
        color: var(--accent-light);
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: var(--transition);
    }

    .navbar .brand:hover {
        transform: scale(1.05);
    }

    .navbar .brand i {
        font-size: 2rem;
        color: var(--accent);
        transition: var(--transition);
    }

    .navbar .brand:hover i {
        transform: rotate(15deg);
    }

    .navbar .nav-links {
        display: flex;
        gap: 25px;
    }

    .navbar .nav-links a {
        color: var(--text-light);
        text-decoration: none;
        font-weight: 500;
        position: relative;
        padding: 5px 0;
        transition: var(--transition);
    }

    .navbar .nav-links a::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: var(--accent);
        transition: var(--transition);
    }

    .navbar .nav-links a:hover {
        color: var(--accent);
    }

    .navbar .nav-links a:hover::after {
        width: 100%;
    }

    /* Hero Section */
    .hero {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 100px 5% 60px;
        position: relative;
        overflow: hidden;
    }

    .hero-content {
        max-width: 900px;
        z-index: 2;
    }

    .water-drop {
        position: relative;
        display: inline-block;
        margin-bottom: 30px;
    }

    .water-drop i {
        font-size: 6rem;
        color: #00d2ff;
        text-shadow: 0 0 20px rgba(0, 210, 255, 0.5);
        animation: drip 3s infinite ease-in-out;
    }

    @keyframes drip {
        0%, 100% {
            transform: translateY(0) scale(1);
        }
        50% {
            transform: translateY(10px) scale(1.05);
        }
    }

    .hero h1 {
        font-size: 3.2rem;
        margin-bottom: 20px;
        background: linear-gradient(to right, var(--accent-light), var(--accent));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: fadeInUp 1s ease-out;
    }

    .hero p {
        max-width: 700px;
        color: #cfd8dc;
        margin-bottom: 40px;
        font-size: 1.2rem;
        animation: fadeInUp 1s ease-out 0.2s both;
    }

    .btn-container {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
        justify-content: center;
        margin-bottom: 60px;
        animation: fadeInUp 1s ease-out 0.4s both;
    }

    .btn-custom {
        padding: 14px 32px;
        border-radius: 50px;
        font-weight: 600;
        border: none;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        position: relative;
        overflow: hidden;
    }

    .btn-custom::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: 0.5s;
    }

    .btn-custom:hover::before {
        left: 100%;
    }

    .btn-user { 
        background: linear-gradient(45deg, var(--accent-light), #ffffff);
        color: var(--primary-dark);
    }
    .btn-user:hover { 
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(144, 224, 239, 0.4);
    }

    .btn-admin { 
        background: linear-gradient(45deg, var(--primary), var(--primary-dark)); 
        color: white; 
    }
    .btn-admin:hover { 
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(30, 111, 163, 0.4);
    }

    .btn-register { 
        background: linear-gradient(45deg, #4cc9f0, #4361ee); 
        color: white; 
    }
    .btn-register:hover { 
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(67, 97, 238, 0.4);
    }

    /* Features */
    .features {
        display: flex;
        justify-content: center;
        gap: 30px;
        flex-wrap: wrap;
        margin-top: 30px;
        animation: fadeInUp 1s ease-out 0.6s both;
    }

    .feature-card {
        background: var(--card-bg);
        padding: 30px 25px;
        border-radius: 20px;
        width: 280px;
        text-align: center;
        border: 1px solid rgba(255,255,255,0.1);
        backdrop-filter: blur(10px);
        transition: var(--transition);
        position: relative;
        overflow: hidden;
    }

    .feature-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: linear-gradient(to right, var(--accent-light), var(--accent));
        transform: scaleX(0);
        transform-origin: left;
        transition: transform 0.5s ease;
    }

    .feature-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }

    .feature-card:hover::before {
        transform: scaleX(1);
    }

    .feature-card i {
        font-size: 2.8rem;
        color: var(--accent);
        margin-bottom: 20px;
        transition: var(--transition);
    }

    .feature-card:hover i {
        transform: scale(1.2);
    }

    .feature-card h3 {
        color: var(--accent-light);
        margin-bottom: 15px;
        font-size: 1.4rem;
    }

    .feature-card p { 
        color: #cfd8dc; 
        font-size: 1rem; 
    }

    /* Footer */
    footer {
        background: rgba(0,0,0,0.4);
        text-align: center;
        padding: 30px;
        color: #b0bec5;
        margin-top: auto;
        backdrop-filter: blur(5px);
    }

    /* Animations */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Responsive Design */
    @media(max-width: 992px){
        .navbar .nav-links {
            gap: 15px;
        }
        
        .navbar .nav-links a {
            font-size: 0.9rem;
        }
    }

    @media(max-width: 768px){
        .navbar {
            flex-direction: column;
            padding: 15px;
        }
        
        .navbar .nav-links {
            margin-top: 15px;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
        }
        
        .hero h1 { 
            font-size: 2.5rem; 
        }
        
        .hero p { 
            font-size: 1.1rem; 
        }
        
        .btn-container {
            flex-direction: column;
            align-items: center;
        }
        
        .btn-custom {
            width: 250px;
            justify-content: center;
        }
        
        .features { 
            gap: 20px; 
        }
        
        .feature-card { 
            width: 100%; 
            max-width: 300px; 
        }
        
        .water-drop i {
            font-size: 5rem;
        }
    }

    @media(max-width: 480px){
        .hero h1 { 
            font-size: 2rem; 
        }
        
        .hero p {
            font-size: 1rem;
        }
        
        .navbar .brand {
            font-size: 1.5rem;
        }
        
        .navbar .brand i {
            font-size: 1.7rem;
        }
        
        .water-drop i {
            font-size: 4rem;
        }
    }
</style>
</head>
<body>

<!-- Animated Background -->
<ul class="bg-bubbles">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>

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
    <div class="hero-content">
        <div class="water-drop">
            <i class="fas fa-tint"></i>
        </div>
        <h1>Water Quality Management System</h1>
        <p>An enterprise solution for monitoring, reporting, and resolving water quality issues in communities.</p>
        
        <div class="btn-container">
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
</div>

<!-- Footer -->
<footer>
    © 2025 AquaReport | Designed by Rohit Gawande (B.Tech CSE) 
</footer>

</body>
</html>