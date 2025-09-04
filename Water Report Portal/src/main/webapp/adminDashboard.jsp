<%@ page import="java.util.List" %>
<%@ page import="com.rohitgawande.waterquality.dao.IssueDAO" %>
<%@ page import="com.rohitgawande.waterquality.model.Issue" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) {
        response.sendRedirect("adminLogin.jsp?error=Please Login First");
        return;
    }

    IssueDAO dao = new IssueDAO();
    List<Issue> issues = dao.getAllIssues();
    
    // Pre-calculate counts for the stats cards
    int totalIssues = issues.size();
    int receivedCount = 0;
    int inProgressCount = 0;
    int resolvedCount = 0;
    
    for(Issue issue : issues) {
        if("Received".equals(issue.getStatus())) {
            receivedCount++;
        } else if("In Progress".equals(issue.getStatus())) {
            inProgressCount++;
        } else if("Resolved".equals(issue.getStatus())) {
            resolvedCount++;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Water Quality Management System | Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-bg: #34495e;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --info-color: #2980b9;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        
        body {
            background-color: #f5f7f9;
            color: #333;
            min-height: 100vh;
        }
        
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: var(--primary-color);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 3px 0 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        
        .sidebar-header {
            padding: 20px;
            background: var(--dark-bg);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .sidebar-menu {
            padding: 10px 0;
        }
        
        .sidebar-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .sidebar-menu li a {
            padding: 12px 20px;
            display: block;
            color: #b8c7ce;
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .sidebar-menu li a:hover, .sidebar-menu li a.active {
            background: rgba(255,255,255,0.1);
            color: white;
            border-left: 3px solid var(--secondary-color);
        }
        
        .sidebar-menu li a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 20px;
            transition: all 0.3s;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background: white;
            border-bottom: 1px solid #eaeaea;
            border-radius: 5px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .user-info {
            display: flex;
            align-items: center;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--secondary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: bold;
        }
        
        /* Card Styles */
        .stats-card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .stats-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        
        /* Table Styles */
        .data-table {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }
        
        .table-header {
            padding: 15px 20px;
            background: white;
            border-bottom: 1px solid #eaeaea;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .table-responsive {
            overflow-x: auto;
        }
        
        .table th {
            background: var(--light-bg);
            font-weight: 500;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .action-form {
            display: flex;
            gap: 10px;
        }
        
        /* Modal Styles */
        .modal-content {
            border-radius: 8px;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }
            
            .sidebar .menu-text {
                display: none;
            }
            
            .sidebar-header h3 {
                display: none;
            }
            
            .sidebar-header {
                text-align: center;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>Water Quality System</h3>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-home"></i> <span class="menu-text">Dashboard</span></a></li>
                    <li><a href="#"><i class="fas fa-tint"></i> <span class="menu-text">Water Issues</span></a></li>
                    <li><a href="#"><i class="fas fa-map-marker-alt"></i> <span class="menu-text">Locations</span></a></li>
                    <li><a href="#"><i class="fas fa-users"></i> <span class="menu-text">Users</span></a></li>
                    <li><a href="#"><i class="fas fa-chart-bar"></i> <span class="menu-text">Reports</span></a></li>
                    <li><a href="#"><i class="fas fa-cog"></i> <span class="menu-text">Settings</span></a></li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <div class="header">
                <h2>Admin Dashboard</h2>
                <div class="user-info">
                    <div class="user-avatar">
                        <%= adminName != null ? adminName.charAt(0) : "A" %>
                    </div>
                    <div>
                        <div><strong><%= adminName %></strong></div>
                        <div class="text-muted" style="font-size: 0.8rem;">Administrator</div>
                    </div>
                    <a href="logout.jsp" class="btn btn-outline-danger btn-sm ms-3">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>

            <!-- Stats Overview -->
            <div class="row">
                <div class="col-md-3">
                    <div class="stats-card fade-in">
                        <div class="stats-icon" style="background: rgba(52, 152, 219, 0.1); color: var(--secondary-color);">
                            <i class="fas fa-tint"></i>
                        </div>
                        <h4><%= totalIssues %></h4>
                        <p class="text-muted">Total Issues</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card fade-in">
                        <div class="stats-icon" style="background: rgba(231, 76, 60, 0.1); color: var(--accent-color);">
                            <i class="fas fa-exclamation-circle"></i>
                        </div>
                        <h4><%= receivedCount %></h4>
                        <p class="text-muted">New Issues</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card fade-in">
                        <div class="stats-icon" style="background: rgba(243, 156, 18, 0.1); color: var(--warning-color);">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <h4><%= inProgressCount %></h4>
                        <p class="text-muted">In Progress</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card fade-in">
                        <div class="stats-icon" style="background: rgba(39, 174, 96, 0.1); color: var(--success-color);">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4><%= resolvedCount %></h4>
                        <p class="text-muted">Resolved</p>
                    </div>
                </div>
            </div>

            <!-- Issues Table -->
            <div class="data-table fade-in">
                <div class="table-header">
                    <h4>Water Quality Issues</h4>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-2">
                            <i class="fas fa-download"></i> Export
                        </button>
                        <div class="input-group input-group-sm" style="width: 200px;">
                            <input type="text" class="form-control" placeholder="Search issues...">
                            <button class="btn btn-outline-primary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Location</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Issue issue : issues) { %>
                            <tr>
                                <td><strong>#<%= issue.getId() %></strong></td>
                                <td><%= issue.getUsername() %></td>
                                <td><%= issue.getLocation() %></td>
                                <td>
                                    <div class="text-truncate" style="max-width: 200px;" 
                                         data-bs-toggle="tooltip" title="<%= issue.getDescription() %>">
                                        <%= issue.getDescription() %>
                                    </div>
                                </td>
                                <td>
                                    <% if (issue.getImage() != null) { %>
                                        <a href="ImageServlet?id=<%= issue.getId() %>" data-bs-toggle="modal" data-bs-target="#imageModal<%= issue.getId() %>">
                                            <img src="ImageServlet?id=<%= issue.getId() %>" width="50" height="50" class="img-thumbnail"/>
                                        </a>
                                        
                                        <!-- Image Modal -->
                                        <div class="modal fade" id="imageModal<%= issue.getId() %>" tabindex="-1">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Issue #<%= issue.getId() %> Image</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <div class="modal-body text-center">
                                                        <img src="ImageServlet?id=<%= issue.getId() %>" class="img-fluid" alt="Issue Image">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <% } else { %>
                                        <span class="text-muted">No Image</span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if("Received".equals(issue.getStatus())) { %>
                                        <span class="status-badge bg-secondary"><%= issue.getStatus() %></span>
                                    <% } else if("In Progress".equals(issue.getStatus())) { %>
                                        <span class="status-badge bg-warning text-dark"><%= issue.getStatus() %></span>
                                    <% } else if("Resolved".equals(issue.getStatus())) { %>
                                        <span class="status-badge bg-success"><%= issue.getStatus() %></span>
                                    <% } %>
                                </td>
                                <td>
                                    <form action="AdminServlet" method="post" class="action-form">
                                        <input type="hidden" name="id" value="<%= issue.getId() %>">
                                        <select name="status" class="form-select form-select-sm">
                                            <option value="Received" <%= issue.getStatus().equals("Received") ? "selected" : "" %>>Received</option>
                                            <option value="In Progress" <%= issue.getStatus().equals("In Progress") ? "selected" : "" %>>In Progress</option>
                                            <option value="Resolved" <%= issue.getStatus().equals("Resolved") ? "selected" : "" %>>Resolved</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="fas fa-sync-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                
                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center p-3 border-top">
                    <div class="text-muted">Showing <%= issues.size() %> issues</div>
                    <nav>
                        <ul class="pagination mb-0">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        });
        
        // Add some interactive functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Simulate loading
            setTimeout(function() {
                document.querySelectorAll('.fade-in').forEach(el => {
                    el.style.opacity = 1;
                });
            }, 100);
        });
    </script>
</body>
</html>