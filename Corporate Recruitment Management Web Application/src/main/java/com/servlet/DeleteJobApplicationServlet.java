package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.JobApplicationDAO;
import com.DB.DBConnect;

@WebServlet("/DeleteJobApplicationServlet")
public class DeleteJobApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));
        
        try {
        	JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getConn());
            boolean success = dao.deleteJobApplication(applicationId);
            
            if (success) {
                response.sendRedirect("applied_jobs.jsp?msg=Application+deleted+successfully");
            } else {
                response.sendRedirect("applied_jobs.jsp?msg=Failed+to+delete+application");
            }
        }catch(Exception e)
          {
        	e.printStackTrace();
             }
        
    }
}
