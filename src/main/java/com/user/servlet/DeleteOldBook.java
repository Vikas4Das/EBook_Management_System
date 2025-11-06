package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.BooksDAOImpl;
import com.DB.DBconnect;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        try {
            int bid = Integer.parseInt(req.getParameter("bid"));

            BooksDAOImpl dao = new BooksDAOImpl(DBconnect.getConn());
            boolean f = dao.deleteOldBookById(bid);

            if (f) {
                session.setAttribute("succMsg", "Old book deleted successfully!");
            } else {
                session.setAttribute("FailedMsg", "Failed to delete the book. Try again.");
            }

            resp.sendRedirect("edit_old_book.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("FailedMsg", "Something went wrong on the server.");
            resp.sendRedirect("edit_old_book.jsp");
        }
    }
}
