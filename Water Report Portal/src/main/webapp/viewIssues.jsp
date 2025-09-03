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
    <title>View Issues</title>
</head>
<body>
<h2>Reported Issues</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Location</th>
        <th>Description</th>
    </tr>
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
</table>
</body>
</html>
