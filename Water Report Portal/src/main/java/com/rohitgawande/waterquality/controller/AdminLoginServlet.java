package com.rohitgawande.waterquality.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rohitgawande.waterquality.dao.AdminDAO;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String adminName = request.getParameter("adminName");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        boolean isValid = dao.validateAdmin(adminName, password);

        if (isValid) {
             
            HttpSession session = request.getSession();
            session.setAttribute("adminName", adminName);

            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid+Credentials");
        }
    }
}
