<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height:100vh;">
<div class="container text-center">
    <h2 class="mb-4">User Login</h2>
    <form action="UserLoginServlet" method="post" class="w-50 mx-auto">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" required>
        </div>
        <button type="submit" class="btn btn-dark w-100">Login</button>
    </form>

    <% if(request.getParameter("error") != null) { %>
        <div class="alert alert-danger mt-3"><%= request.getParameter("error") %></div>
    <% } %>
</div>
</body>
</html>
