<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #667eea, #764ba2);
            height: 100vh;
        }
        .login-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 40px;
        }
        .login-card h2 {
            font-weight: 700;
            color: #333;
        }
        .btn-dark {
            background-color: #5a3e99;
            border: none;
        }
        .btn-dark:hover {
            background-color: #452a7a;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="login-card">
                    <h2 class="text-center mb-4">Admin Login</h2>
                    <form action="AdminLoginServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Admin Name</label>
                            <input type="text" class="form-control" name="adminName" placeholder="Enter your admin name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                        </div>
                        <button type="submit" class="btn btn-dark w-100">Login</button>
                    </form>
                    <% if(request.getParameter("error") != null) { %>
                        <div class="alert alert-danger mt-3"><%= request.getParameter("error") %></div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
