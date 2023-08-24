<%@page import="com.entity.Product_Order"%>
<%@page import="com.Dao.ProductOrderDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="navbar.jsp"%>

	<h4 class="text-center mt-2 text-success">Hello Admin</h4>
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Product Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>			
			<%
			ProductOrderDAOImpl dao=new ProductOrderDAOImpl(DBConnect.getConn());
			List<Product_Order> blist=dao.getAllOrder();
			for(Product_Order b :blist){
				%>
				<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhnno()%></td>
				<td><%=b.getProductName()%></td>
				<td><%=b.getBrand()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
					</tr>
				<%
			}
			
			%>	

		</tbody>
	</table>
	<div style="margin-top: 130px">
		<%@ include file="footer.jsp"%></div>
</body>
</html>