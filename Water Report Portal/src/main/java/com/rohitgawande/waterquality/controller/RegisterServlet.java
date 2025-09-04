package com.rohitgawande.waterquality.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/water_quality_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password"; // replace with your DB password

    // SQL query to insert user
    private static final String INSERT_USER_SQL = "INSERT INTO users (fullname, email, username, password) VALUES (?, ?, ?, ?)";

    // Method to get database connection
    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Simple validation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Insert user into database
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {

            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, username);
            preparedStatement.setString(4, password); // You can hash the password here for security

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                // Registration successful, redirect to login page
                response.sendRedirect("userLogin.jsp?message=Registration successful, please login!");
            } else {
                request.setAttribute("message", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
