package com.rohitgawande.waterquality.util;

import java.sql.*;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {
    private static Connection connection;

    public static Connection getConnection() throws Exception {
        if (connection == null || connection.isClosed()) {
            Properties props = new Properties();
            try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("config.properties")) {
                props.load(input);
            }

            String url = props.getProperty("db.url");
            String user = props.getProperty("db.user");
            String password = props.getProperty("db.password");

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        }
        return connection;
    }
}
