package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.Dao.ProductDAOImpl;

@WebServlet("/delete_old_product")
public class DeleteOldProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String em = req.getParameter("em");
		int id=Integer.parseInt(req.getParameter("id"));
		ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
		boolean f =dao.oldProductDelete(em, "Old", id);
		HttpSession session=req.getSession();
		
		
		if(f) {
			session.setAttribute("succMsg", "old Product Deleted successfully...");
			resp.sendRedirect("old_product.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong in server");
			resp.sendRedirect("old_product.jsp");
		}
		

	}
}
