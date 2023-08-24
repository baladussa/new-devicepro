<%@page import="com.entity.ProductDtls"%>
<%@page import="com.Dao.ProductDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Items</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body>

	<%

		User u = (User) session.getAttribute("userobj");
	%>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDtls> list2 = dao2.getProductBySearch(ch);
			for (ProductDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getProductName()%></p>
						<p><%=b.getBrand()%></p>
						<p>

							<%
							if (b.getProductCategory().equals("Old")) {
							%>
							Categories:<%=b.getProductCategory()%></p>
						<div class="row">
							<a href="view_products.jsp?bid=<%=b.getProductId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>

						Categories:<%=b.getProductCategory()%>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
							<a href="view_products.jsp?bid=<%=b.getProductId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>
</body>
</html>