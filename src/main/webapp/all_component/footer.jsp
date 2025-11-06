<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.footer-link {
	color: #fff;
	text-decoration: none;
	transition: 0.3s;
}

.footer-link:hover {
color: black;
	text-decoration: none;
}

.social-icon {
	color: #fff;
	margin-right: 12px;
	font-size: 1.2rem;
	transition: 0.3s;
}

.social-icon:hover {
color: black;
	transform: translateY(-3px);
}

@media ( max-width : 768px) {
	footer {
		text-align: center;
	}
	.social-icon {
		margin: 0 8px;
	}
}
</style>


<body>
	<!-- 🌙 Footer Start -->
	<footer class="text-white pt-5 pb-3" style="background-color: #303f9f;">
		<div class="container">
			<div class="row gy-4">

				<!-- About Section -->
				<div class="col-md-4">
					<h5 class="fw-bold mb-3">
						<i class="fa-solid fa-book-open-reader"></i> EBook Management
					</h5>
					<p class="small">Discover, read, and manage your favorite
						eBooks with ease. A smart platform for readers and learners
						everywhere.</p>
				</div>

				<!-- Quick Links -->
				<div class="col-md-4 text-md-center">
					<h6 class="fw-bold mb-3">Quick Links</h6>
					<ul class="list-unstyled">
						<li><a href="index.jsp" class="footer-link">Home</a></li>
						<li><a href="about.jsp" class="footer-link">About</a></li>
						<li><a href="exploreLibrary.jsp" class="footer-link">Library</a></li>
						<li><a href="contact.jsp" class="footer-link">Contact</a></li>
					</ul>
				</div>

				<!-- Social Media -->
				<div class="col-md-4 text-md-end">
					<h6 class="fw-bold mb-3">Follow Us</h6>
					<a href="#" class="social-icon"><i
						class="fa-brands fa-facebook-f"></i></a> <a href="#"
						class="social-icon"><i class="fa-brands fa-twitter"></i></a> <a
						href="#" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
					<a href="#" class="social-icon"><i
						class="fa-brands fa-linkedin-in"></i></a>
				</div>
			</div>

			<hr class="mt-4 mb-3" style="border-color: rgba(255, 255, 255, 0.3);">

			<div class="text-center small">
				&copy; 2025 <b>EBook Management System</b>. All Rights Reserved
			</div>
		</div>
	</footer>
	<!-- 🌙 Footer End -->


</body>
</html>