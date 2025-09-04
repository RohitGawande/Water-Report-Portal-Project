package com.rohitgawande.waterquality.controller;

import com.rohitgawande.waterquality.dao.IssueDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private IssueDAO dao = new IssueDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int issueId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        dao.updateIssueStatus(issueId, status);

        // Redirect back to dashboard
        response.sendRedirect("adminDashboard.jsp?adminName=Rohit Gawande");
    }
}

