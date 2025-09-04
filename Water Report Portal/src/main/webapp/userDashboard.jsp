<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Welcome, <%= session.getAttribute("username") %></h2>

    <h4>Submit New Issue</h4>
    <form action="UserIssueServlet" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Location</label>
            <input type="text" class="form-control" name="location" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Upload Image</label>
            <input type="file" class="form-control" name="image">
        </div>
        <button type="submit" class="btn btn-success">Submit Issue</button>
    </form>

    <hr>

    <h4>Your Reported Issues</h4>
    <table class="table table-bordered mt-3 align-middle">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Location</th>
                <th>Description</th>
                <th>Image</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
            com.rohitgawande.waterquality.dao.IssueDAO dao = new com.rohitgawande.waterquality.dao.IssueDAO();
            java.util.List<com.rohitgawande.waterquality.model.Issue> userIssues = 
                dao.getIssuesByUsername((String)session.getAttribute("username"));
            for(com.rohitgawande.waterquality.model.Issue issue : userIssues) {
            %>
            <tr>
                <td><%= issue.getId() %></td>
                <td><%= issue.getLocation() %></td>
                <td><%= issue.getDescription() %></td>
                <td>
                    <% if (issue.getImage() != null) { %>
                        <!-- Thumbnail -->
                        <a href="ImageServlet?id=<%= issue.getId() %>" target="_blank">
                            <img src="ImageServlet?id=<%= issue.getId() %>" width="80" height="80" class="img-thumbnail"/>
                        </a>
                    <% } else { %>
                        <span class="text-muted">No Image</span>
                    <% } %>
                </td>
                <td>
                    <% if("Received".equals(issue.getStatus())) { %>
                        <span class="badge bg-secondary"><%= issue.getStatus() %></span>
                    <% } else if("In Progress".equals(issue.getStatus())) { %>
                        <span class="badge bg-warning text-dark"><%= issue.getStatus() %></span>
                    <% } else if("Resolved".equals(issue.getStatus())) { %>
                        <span class="badge bg-success"><%= issue.getStatus() %></span>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
