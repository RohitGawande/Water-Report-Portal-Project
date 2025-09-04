<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Me - Rohit Gawande</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .about-card {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
            padding: 40px;
            max-width: 600px;
            text-align: center;
        }
        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 4px solid #6c63ff;
        }
        h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }
        p {
            font-size: 1rem;
            color: #555;
        }
        .skills span {
            background-color: #6c63ff;
            color: #fff;
            padding: 6px 12px;
            border-radius: 12px;
            margin: 5px 5px 0 0;
            display: inline-block;
            font-size: 0.9rem;
        }
        .future-skills {
            margin-top: 20px;
            font-style: italic;
            color: #444;
        }
    </style>
</head>
<body>
    <div class="about-card">
        <!-- Profile Image (Optional) -->
        <img src="assets/profile.jpg" alt="Rohit Gawande" class="profile-img">
        
        <h2>Rohit Gawande</h2>
        <p><strong>Education:</strong> B.Tech in Computer Science and Engineering, 2025 Passout</p>
        <p><strong>Skills:</strong></p>
        <div class="skills">
            <span>Core Java</span>
            <span>JDBC</span>
            <span>Servlet</span>
            <span>JSP</span>
            <span>Frontend Development</span>
        </div>
        <p class="future-skills">
            Currently learning Hibernate. Planning to explore Spring Boot and advance backend development.
        </p>
    </div>
</body>
</html>
