package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.DAO.BooksDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;

@WebServlet("/addbooks")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("btype");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			// Save uploaded file
			String uploadPath = getServletContext().getRealPath("") + "book";
			part.write(uploadPath + java.io.File.separator + fileName);
			// Create book object
			BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, "admin");

			Connection conn = DBconnect.getConn();
			if (conn == null) {
				throw new ServletException("Database connection failed!");
			}

			BooksDAOImpl dao = new BooksDAOImpl(conn);

			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "✅ Book added successfully!");
			} else {
				session.setAttribute("failedMsg", "⚠️ Something went wrong on the server.");
			}
			resp.sendRedirect("admin/addbooks.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			HttpSession session = req.getSession();
			session.setAttribute("failedMsg", "❌ Error: " + e.getMessage());
			resp.sendRedirect("admin/addbooks.jsp");
		}
	}
}
