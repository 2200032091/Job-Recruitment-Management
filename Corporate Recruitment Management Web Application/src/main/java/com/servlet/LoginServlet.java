package com.servlet;

import com.DAO.*;
import com.DB.*;
import com.entity.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String em=req.getParameter("email");
			String ps=req.getParameter("password");
			User u=new User();
			HttpSession session = req.getSession();			
			if("admin@gmail.com".equals(em)&&"123".equals(ps))
			{
	            session.setAttribute("userobj",u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}
			else
			{ 
				UserDAO dao=new UserDAO(DBConnect.getConn());
				User user=dao.login(em, ps);
				
				session.setAttribute("userobj", user);
				if(user!=null)
				{ if ("admin".equals(user.getRole())) {
		            resp.sendRedirect("admin.jsp");
		        } else if ("user".equals(user.getRole())) {
		            resp.sendRedirect("home.jsp");
		        } else {
		            session.setAttribute("succMsg", "Invalid Role");
		            resp.sendRedirect("login.jsp");
		        }
				}
				else
				{
					session.setAttribute("succMsg", "Invalid Email and Password");
			        resp.sendRedirect("login.jsp");
				}
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
