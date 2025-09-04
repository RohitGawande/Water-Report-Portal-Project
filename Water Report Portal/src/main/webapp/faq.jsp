<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ - AquaReport</title>
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

    /* FAQ Section */
    .faq-container {
        max-width: 900px;
        margin: 50px auto;
        padding: 0 20px;
    }

    h1 { text-align: center; font-size: 2.5rem; margin-bottom: 40px; color: var(--accent-light); }

    .faq-item {
        background: var(--card-bg);
        border-radius: 15px;
        padding: 20px 25px;
        margin-bottom: 20px;
        cursor: pointer;
        transition: var(--transition);
        border: 1px solid rgba(255,255,255,0.1);
    }

    .faq-item:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(0,0,0,0.2); }

    .faq-item h3 { margin:0; font-size:1.3rem; display:flex; justify-content:space-between; align-items:center; }
    .faq-item h3 i { transition: var(--transition); }

    .faq-item p { display:none; margin-top:15px; color:#cfd8dc; font-size:1rem; }

    /* Footer */
    footer {
        background: rgba(0,0,0,0.4);
        text-align:center;
        padding:30px;
        color:#b0bec5;
        margin-top:auto;
        backdrop-filter: blur(5px);
    }

    /* Responsive */
    @media(max-width:768px){ h1 { font-size:2rem; } .faq-item { padding:15px 20px; } }
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

<!-- FAQ Section -->
<div class="faq-container">
    <h1>Frequently Asked Questions</h1>

    <div class="faq-item">
        <h3>How do I report a water issue? <i class="fas fa-chevron-down"></i></h3>
        <p>Login as a user, navigate to the “Report Issue” section, and fill out the form with details about the water problem.</p>
    </div>

    <div class="faq-item">
        <h3>Who verifies the reports? <i class="fas fa-chevron-down"></i></h3>
        <p>All reports are verified by our quality assurance team before they are marked as resolved.</p>
    </div>

    <div class="faq-item">
        <h3>Can I track my report status? <i class="fas fa-chevron-down"></i></h3>
        <p>Yes, you can track the status of your reports in real-time via the “My Reports” dashboard.</p>
    </div>

    <div class="faq-item">
        <h3>Do I need an account to submit a report? <i class="fas fa-chevron-down"></i></h3>
        <p>Yes, you need to register as a user to submit and track reports.</p>
    </div>

    <div class="faq-item">
        <h3>Is the system free to use? <i class="fas fa-chevron-down"></i></h3>
        <p>Yes, AquaReport is completely free for all users in the community.</p>
    </div>
</div>

<!-- Footer -->
<footer>
    © 2025 AquaReport | Designed by Rohit Gawande (B.Tech CSE)
</footer>

<script>
    // Toggle FAQ answers
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        item.addEventListener('click', () => {
            const open = item.querySelector('p');
            const icon = item.querySelector('i');
            if(open.style.display === 'block'){
                open.style.display = 'none';
                icon.style.transform = 'rotate(0deg)';
            } else {
                open.style.display = 'block';
                icon.style.transform = 'rotate(180deg)';
            }
        });
    });
</script>

</body>
</html>
