package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            // Get the current session (if it exists)
            HttpSession session = req.getSession(false);

            if (session != null) {
                // Remove the user object
                session.removeAttribute("userobj");
                
                // Set a success message
                session.setAttribute("succMsg", "Logout Successfully!");
            }

            // Redirect to login page
            resp.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
