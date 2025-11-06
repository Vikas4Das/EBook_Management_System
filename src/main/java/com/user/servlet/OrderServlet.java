package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBconnect;
import com.entity.Book_Order;
import com.entity.cart;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");

			String email=req.getParameter("email");

			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("zip");
			String paymentType=req.getParameter("paymentType");
			
			
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;

			
			
			
			
			CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());

			List<cart> blist=dao.getBookByUser(id);
			
			
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg", "Add Items");
				resp.sendRedirect("cart.jsp");
			} else {
				BookOrderImpl dao2=new BookOrderImpl(DBconnect.getConn());
				
				
				Book_Order o= null;
				
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				Random r=new Random();
				for(cart c:blist)
				{
					
					
					
					o=new Book_Order();
					o.setOrderId("BOOK-ORD-00"+ r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookname(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					
					
					
					 
					
				}

				if ("noselect".equals(paymentType)) {

					session.setAttribute("failedMsg", "Choose payment Method");
					resp.sendRedirect("cart.jsp");
				} else {

					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("cart.jsp");
					}

				}
				
			}
			
			
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	
	
	
	
}
