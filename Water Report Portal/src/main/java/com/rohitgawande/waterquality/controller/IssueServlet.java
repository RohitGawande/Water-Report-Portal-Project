package com.rohitgawande.waterquality.controller;

import com.rohitgawande.waterquality.dao.IssueDAO;
import com.rohitgawande.waterquality.model.Issue;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/submitIssue")
@MultipartConfig(maxFileSize = 16177215) // ~16MB
public class IssueServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String location = request.getParameter("location");
            String description = request.getParameter("description");

            // Handle uploaded image
            Part filePart = request.getPart("image");
            InputStream imageStream = null;
            if (filePart != null && filePart.getSize() > 0) {
                imageStream = filePart.getInputStream();
            }

            // Build Issue object
            Issue issue = new Issue();
            issue.setName(name);
            issue.setLocation(location);
            issue.setDescription(description);
            issue.setImage(imageStream);

            // Save to DB via DAO
            IssueDAO dao = new IssueDAO();
            boolean saved = dao.saveIssue(issue);

            if (saved) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
