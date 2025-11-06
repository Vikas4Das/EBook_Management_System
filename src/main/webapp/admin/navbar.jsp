<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>


<!-- Header Section -->
<div class="container-fluid p-3 bg-light">
  <div class="row align-items-center">
    
    <!-- Left: Website Title -->
    <div class="col-md-6 d-flex align-items-center">
      <h3 style="color: #303f9f;" class="mb-0">
        <i class="fa-solid fa-book-open-reader"></i> Ebooks
      </h3>
    </div>

    <!-- Right: User Buttons -->
    <div class="col-md-6 d-flex justify-content-end align-items-center">
      <c:if test="${not empty userobj}">
        <a  class="btn btn-success mr-2 text-white">
          <i class="fas fa-user"></i> ${userobj.name}
        </a>
        <a  data-toggle="modal" data-target="#exampleModalCenter"
           class="btn text-white" style="background-color: #303f9f;">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </c:if>

      <c:if test="${empty userobj}">
        <a href="../login.jsp" class="btn btn-success mr-2">
          <i class="fas fa-sign-in-alt"></i> Login
        </a>
        <a href="../register.jsp" class="btn text-white"
           style="background-color: #303f9f;">
          <i class="fas fa-user-plus"></i> Register
        </a>
      </c:if>
    </div>

  </div>
</div>



<!-- Logout -->

<!-- Button trigger modal -->


<!-- Modal -->
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="../logout" type="button" class="btn text-white" style="background-color: #303f9f;">Logout</a>

	
				
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>













<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<a class="navbar-brand" href="#"><i class="fa-solid fa-house-user"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
	</div>
</nav>







