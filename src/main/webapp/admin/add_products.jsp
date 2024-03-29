<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Items</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="navbar.jsp"%>
<c:if test="">
<c:redirect url="../login.jsp" />

</c:if>

	<div class="container ">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Items</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}
							<p>
								<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}
							<p>
								<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../add_products" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Item Name</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Brand Name</label> <input
									type="text" name="brand" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1">


							</div>
							<div class="form-group">
								<label for="inputState">Item Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>---select---</option>
									<option value="New">New Item</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Product Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>---select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" name="bimg" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px">
		<%@ include file="footer.jsp"%></div>
</body>
</html>