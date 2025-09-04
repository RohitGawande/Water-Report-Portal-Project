package com.rohitgawande.waterquality.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/waterdb", "root", "yourpassword"); // change password
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminName = request.getParameter("adminName");
        String password = request.getParameter("password");

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM admins WHERE adminName=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, adminName);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Valid login → store session
                HttpSession session = request.getSession();
                session.setAttribute("adminName", adminName);

                response.sendRedirect("adminDashboard.jsp");
            } else {
                // ❌ Invalid login → back to login page
                response.sendRedirect("adminLogin.jsp?error=Invalid Credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLogin.jsp?error=Server Error");
        }
    }
}
