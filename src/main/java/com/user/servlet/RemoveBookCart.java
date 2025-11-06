package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBconnect;


@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao = null;
		try {
			dao = new CartDAOImpl(DBconnect.getConn());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		boolean f=dao.deleteBook(bid,uid,cid);
		
		HttpSession session=req.getSession();
		
		
		if(f)
		{
			session.setAttribute("succMsg", "Book Removed from Cart");
			resp.sendRedirect("cart.jsp");
		} else {
			session.setAttribute("FailedMsg", "Something wrong on server");
			resp.sendRedirect("cart.jsp");
		}
		
		
		
		
		
	}
	
	
	
	

}
