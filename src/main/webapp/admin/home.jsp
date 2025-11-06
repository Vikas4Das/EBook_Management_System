<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="allcss.jsp"%>




<style>
.head {
	color: #303f9f;
}

.dashboard-card {
	border-radius: 15px;
	transition: all 0.3s ease-in-out;
	background: #ffffff;
}

.dashboard-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 8px 18px rgba(0, 0, 0, 0.15);
}

.dashboard-btn {
	background-color: #303f9f;
	color: white;
	border-radius: 30px;
	padding: 6px 20px;
	font-weight: 500;
	transition: all 0.3s ease-in-out;
}

.dashboard-btn:hover {
	background-color: #1a237e;
	color: #fff;
}

@media ( max-width : 768px) {
	.dashboard-card {
		margin-bottom: 20px;
	}
}
</style>



</head>
<body>

	<%@include file="navbar.jsp"%>



	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<!-- Admin Dashboard Section -->
	<div class="container py-5">
		<div class="head">
			<h3 class="text-center mb-4 fw-bold ">
				<i class="fas fa-book me-2"></i> Admin Dashboard
			</h3>
			<p class="text-center  fst-italic" >Welcome back, Admin!
				Manage your books and users with ease.</p>
		</div>
		<div class="row g-4">

			<!-- Add Books -->
			<div class="col-md-3 col-sm-6">
				<div class="card dashboard-card shadow-sm border-0 text-center p-3">
					<div class="card-body">
						<i class="fas fa-book-medical fa-3x mb-3 text-primary"></i>
						<h4 class="fw-semibold">Add Books</h4>
						<p class="text-muted small">Upload and manage new eBooks</p>
						<a href="addbooks.jsp" class="btn dashboard-btn">Go</a>
					</div>
				</div>
			</div>

			<!-- All Books -->
			<div class="col-md-3 col-sm-6">
				<div class="card dashboard-card shadow-sm border-0 text-center p-3">
					<div class="card-body">
						<i class="fas fa-book-open fa-3x mb-3 text-success"></i>
						<h4 class="fw-semibold">All Books</h4>
						<p class="text-muted small">View and manage your entire
							collection</p>
						<a href="allbooks.jsp" class="btn dashboard-btn">View</a>
					</div>
				</div>
			</div>

			<!-- Orders -->
			<div class="col-md-3 col-sm-6">
				<div class="card dashboard-card shadow-sm border-0 text-center p-3">
					<div class="card-body">
						<i class="fas fa-shopping-cart fa-3x mb-3 text-warning"></i>
						<h4 class="fw-semibold">Orders</h4>
						<p class="text-muted small">Check and manage recent orders</p>
						<a href="order.jsp" class="btn dashboard-btn">Open</a>
					</div>
				</div>
			</div>


			<!-- Logout -->
			<div class="col-md-3 col-sm-6">
				<div class="card dashboard-card shadow-sm border-0 text-center p-3">
					<div class="card-body">
						<i class="fas fa-sign-out-alt fa-3x mb-3 text-danger"></i>
						<h4 class="fw-semibold">Logout</h4>
						<p class="text-muted small">Exit from your admin dashboard
							panel</p>
						<a data-toggle="modal" data-target="#exampleModalCenter"
							class="btn dashboard-btn">Logout</a>
					</div>
				</div>
			</div>

		</div>
	</div>




	<!-- model start -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You Want to logout</h4>
						
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
							
						<a href="../logout" type="button" class="btn text-white"
							style="background-color: #303f9f;">Logout</a>



					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>




	<!-- end model -->








	<%@include file="footer.jsp"%>
</body>
</html>