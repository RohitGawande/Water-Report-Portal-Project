package com.rohitgawande.waterquality.controller;

import com.rohitgawande.waterquality.dao.IssueDAO;
import com.rohitgawande.waterquality.model.Issue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet("/submitIssue")
public class IssueServlet extends HttpServlet {
    private IssueDAO dao = new IssueDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        Part imagePart = request.getPart("image");

        byte[] imageBytes = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            InputStream inputStream = imagePart.getInputStream();
            imageBytes = inputStream.readAllBytes();
        }

        Issue issue = new Issue(username, location, description, imageBytes);
        boolean success = dao.addIssue(issue);

        if (success) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
