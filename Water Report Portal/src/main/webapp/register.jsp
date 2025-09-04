<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
body {
    font-family: 'Segoe UI', sans-serif;
    margin: 0;
    background: linear-gradient(135deg, #152532 0%, #1e6fa3 100%);
    color: #f8f9fa;
}

.container {
    max-width: 450px;
    margin: 80px auto;
    padding: 30px;
    background: rgba(255,255,255,0.08);
    border-radius: 15px;
    text-align: center;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.1);
}

.container h2 {
    margin-bottom: 20px;
    color: #00d2ff;
}

.container form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.container input {
    padding: 12px;
    border-radius: 8px;
    border: none;
    outline: none;
}

.container button {
    padding: 12px;
    border-radius: 50px;
    border: none;
    background: linear-gradient(45deg, #4cc9f0, #4361ee);
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.container button:hover {
    transform: translateY(-2px);
}

.container a {
    color: #00d2ff;
    text-decoration: none;
    font-size: 0.9rem;
}

.container a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

<div class="container">
    <h2>User Registration</h2>
    <form action="RegisterServlet" method="post">
        <input type="text" name="fullname" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
        <button type="submit"><i class="fas fa-user-plus"></i> Register</button>
    </form>
    <p>Already have an account? <a href="userLogin.jsp">Login here</a></p>
</div>

</body>
</html>
