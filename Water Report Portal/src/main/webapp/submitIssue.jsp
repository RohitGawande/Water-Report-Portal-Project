<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Issue - Water Report Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Water Report Portal</a>
  </div>
</nav>

<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-success text-white">
            <h4>Report a Water Issue</h4>
        </div>
        <div class="card-body">
            <form action="submitIssue" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Your Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Location</label>
                    <input type="text" name="location" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Issue Description</label>
                    <textarea name="description" class="form-control" rows="4" required></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Upload Image (Optional)</label>
                    <input type="file" name="image" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Submit Report</button>
                <a href="index.jsp" class="btn btn-secondary">Back</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>
