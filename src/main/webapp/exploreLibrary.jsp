<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BooksDAOImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explore Library</title>
<%@include file="all_component/allcss.jsp"%>


<style>
/* --- Responsive Card Adjustments --- */
.card.crd-ho {
	border-radius: 15px;
	transition: all 0.3s ease;
}


/* --- Button Hover Effects --- */
.btn[style*="#303f9f"]:hover {
	background-color: #1f2b7b !important;
}

.btn[style*="red"]:hover {
	background-color: #b30000 !important;
}

.btn[style*="white"]:hover {
	background-color: #f5f5f5 !important;
}

/* --- Image Sizing --- */
.book-img {
	height: 180px;
	width: auto;
	object-fit: contain;
}


</style>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>


	<div class="container my-5 px-4">
		<h3 class="text-center fw-bold mb-4" style="color: #303f9f;">📚
			Explore Our Entire Library</h3>

		<div class="row gy-4 justify-content-center">
			<%
            BooksDAOImpl dao2 = new BooksDAOImpl(DBconnect.getConn());
            List<BookDtls> list2 = dao2.getAllRecentBook();
            for (BookDtls b : list2) {
        %>

			<div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
				<div class="card crd-ho flex-fill shadow-sm text-center mt-2">
					<div class="card-body">
						<img src="book/<%= b.getPhotoName() %>"
							alt="<%= b.getBookName() %>"
							class="book-img mb-3 img-fluid rounded">

						<h6 class="fw-semibold mb-1"><%= b.getBookName() %></h6>
						<p class="text-muted small mb-1"><%= b.getAuthor() %></p>

						<p class="badge bg-success mb-3 text-white">
							Category:
							<%= b.getBookCategory() %>
						</p>

						<div class="d-flex justify-content-center gap-2 flex-wrap">
							<%
                            if (b.getBookCategory().equals("Old")) {
                        %>
							<!-- For Old Books -->
							<a href="viewbooks.jsp?bookId=<%= b.getBookId() %>"
								class="btn btn-sm text-white shadow-sm "
								style="background-color: #303f9f;"> <i
								class="fa-solid fa-eye"></i> View
							</a> <a href="#" class="btn btn-sm shadow-sm mt-1 ml-1"
								style="background-color: white; color: #303f9f; border: 1px solid #303f9f;"> Buy ₹<%= b.getPrice() %>
							</a>
							<%
                            } else {
                        %>
							<!-- For New Books -->
							<a href="cart.jsp?bookId=<%= b.getBookId() %>"
								class="btn btn-sm text-white shadow-sm ml-1"
								style="background-color: red;"> <i
								class="fa-solid fa-cart-plus"></i> Add
							</a> <a href="viewbooks.jsp?bookId=<%= b.getBookId() %>"
								class="btn btn-sm text-white shadow-sm ml-1"
								style="background-color: #303f9f;"> <i
								class="fa-solid fa-eye"></i> View
							</a> <a href="#" class="btn btn-sm shadow-sm mt-1"
								style="background-color: white; color: #303f9f; border: 1px solid #303f9f;"> Buy ₹<%= b.getPrice() %>
							</a>
							<%
                            }
                        %>
						</div>
					</div>
				</div>
			</div>
			<%
            } // closing loop
        %>
		</div>
	</div>

















	<%@include file="all_component/footer.jsp"%>

</body>
</html>