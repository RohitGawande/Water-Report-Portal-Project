<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) {
        response.sendRedirect("adminLogin.jsp?error=Please Login First");
        return;
    }

    com.rohitgawande.waterquality.dao.IssueDAO dao = new com.rohitgawande.waterquality.dao.IssueDAO();
    java.util.List<com.rohitgawande.waterquality.model.Issue> issues = dao.getAllIssues();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Welcome, <%= adminName %> (Admin)</h2>
    <a href="logout.jsp" class="btn btn-danger mb-3">Logout</a>
    <table class="table table-bordered table-hover align-middle">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Location</th>
                <th>Description</th>
                <th>Status</th>
                <th>Update Status</th>
            </tr>
        </thead>
        <tbody>
            <% for(com.rohitgawande.waterquality.model.Issue issue : issues) { %>
            <tr>
                <td><%= issue.getId() %></td>
                <td><%= issue.getUsername() %></td>
                <td><%= issue.getLocation() %></td>
                <td><%= issue.getDescription() %></td>
                <td><%= issue.getStatus() %></td>
                <td>
                    <form action="AdminServlet" method="post" class="d-flex">
                        <input type="hidden" name="id" value="<%= issue.getId() %>">
                        <select name="status" class="form-select me-2">
                            <option value="Received" <%= issue.getStatus().equals("Received") ? "selected" : "" %>>Received</option>
                            <option value="In Progress" <%= issue.getStatus().equals("In Progress") ? "selected" : "" %>>In Progress</option>
                            <option value="Resolved" <%= issue.getStatus().equals("Resolved") ? "selected" : "" %>>Resolved</option>
                        </select>
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
