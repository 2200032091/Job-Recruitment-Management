package com.servlet;

import java.io.IOException;

import com.DAO.JobDAO;
import com.DB.DBConnect;
import com.entity.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("desc");
			
			Jobs j =new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			
			HttpSession session=req.getSession();
			JobDAO dao=new JobDAO(DBConnect.getConn());
			boolean f = dao.updateJob(j);
			if(f)
			{
				session.setAttribute("succMsg","Job Updated Successfully...");
				resp.sendRedirect("view_jobs.jsp");
				
			}else
			{
			      session.setAttribute("succMsg","Something wrong on server");	
			      resp.sendRedirect("view_jobs.jsp");
			}
		}catch(Exception e)
		{
		e.printStackTrace();	
		}
	}

}
