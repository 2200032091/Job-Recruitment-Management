package com.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.JobApplicationDAO;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/applyJob")
@MultipartConfig
public class ApplyJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        Part cvPart = request.getPart("cv");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userobj");

        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        

        try {
        	int userId = user.getId();
            JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getConn());
            boolean isAlreadyApplied = dao.isJobAlreadyApplied(userId, jobId);

            if (isAlreadyApplied) {
                session.setAttribute("succMsg", "You have already applied for this job.");
                response.sendRedirect("home.jsp");
                return;
            }

            // Save CV file
            String fileName = userId + "_" + jobId + "_" + cvPart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName;
            File file = new File(uploadPath);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            cvPart.write(file.getAbsolutePath());

            boolean applied = dao.applyJob(userId, jobId, fileName);

            if (applied) {
                session.setAttribute("succMsg", "Job applied successfully.");
            } else {
                session.setAttribute("succMsg", "Error occurred while applying for job.");
            }
            response.sendRedirect("home.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("succMsg", "Database error: " + e.getMessage());
            response.sendRedirect("home.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("succMsg", "An error occurred: " + e.getMessage());
            response.sendRedirect("home.jsp");
        }
    }
}
