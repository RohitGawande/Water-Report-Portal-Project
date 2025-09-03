package com.rohitgawande.waterquality.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {
    private static Connection connection = null;

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try (InputStream input = DBConnection.class.getClassLoader()
                    .getResourceAsStream("config.properties")) { // ✅ Now correct

                Properties props = new Properties();
                props.load(input);

                String url = props.getProperty("db.url");
                String username = props.getProperty("db.username");
                String password = props.getProperty("db.password");

                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    // For quick test
    public static void main(String[] args) {
        try (Connection con = DBConnection.getConnection()) {
            if (con != null) {
                System.out.println("✅ DB Connected Successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
