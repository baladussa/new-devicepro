package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.Dao.CartDAOImpl;
import com.Dao.ProductDAOImpl;
import com.entity.Cart;
import com.entity.ProductDtls;
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
			ProductDtls b=dao.getProductById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setProductName(b.getProductName());
			c.setBrand(b.getBrand());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("addCart", "Product Added successfully...");
				resp.sendRedirect("all_new_Items.jsp");
			}else {
				session.setAttribute("failed", "something wrong on server");
				resp.sendRedirect("all_new_Items.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
	}

}
