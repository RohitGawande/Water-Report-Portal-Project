<%@ page import="java.util.List" %>
<%@ page import="com.rohitgawande.waterquality.dao.IssueDAO" %>
<%@ page import="com.rohitgawande.waterquality.model.Issue" %>
<%
    IssueDAO dao = new IssueDAO();
    List<Issue> issues = dao.getAllIssues();
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Issues - Water Report Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Water Report Portal</a>
  </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4">Reported Water Issues</h2>
    <table class="table table-bordered table-striped shadow-sm">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Location</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
        <%
            for(Issue issue : issues) {
        %>
            <tr>
                <td><%= issue.getId() %></td>
                <td><%= issue.getName() %></td>
                <td><%= issue.getLocation() %></td>
                <td><%= issue.getDescription() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>

</body>
</html>
