<%@ page import="java.util.*,com.rohitgawande.waterquality.dao.IssueDAO,com.rohitgawande.waterquality.model.Issue" %>
<%
    IssueDAO dao = new IssueDAO();
    List<Issue> issues = dao.getAllIssues();
    String adminName = request.getParameter("adminName"); // e.g., Rohit Gawande
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
            <% for(Issue issue : issues) { %>
            <tr>
                <td><%= issue.getId() %></td>
                <td><%= issue.getUsername() %></td>
                <td><%= issue.getLocation() %></td>
                <td><%= issue.getDescription() %></td>
                <td>
                    <% if("Received".equals(issue.getStatus())) { %>
                        <span class="badge bg-secondary"><%= issue.getStatus() %></span>
                    <% } else if("In Progress".equals(issue.getStatus())) { %>
                        <span class="badge bg-warning text-dark"><%= issue.getStatus() %></span>
                    <% } else if("Resolved".equals(issue.getStatus())) { %>
                        <span class="badge bg-success"><%= issue.getStatus() %></span>
                    <% } %>
                </td>
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
