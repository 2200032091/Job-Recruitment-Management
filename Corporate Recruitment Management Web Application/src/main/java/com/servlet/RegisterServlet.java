/*
 * package com.servlet;
 * 
 * import com.DAO.UserDAO; import com.entity.User; import com.DB.DBConnect;
 * import javax.servlet.http.HttpServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet;
 * 
 * @WebServlet("/add_user") public class RegisterServlet extends HttpServlet {
 * 
 */


/**
	* 
	*//*
		 * private static final long serialVersionUID = 1L;
		 * 
		 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
		 * resp) throws ServletException, IOException {
		 * 
		 * try { String name = req.getParameter("name"); String qua =
		 * req.getParameter("qua"); String email = req.getParameter("email"); String ps
		 * = req.getParameter("ps"); UserDAO dao = new UserDAO(DBConnect.getConn());
		 * User u = new User(name, email, ps, qua, "User");
		 * 
		 * boolean f = dao.addUser(u);
		 * 
		 * HttpSession session = req.getSession(); if (f) {
		 * session.setAttribute("succMsg", "Registerd Successfully");
		 * resp.sendRedirect("signup.jsp"); } else { session.setAttribute("succMsg",
		 * "Something went wrong on server"); resp.sendRedirect("signup.jsp"); } } catch
		 * (Exception e) { e.printStackTrace(); } } }
		 */




package com.servlet;

import com.DAO.UserDAO;
import com.entity.User;
import com.DB.DBConnect;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("name");
            String qua = req.getParameter("qua");
            String email = req.getParameter("email");
            String ps = req.getParameter("ps");
            String role = req.getParameter("role");

            UserDAO dao = new UserDAO(DBConnect.getConn());
            User u = new User(name, email, ps, qua, role);

            boolean f = dao.addUser(u);

            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Registered Successfully");
                resp.sendRedirect("signup.jsp");
            } else {
                session.setAttribute("succMsg", "Something went wrong on server");
                resp.sendRedirect("signup.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
