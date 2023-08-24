
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.Dao.ProductDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Old Items</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container p-5">
		<h3 class="text-primary text-center">Old Items</h3>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Brand</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%

						User u = (User) session.getAttribute("userobj");
						String email = u.getEmail();
						ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
						List<ProductDtls> list = dao.getProductByOld(email, "Old");
						for (ProductDtls b : list) {
				%>
				<tr>
					<td><%=b.getProductName()%></td>
					<td><%=b.getBrand()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getProductCategory()%></td>
					<td><a
						href="delete_old_product?em=<%=email%>&&id=<%=b.getProductId()%>"
						class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>
</body>
</html>