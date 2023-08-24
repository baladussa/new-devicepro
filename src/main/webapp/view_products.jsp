<%@page import="com.entity.ProductDtls"%>
<%@page import="com.Dao.ProductDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Item Details</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
	ProductDtls b = dao.getProductById(bid);
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 150px; width: 100px">
				<h4 class="mt-3">
					Item Name: <span class="text-success"><%=b.getProductName()%></span>
				</h4>
				<h4>
					Product Name: <span class="text-success"><%=b.getBrand()%></span>
				</h4>
				<h4>
					Categories: <span class="text-success"><%=b.getProductCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getProductName()%></h2>

				<%
				if("Old".equals(b.getProductCategory())){
					%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> EMail:
					<%=b.getEmail()%></h5>
				<% 
				}
				%>
<br>

				<div class="row">
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fa-solid fa-money-bill-wave fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fa-sharp fa-solid fa-rotate-left fa-3x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<%
				if("Old".equals(b.getProductCategory()))
				{%>
				<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>
				<%}else{%>
				<div class=" text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>

				<% }
				%>

			</div>
		</div>
	</div>

</body>
</html>