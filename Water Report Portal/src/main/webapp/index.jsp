<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Water Report Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Water Report Portal</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="submitIssue.jsp">Report Issue</a></li>
        <li class="nav-item"><a class="nav-link" href="viewIssues.jsp">View Issues</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
    <div class="text-center">
        <h1 class="mb-3">Welcome to Water Report Portal</h1>
        <p class="lead">Easily report and track water-related issues in your area.</p>
        <a href="submitIssue.jsp" class="btn btn-success btn-lg">Report an Issue</a>
        <a href="viewIssues.jsp" class="btn btn-info btn-lg">View Reported Issues</a>
    </div>
</div>

</body>
</html>
