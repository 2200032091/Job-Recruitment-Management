package com.DAO;

import java.sql.*;
import java.util.*;
import com.entity.JobApplication;

public class JobApplicationDAO {
    private Connection conn;

    public JobApplicationDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean applyJob(int userId, int jobId, String cvFileName) {
        boolean applied = false;
        try {
            String query = "INSERT INTO job_applications (user_id, job_id, cv) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            ps.setString(3, cvFileName);
            int result = ps.executeUpdate();
            applied = result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applied;
    }

    public boolean isJobAlreadyApplied(int userId, int jobId) {
        boolean isAlreadyApplied = false;
        try {
            String query = "SELECT * FROM job_applications WHERE user_id = ? AND job_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isAlreadyApplied = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAlreadyApplied;
    }

    public List<JobApplication> getUserAppliedJobs(int userId) {
        List<JobApplication> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM job_applications WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                JobApplication jobApplication = new JobApplication();
                jobApplication.setId(rs.getInt("id"));
                jobApplication.setUserId(rs.getInt("user_id"));
                jobApplication.setJobId(rs.getInt("job_id"));
                jobApplication.setCv(rs.getString("cv"));
                jobApplication.setApplicationDate(rs.getTimestamp("application_date"));
                list.add(jobApplication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean deleteJobApplication(int applicationId) {
        boolean success = false;
        try {
            String query = "DELETE FROM job_applications WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, applicationId);
            int rowsAffected = pstmt.executeUpdate();
            success = (rowsAffected > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}
