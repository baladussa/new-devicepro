
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.Dao.ProductDAOImpl"%>
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
<title>Admin: All Items</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	
	<c:redirect url="../login.jsp" />
	
	</c:if>
	

	<h4 class="text-center mt-2 text-success">Hello Admin</h4>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Product Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
				ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> list = dao.getAllProducts();

				for (ProductDtls b : list) {
				%>
			
			<tr>

				<td><%=b.getProductId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getProductName()%></td>
				<td><%=b.getBrand()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getProductCategory()%></td>
				<td><%=b.getStatus()%></td>

				<td><a href="edit_products.jsp?id=<%=b.getProductId()%>"
					class="btn btn-sm btn-primary"><i
						class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../delete?id=<%=b.getProductId()%>"
					class="btn btn-sm btn-danger"><i
						class="fa-sharp fa-solid fa-trash"></i> Delete</a></td>

			</tr>

			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 160px">
		<%@ include file="footer.jsp"%></div>
</body>
</html>