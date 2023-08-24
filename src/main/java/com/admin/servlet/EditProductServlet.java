package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.Dao.ProductDAOImpl;
import com.entity.ProductDtls;

@WebServlet("/editproducts")
public class EditProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String productName = req.getParameter("bname");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
		    ProductDtls b=new ProductDtls();
		    b.setProductId(id);
		    b.setProductName(productName);
		    b.setBrand(brand);
		    b.setPrice(price);
		    b.setStatus(status);
		    
		    ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
		    boolean f=dao.updateEditProducts(b);
		    
		    HttpSession session=req.getSession();
		    
		    if(f) {
		    	session.setAttribute("succMsg", "Product Update Successfully...");
		    	resp.sendRedirect("admin/all_Products.jsp");
		    }else {
		    	session.setAttribute("failedMsg", "something wrong on server");
		    	resp.sendRedirect("admin/all_Products.jsp");
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
