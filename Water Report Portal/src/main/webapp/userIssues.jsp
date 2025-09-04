<%@ page import="java.util.*,com.rohitgawande.waterquality.dao.IssueDAO,com.rohitgawande.waterquality.model.Issue" %>
<%
    String loggedUser = (String) session.getAttribute("username");  
    
    if (loggedUser == null) {
        response.sendRedirect("userLogin.jsp?error=Please login first");
        return;
    }

    IssueDAO dao = new IssueDAO();
    List<Issue> issues = dao.getIssuesByUsername(loggedUser);
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Reported Issues</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4 text-center">Issues Reported by <%= loggedUser %></h2>
    <table class="table table-striped table-hover">
        <thead class="table-info">
            <tr>
                <th>ID</th>
                <th>Location</th>
                <th>Description</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% for(Issue issue : issues) { %>
                <tr>
                    <td><%= issue.getId() %></td>
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
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
