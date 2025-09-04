package com.rohitgawande.waterquality.dao;

import com.rohitgawande.waterquality.model.Issue;
import com.rohitgawande.waterquality.util.DBConnection;

import java.sql.*;
import java.util.*;

public class IssueDAO {

    // Insert new issue
    public boolean addIssue(Issue issue) {
        String sql = "INSERT INTO issue(username, location, description, image, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, issue.getUsername());
            ps.setString(2, issue.getLocation());
            ps.setString(3, issue.getDescription());
            ps.setBytes(4, issue.getImage());
            ps.setString(5, issue.getStatus());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all issues
    public List<Issue> getAllIssues() {
        List<Issue> issues = new ArrayList<>();
        String sql = "SELECT * FROM issue";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Issue issue = new Issue();
                issue.setId(rs.getInt("id"));
                issue.setUsername(rs.getString("username"));
                issue.setLocation(rs.getString("location"));
                issue.setDescription(rs.getString("description"));
                issue.setStatus(rs.getString("status"));
                issues.add(issue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return issues;
    }

    // Get issues by user
    public List<Issue> getIssuesByUser(String username) {
        List<Issue> issues = new ArrayList<>();
        String sql = "SELECT * FROM issue WHERE username=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Issue issue = new Issue();
                issue.setId(rs.getInt("id"));
                issue.setUsername(rs.getString("username"));
                issue.setLocation(rs.getString("location"));
                issue.setDescription(rs.getString("description"));
                issue.setStatus(rs.getString("status"));
                issues.add(issue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return issues;
    }

    // Update issue status
    public boolean updateIssueStatus(int id, String status) {
        String sql = "UPDATE issue SET status=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
