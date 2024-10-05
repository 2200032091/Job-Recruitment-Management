package com.servlet;
import java.io.IOException;

import com.DAO.*;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.entity.*;

@WebServlet("/add_job")
public class AddPostServlet  extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("desc");
			
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			HttpSession session=req.getSession();
			JobDAO dao=new JobDAO(DBConnect.getConn());
			boolean f = dao.addJobs(j);
			if(f)
			{
				session.setAttribute("succMsg","Job Posted Successfully...");
				resp.sendRedirect("add_job.jsp");
				
			}else
			{
			      session.setAttribute("succMsg","Something wrong on server");	
			      resp.sendRedirect("add_job.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
   
	
}
