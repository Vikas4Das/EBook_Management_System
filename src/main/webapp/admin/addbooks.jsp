<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Add Books</title>
<%@include file="allcss.jsp"%>

<style>
.add-book-section {
	padding: 60px 0;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
	background: #ffffff;
	transition: all 0.3s ease-in-out;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

.card h4 {
	font-weight: 600;
	color: #303f9f;
	margin-bottom: 25px;
}

.form-control, .form-control-file, .form-select {
	border-radius: 10px;
	box-shadow: none;
	border: 1px solid #ccc;
	transition: 0.2s;
}

.form-control:focus, .form-select:focus {
	border-color: #303f9f;
	box-shadow: 0 0 0 0.2rem rgba(48, 63, 159, 0.25);
}

label {
	font-weight: 500;
	color: #333;
}

.btn-primary {
	background-color: #303f9f;
	border: none;
	border-radius: 10px;
	width: 100%;
	font-size: 16px;
	padding: 10px;
	transition: 0.3s;
}

.btn-primary:hover {
	background-color: #1e2a78;
}

.card-body {
	padding: 30px;
}

@media ( max-width : 768px) {
	.card {
		margin-top: 20px;
	}
}
</style>
</head>

<body>
	<%@include file="navbar.jsp"%>



	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", 0); // Proxies
	%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container add-book-section">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-5">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-4">
							<i class="fas fa-book me-2"></i>Add New Book
						</h4>


						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>



						<form action="../addbooks" method="post"
							enctype="multipart/form-data">

							<div class="mb-3">
								<label>Book Name *</label> <input type="text" name="bname"
									class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Author Name *</label> <input type="text" name="author"
									class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Price *</label> <input type="number" name="price"
									class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Book Category *</label> <select name="btype"
									class="form-select">
									<option selected disabled>-- Select --</option>
									<option value="New">New Book</option>
									<option value="Old">Old Book</option>
									
								</select>
							</div>

							<div class="mb-3">
								<label>Book Status *</label> <select name="bstatus"
									class="form-select">
									<option selected disabled>-- Select --</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="mb-3">
								<label>Upload Book Image *</label> <input type="file"
									name="bimg" class="form-control-file" accept="image/*" required>
							</div>

							<button type="submit" class="btn btn-primary mt-3">
								<i class="fas fa-upload me-2"></i> Add Book
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
