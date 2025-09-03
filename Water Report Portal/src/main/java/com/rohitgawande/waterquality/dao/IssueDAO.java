package com.rohitgawande.waterquality.dao;

import com.rohitgawande.waterquality.model.Issue;
import com.rohitgawande.waterquality.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.io.ByteArrayInputStream;

public class IssueDAO {

    public boolean saveIssue(Issue issue) {
        String sql = "INSERT INTO issue (username, location, description, image) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, issue.getName());   // maps Java 'name' → DB 'username'
            ps.setString(2, issue.getLocation());
            ps.setString(3, issue.getDescription());

            if (issue.getImage() != null) {
                ps.setBinaryStream(4, issue.getImage());  // ✅ InputStream stored
            } else {
                ps.setNull(4, Types.BLOB);
            }

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Issue> getAllIssues() {
        List<Issue> issues = new ArrayList<>();
       String sql = "SELECT * FROM issue";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Issue issue = new Issue();
                issue.setId(rs.getInt("id"));
                issue.setName(rs.getString("username")); // ✅ get username column
                issue.setLocation(rs.getString("location"));
                issue.setDescription(rs.getString("description"));

                byte[] imgBytes = rs.getBytes("image");
                if (imgBytes != null) {
                    issue.setImage(new ByteArrayInputStream(imgBytes)); 
                }

                issues.add(issue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return issues;
    }
}
