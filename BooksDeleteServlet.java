package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DB.DBconnect;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            BooksDAOImpl dao = new BooksDAOImpl(DBconnect.getConn());
            boolean f = dao.deleteBooks(id);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Book Deleted Successfully!");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server!");
            }

            resp.sendRedirect("admin/allbooks.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
