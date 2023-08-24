package com.servlet;

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

import com.DB.DBConnect;
import com.Dao.CartDAOImpl;
import com.Dao.ProductDAOImpl;
import com.Dao.ProductOrderDAOImpl;
import com.entity.Cart;
import com.entity.Product_Order;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phnno=req.getParameter("phnno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
//			System.out.println(name+","+email+","+phnno+","+fullAdd+","+paymentType);
		
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist=dao.getProductByUser(id);
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg","Add Item");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				
				ProductOrderDAOImpl dao2=new ProductOrderDAOImpl(DBConnect.getConn());			
				Product_Order o=null;
				ArrayList<Product_Order> orderList=new ArrayList<Product_Order>();
				Random r=new Random();
				for(Cart c: blist) {
					o=new Product_Order();
					o.setOrderId("Product_ORD-00"+ r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhnno(phnno);
					o.setFulladd(fullAdd);
					o.setProductName(c.getProductName());
					o.setBrand(c.getBrand());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					
				}
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg","Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean f=dao2.saveOrder(orderList);
					if(f) {
						resp.sendRedirect("order_success.jsp");
						
					}else {
						session.setAttribute("failedMsg","your order failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
