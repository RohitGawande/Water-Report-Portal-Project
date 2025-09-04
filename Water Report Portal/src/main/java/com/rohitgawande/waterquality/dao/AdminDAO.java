package com.rohitgawande.waterquality.dao;

import java.sql.*;
import com.rohitgawande.waterquality.util.DBConnection;

public class AdminDAO {

    public boolean validateAdmin(String adminName, String password) {
        String sql = "SELECT * FROM admins WHERE adminName=? AND password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, adminName);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // true if record exists
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
