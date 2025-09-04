<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - AquaReport</title>
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
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-attachment: fixed;
        }
        
        .contact-container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .contact-header i {
            font-size: 4rem;
            color: var(--accent);
            margin-bottom: 20px;
            text-shadow: 0 0 20px rgba(0, 180, 216, 0.4);
        }
        
        .contact-header h1 {
            font-weight: 700;
            color: var(--accent-light);
            margin-bottom: 10px;
        }
        
        .contact-header p {
            color: #cfd8dc;
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .contact-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease;
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
        }
        
        .developer-info {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .developer-info h2 {
            color: var(--accent-light);
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .developer-info p {
            color: #cfd8dc;
            font-size: 1.1rem;
        }
        
        .contact-methods {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }
        
        .contact-method {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 25px;
            width: 100%;
            max-width: 350px;
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .contact-method:hover {
            background: rgba(255, 255, 255, 0.12);
            transform: translateY(-5px);
        }
        
        .contact-method i {
            font-size: 2.5rem;
            color: var(--accent);
            margin-bottom: 20px;
        }
        
        .contact-method h3 {
            color: var(--accent-light);
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        .contact-method p, .contact-method a {
            color: #cfd8dc;
            font-size: 1.05rem;
            margin-bottom: 0;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .contact-method a:hover {
            color: var(--accent);
            text-decoration: underline;
        }
        
        .back-to-home {
            text-align: center;
            margin-top: 40px;
        }
        
        .back-to-home a {
            color: var(--accent-light);
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: color 0.3s ease;
        }
        
        .back-to-home a:hover {
            color: var(--accent);
            text-decoration: underline;
        }
        
        .back-to-home i {
            margin-right: 8px;
        }
        
        .water-drops {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }
        
        .water-drop {
            position: absolute;
            width: 20px;
            height: 20px;
            background: rgba(144, 224, 239, 0.3);
            border-radius: 50%;
            animation: drop 7s infinite ease-in-out;
        }
        
        .water-drop:nth-child(1) {
            top: 10%;
            left: 20%;
            animation-delay: 0s;
        }
        
        .water-drop:nth-child(2) {
            top: 20%;
            left: 80%;
            animation-delay: 1s;
        }
        
        .water-drop:nth-child(3) {
            top: 60%;
            left: 10%;
            animation-delay: 2s;
        }
        
        .water-drop:nth-child(4) {
            top: 70%;
            left: 70%;
            animation-delay: 3s;
        }
        
        .water-drop:nth-child(5) {
            top: 40%;
            left: 50%;
            animation-delay: 4s;
        }
        
        @keyframes drop {
            0%, 100% {
                transform: translateY(0) scale(1);
                opacity: 0.5;
            }
            50% {
                transform: translateY(-30px) scale(1.1);
                opacity: 0.8;
            }
        }
        
        @media (max-width: 768px) {
            .contact-methods {
                flex-direction: column;
                align-items: center;
            }
            
            .contact-method {
                width: 100%;
            }
            
            .contact-header h1 {
                font-size: 2rem;
            }
            
            .contact-header i {
                font-size: 3rem;
            }
        }
    </style>
</head>
<body>
    <!-- Animated water drops -->
    <div class="water-drops">
        <div class="water-drop"></div>
        <div class="water-drop"></div>
        <div class="water-drop"></div>
        <div class="water-drop"></div>
        <div class="water-drop"></div>
    </div>
    
    <div class="contact-container">
        <div class="contact-header">
            <i class="fas fa-envelope"></i>
            <h1>Contact Us</h1>
            <p>Get in touch with the developer of AquaReport</p>
        </div>
        
        <div class="contact-card">
            <div class="developer-info">
                <h2>Rohit Gawande</h2>
                <p>B.Tech Computer Science & Engineering</p>
                <p>AquaReport Project Developer</p>
            </div>
            
            <div class="contact-methods">
                <div class="contact-method">
                    <i class="fab fa-linkedin"></i>
                    <h3>LinkedIn</h3>
                    <a href="https://www.linkedin.com/in/rohit-gawande-b079192a9/" target="_blank">
                        linkedin.com/in/rohit-gawande
                    </a>
                </div>
                
                <div class="contact-method">
                    <i class="fas fa-envelope"></i>
                    <h3>Email</h3>
                    <a href="mailto:rohitgawande2004@gmail.com">
                        rohitgawande2004@gmail.com
                    </a>
                </div>
            </div>
        </div>
        
        <div class="back-to-home">
            <a href="index.jsp">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>