package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBconnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        try {
            // Get form data
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            HttpSession session = req.getSession();

            // Validate if terms checkbox is checked
            if (check == null) {
                session.setAttribute("FailedMsg", "⚠️ Please agree to the Terms and Conditions.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // Create User object
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            // DAO object
            UserDAOImpl dao = new UserDAOImpl(DBconnect.getConn());

            // Check if user already exists
            boolean userExists = dao.checkUser(email);

            if (userExists) {
                session.setAttribute("FailedMsg", "⚠️ User already exists. Try another email.");
                resp.sendRedirect("register.jsp");
            } else {
                // Register new user
                boolean registered = dao.userRegister(us);

                if (registered) {
                    session.setAttribute("succMsg", "✅ Registration successful!");
                    resp.sendRedirect("register.jsp");
                } else {
                    session.setAttribute("FailedMsg", "⚠️ Something went wrong on the server.");
                    resp.sendRedirect("register.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("FailedMsg", "⚠️ Internal server error.");
            resp.sendRedirect("register.jsp");
        }
    }
}
