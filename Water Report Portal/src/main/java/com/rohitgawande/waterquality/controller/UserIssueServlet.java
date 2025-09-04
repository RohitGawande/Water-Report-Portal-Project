package com.rohitgawande.waterquality.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rohitgawande.waterquality.dao.IssueDAO;
import com.rohitgawande.waterquality.model.Issue;
@WebServlet("/UserIssueServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class UserIssueServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username"); // ✅ session value
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        Part filePart = request.getPart("image");
        byte[] image = null;

        if (filePart != null && filePart.getSize() > 0) {
            InputStream inputStream = filePart.getInputStream();
            image = inputStream.readAllBytes();
        }

        Issue issue = new Issue();
        issue.setUsername(username);
        issue.setLocation(location);
        issue.setDescription(description);
        issue.setImage(image);
        issue.setStatus("Received"); // default

        IssueDAO dao = new IssueDAO();
        boolean success = dao.addIssue(issue);

        if (success) {
            response.sendRedirect("userDashboard.jsp");
        } else {
            response.getWriter().println("Error submitting issue");
        }
    }

}
