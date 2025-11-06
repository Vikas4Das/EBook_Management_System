package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        try {
            // Retrieve form data
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String useremail = req.getParameter("user");

            String categories = "Old";
            String status = "Active";

            // Handle file upload
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

            // Ensure upload folder exists
            String uploadPath = getServletContext().getRealPath("") + "book";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Save uploaded file
            part.write(uploadPath + File.separator + fileName);

            // Create book object with actual user email
            BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, useremail);

            Connection conn = DBconnect.getConn();
            if (conn == null) {
                throw new ServletException("Database connection failed!");
            }

            BooksDAOImpl dao = new BooksDAOImpl(conn);

            boolean success = dao.addBooks(b);

            if (success) {
                session.setAttribute("succMsg", "✅ Book added successfully!");
            } else {
                session.setAttribute("failedMsg", "⚠️ Something went wrong on the server.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "❌ Error: " + e.getMessage());
        }

        // ✅ Redirect only once at the end
        resp.sendRedirect("sell_book.jsp");
    }
}
