<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook Register</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-4 ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center ">✨ Register Here ✨</h4>
						
						<c:if test ="${not empty succMsg}">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg"  scope="session"/>
						</c:if>
						
						<c:if test ="${not empty FailedMsg}">
						<p class="text-center text-danger">${FailedMsg}</p>
						<c:remove var="FailedMsg" scope="session"/>
						</c:if>
						
						<form action="register" method="post">




							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									aria-describedby="name" required="required" name="fname">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="number" class="form-control" id="exampleInputnumber"
									aria-describedby="number" required="required" name="phno">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Condition</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" style="background-color: #303f9f;">Submit</button>
								<br> <a href="login.jsp" style="color: #303f9f;">Login</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>








	<%@include file="all_component/footer.jsp"%>
</body>
</html>