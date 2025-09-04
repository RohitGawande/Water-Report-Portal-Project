<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height:100vh;">
<div class="container text-center">
    <h2 class="mb-4">User Login</h2>
    <form action="userIssues.jsp" method="get" class="w-50 mx-auto">
        <div class="mb-3">
            <label class="form-label">Enter Your Username</label>
            <input type="text" class="form-control" name="username" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">View My Issues</button>
    </form>
</div>
</body>
</html>
