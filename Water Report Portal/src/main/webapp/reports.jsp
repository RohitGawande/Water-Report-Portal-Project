<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reports - AquaReport</title>
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
        --transition: all 0.3s ease;
    }

    body {
        margin: 0;
        font-family: 'Segoe UI', 'Roboto', sans-serif;
        background: linear-gradient(135deg, var(--dark-bg) 0%, var(--primary-dark) 50%, var(--primary) 100%);
        color: var(--text-light);
        line-height: 1.6;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
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
    .navbar .brand { font-size: 1.8rem; color: var(--accent-light); text-decoration: none; display: flex; align-items: center; gap: 10px; }
    .navbar .brand i { font-size:2rem; color: var(--accent); }
    .navbar .nav-links { display:flex; gap:25px; }
    .navbar .nav-links a { color: var(--text-light); text-decoration:none; font-weight:500; transition: var(--transition); }
    .navbar .nav-links a:hover { color: var(--accent); }

    /* Reports Section */
    .reports-container {
        max-width: 1100px;
        margin: 50px auto;
        padding: 0 20px;
    }

    h1 {
        text-align: center;
        font-size: 2.5rem;
        margin-bottom: 40px;
        color: var(--accent-light);
    }

    .reports-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 25px;
    }

    .report-card {
        background: var(--card-bg);
        border-radius: 20px;
        padding: 20px;
        border: 1px solid rgba(255,255,255,0.1);
        backdrop-filter: blur(10px);
        transition: var(--transition);
        position: relative;
    }

    .report-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.2);
    }

    .report-card h3 {
        color: var(--accent-light);
        margin-bottom: 15px;
        font-size: 1.4rem;
    }

    .report-card p {
        color: #cfd8dc;
        font-size: 1rem;
        margin-bottom: 10px;
    }

    .report-card .status {
        font-weight: bold;
        padding: 5px 12px;
        border-radius: 12px;
        display: inline-block;
        font-size: 0.9rem;
    }

    .status-pending { background: #f39c12; color: #fff; }
    .status-inprogress { background: #3498db; color: #fff; }
    .status-resolved { background: #2ecc71; color: #fff; }

    /* Footer */
    footer {
        background: rgba(0,0,0,0.4);
        text-align:center;
        padding:30px;
        color:#b0bec5;
        margin-top:auto;
        backdrop-filter: blur(5px);
    }

    @media(max-width:768px){ h1 { font-size:2rem; } .report-card { padding: 15px; } }
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <a href="index.jsp" class="brand"><i class="fas fa-tint"></i> AquaReport</a>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
        <a href="faq.jsp">FAQ</a>
        <a href="reports.jsp">Reports</a>
    </div>
</div>

<!-- Reports Section -->
<div class="reports-container">
    <h1>Water Quality Reports</h1>

    <div class="reports-grid">
        <!-- Example Report Card -->
        <div class="report-card">
            <h3>Leakage in Main Pipe</h3>
            <p><strong>Location:</strong> Sector 21, City</p>
            <p><strong>Date:</strong> 01-Sep-2025</p>
            <p class="status status-pending">Pending</p>
        </div>

        <div class="report-card">
            <h3>Contaminated Water Supply</h3>
            <p><strong>Location:</strong> Riverside Area</p>
            <p><strong>Date:</strong> 28-Aug-2025</p>
            <p class="status status-inprogress">In Progress</p>
        </div>

        <div class="report-card">
            <h3>Water Discoloration</h3>
            <p><strong>Location:</strong> Downtown</p>
            <p><strong>Date:</strong> 25-Aug-2025</p>
            <p class="status status-resolved">Resolved</p>
        </div>

        <!-- Add more report cards here dynamically via JSP/Servlet -->
    </div>
</div>

<!-- Footer -->
<footer>
    © 2025 AquaReport | Designed by Rohit Gawande (B.Tech CSE)
</footer>

</body>
</html>
