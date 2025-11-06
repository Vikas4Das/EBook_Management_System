<%@page import="com.entity.User"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BooksDAOImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@include file="all_component/allcss.jsp"%>


<style>
/* --- Responsive Card Adjustments --- */
.card.crd-ho {
	border-radius: 15px;
	transition: all 0.3s ease;
}

/* --- Button Hover Effects --- */


.btn[style*="red"]:hover {
	background-color: #b30000 !important;
}

.btn[style*="black"]:hover {
	background-color: #f5f5f5 !important;
}

/* --- Image Sizing --- */
.book-img {
	height: 180px;
	width: auto;
	object-fit: contain;
}



  #toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
   

	<%
	User u = (User) session.getAttribute("userobj");
	%>


	<c:if test="${not empty addCart }">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>

	</c:if>


	<%@include file="all_component/navbar.jsp"%>


	<div class="container my-5 px-4">
		<h3 class="text-center fw-bold mb-4" style="color: #303f9f;">📚
			New Books</h3>

		<div class="row gy-4 justify-content-center">
			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBconnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
				<div class="card crd-ho flex-fill shadow-sm text-center mt-3">
					<div class="card-body">
						<img src="book/<%=b.getPhotoName()%>" alt="<%=b.getBookName()%>"
							class="book-img mb-3">
						<h6 class="fw-semibold mb-1"><%=b.getBookName()%></h6>
						<p class="text-muted small mb-1"><%=b.getAuthor()%></p>
						<p class="badge bg-success mb-3 text-white">
							Categories :
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2 flex-wrap">
							<%
							if (u == null) {
							%>
							<a href="login.jsp"
								class="btn  btn-sm shadow-sm" style="background-color: red; color: white;"> <i
								class="fa-solid fa-cart-plus"></i> Add
							</a>
							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn  btn-sm shadow-sm" style="background-color: red; color: white;" > <i
								class="fa-solid fa-cart-plus"></i> Add
							</a>

							<%
							}
							%>
							
							 <a href="viewbooks.jsp?bookId=<%= b.getBookId() %>" 
                               class="btn btn-sm text-white shadow-sm ml-1" 
                               style="background-color: #303f9f;">
                                <i class="fa-solid fa-eye"></i> View
                            </a>
							
							 <a href="#" 
                               class="btn btn-sm shadow-sm ml-1 mt-1" 
                               style="background-color: white; color: #303f9f; border: 1px solid #303f9f;" ">
                                Price ₹<%= b.getPrice() %>
                            </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

















	<%@include file="all_component/footer.jsp"%>

</body>
</html>