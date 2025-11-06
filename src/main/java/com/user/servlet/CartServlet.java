package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
import com.entity.User;
import com.entity.cart;



@WebServlet("/cart")
public class CartServlet extends HttpServlet { 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	
	{
		
		
		try {
			
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			
			BooksDAOImpl dao=new BooksDAOImpl(DBconnect.getConn());
			BookDtls b=dao.getBookById(bid);
			
			
			cart c=new cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			
			
			CartDAOImpl dao2=new CartDAOImpl(DBconnect.getConn());
			
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			User u = (User) session.getAttribute("userobj");
			
			if (f) 
				
			{
				session.setAttribute("addCart" , "Book Added to cart");
				resp.sendRedirect("allNewBook.jsp");
				
				
				
				
				
				
			} else {
				session.setAttribute("Failed" , "Something Wrong On Server");
				resp.sendRedirect("allNewBook.jsp");
			}
			
			
			
		} catch (Exception e) 
		
		{
			e.printStackTrace();
		}
		
		
		
	}
	
	

}










