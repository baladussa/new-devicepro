<%@page import="com.entity.ProductDtls"%>
<%@page import="com.Dao.ProductDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlipKart-Olx : Index</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/fa.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body style="background-color: #f7f7f7;">
	<%

	User u = (User) session.getAttribute("userobj");
%>
	<%@ include file="all_component/navbar.jsp"%>



	<div class="container-fluid back-img">
		<h2 class="text-center text-white">FlipKart-Olx</h2>
	</div>
	<hr>
	<!-- Start Groceries -->

	<div class="container-fluid">
		<h3 class="text-center">All Recent Items</h3>
		<div class="row">
			<%
			ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDtls> list2 = dao2.getRecentProducts();
			for (ProductDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getProductName()%></p>
						<p><%=b.getBrand()%></p>
						<p>

							<%
							if (b.getProductCategory().equals("old")) {
							%>
							Categories:<%=b.getProductCategory()%></p>
						<div class="row">
							<a href="view_products.jsp?bid=<%=b.getProductId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-3"><i
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
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
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
		<div class="text-center mt-2">
			<a href="all_recent_Items.jsp"
				class="btn btn-danger btn-sm text-white">View all</a>
		</div>
	</div>

	<!-- END Groceries -->
	<hr>
	<!-- Start Electronics -->

	<div class="container-fluid">
		<h3 class="text-center">New Items</h3>
		<div class="row">
			<%
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDtls> list = dao.getNewProducts();
			for (ProductDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getProductName()%></p>
						<p><%=b.getBrand()%></p>
						<p>
							Categories:<%=b.getProductCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
							<a href="view_products.jsp?bid=<%=b.getProductId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-0"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_Items.jsp" class="btn btn-danger btn-sm text-white">View
				all</a>
		</div>
	</div>

	<!-- End Electronics -->
	<hr>
	<!-- Start Fashion -->

	<div class="container-fluid">
		<h3 class="text-center">Fashion</h3>
		<div class="row">
		
		<% 
			
			ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDtls> list3 = dao3.getOldProducts();
			for (ProductDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getProductName()%></p>
						<p><%=b.getBrand()%></p>
						<p>
							Categories:<%=b.getProductCategory()%></p>
						<div class="row">


							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>


							<a href="view_products.jsp?bid=<%=b.getProductId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>


			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_old_Items.jsp" class="btn btn-danger btn-sm text-white">View
				all</a>
		</div>
	</div>

	<!-- END Fashion-->
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>