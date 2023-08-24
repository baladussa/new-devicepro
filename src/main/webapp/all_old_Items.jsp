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
<title>All Fashion</title>
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
			ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDtls> list3 = dao3.getAllOldProduct();
			for (ProductDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getProductName()%></p>
						<p><%=b.getBrand()%></p>
						<p>
							Categories:<%=b.getProductCategory()%></p>
						<div class="row">

							<a href="view_products.jsp?bid=<%=b.getProductId()%>"
								class="btn btn-success btn-sm ml-3">View Details</a> <a href=""
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
	</div>
</body>
</html>