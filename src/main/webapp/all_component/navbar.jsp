 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>


<style>
.cart-icon {
    color:  #303f9f;
    
    
}

.cart-icon:hover {
    color: dark;
   
}
</style>


<div class="container-fluid"
	style="height: 10px; background-color: #303f9f">
</div>

<div class="container-fluid p-3 bg-light">
  <div class="row justify-content-center align-items-center text-center">

    <div class="col-md-3">
      <h3  style="color: #303f9f;" class="mb-0 ">
        <i class="fa-solid fa-book-open-reader "></i> Ebooks
      </h3>
    </div>

    <div class="col-md-6">
      <form class="d-flex justify-content-center" action="search.jsp" method="post">
        <input class="form-control me-3 w-50 " type="search" placeholder="Search" aria-label="Search" name="ch">
        <button class="btn custom-btn px-4 ml-2" type="submit">Search</button>
      </form>
    </div>




		<c:if test="${ not empty userobj}">

			<div class="col-md-3 d-flex justify-content-center mt-2 mt-md-0">

				<a href="cart.jsp"
					class="cart-icon d-inline-flex align-items-center justify-content-center text-decoration-none ">
					<i class="fa-solid fa-cart-plus fa-2x"></i>
				</a> 
				
				<a href="login.jsp" class="btn btn-success me-3 px-4"><i class="fa-solid fa-user"></i> ${userobj.name} </a>
					
				
				
				
					
				<a href="logout" class="btn custom-btn text-white px-4 ml-2"><i
					class="fa-solid fa-arrow-right-to-bracket"></i>  Logout
					</a>
			</div>


		</c:if>



		<c:if test="${empty userobj}">



			<div class="col-md-3 d-flex justify-content-center mt-2 mt-md-0">
				<a href="login.jsp" class="btn btn-success me-3 px-4"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn custom-btn text-white px-4 ml-2"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>



		</c:if>







	</div>
</div>









<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-user"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item active"><a class="nav-link" href=allRecentBook.jsp><i
					class="fa-solid fa-book-open"></i> Recent Book</a></li>

			<li class="nav-item active"><a class="nav-link" href="allNewBook.jsp"><i
					class="fa-solid fa-book"></i> New Book</a></li>


			<li class="nav-item active"><a class="nav-link"
				href="allOldBook.jsp"><i class="fa-solid fa-book"></i> Old Book</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="about.jsp"><i class="fa-solid fa-people-roof"></i> About Us</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit" style="color: #303f9f;">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit" style="color: #303f9f;">
				<i class="fa-solid fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
	
	
	
	
	
	
	
</nav>