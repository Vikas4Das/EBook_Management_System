package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.UserDAOImpl;
import com.DB.DBconnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phone");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBconnect.getConn());

            // Check if password matches before updating
            boolean isPasswordCorrect = dao.checkPassword(id, password);

            if (isPasswordCorrect) {
                // Create updated user object
                User us = new User();
                us.setId(id);
                us.setName(name);
                us.setEmail(email);
                us.setPhno(phno);
                us.setPassword(password);

                boolean isUpdated = dao.updateprofile(us);

                if (isUpdated) {
                    session.setAttribute("succMsg", "✅ Profile updated successfully!");
                    // update session user data
                    session.setAttribute("userobj", us);
                } else {
                    session.setAttribute("FailedMsg", "⚠️ Something went wrong on the server.");
                }

            } else {
                session.setAttribute("FailedMsg", "❌ Incorrect password.");
            }

            resp.sendRedirect("edit_profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
