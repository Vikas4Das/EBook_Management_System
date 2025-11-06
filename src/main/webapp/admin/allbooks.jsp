<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BooksDAOImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | All Books</title>
<%@include file="allcss.jsp"%>

<style>
.admin-header {
	color: #303f9f;
	padding: 35px 0;
	text-align: center;
	border-radius: 0 0 25px 25px;
}

.table-container {
	background: #ffffff;
	border-radius: 15px;
	padding: 30px;
	margin-top: 30px;
	margin-bottom: 60px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.table th {
	background-color: #303f9f;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	border-radius: 8px 8px 0 0;
}

.table td {
	vertical-align: middle;
	text-align: center;
}

.btn-primary {
	background-color: #303f9f;
	border: none;
}

.btn-primary:hover {
	background-color: #1f2e85;
}

.btn-danger:hover {
	background-color: #b71c1c;
}

.badge {
	font-size: 13px;
}
</style>
</head>

<body>
	<%@include file="navbar.jsp"%>


	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>


	<!-- Admin Header -->
	<div class="admin-header text-center">
		<h3>
			<i class="fas fa-book me-2"></i> Admin Dashboard — All Books
		</h3>
		<p style="font-size: 14px; opacity: 0.9;">Manage your library
			collection efficiently</p>
	</div>
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg }</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<!-- Table Section -->
	<div class="container-fluid d-flex justify-content-center">
		<div class="table-container col-12 col-md-10 col-lg-9">
			<div class="table-responsive">
				<table class="table table-striped align-middle">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Image</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Category</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>

					<tbody>
						<%
						BooksDAOImpl dao = new BooksDAOImpl(DBconnect.getConn());
						List<BookDtls> list = dao.getAllBooks();
						for (BookDtls b : list) {
						%>
						<tr>
							<td><%=b.getBookId()%></td>
							<td><img src="../book/<%=b.getPhotoName()%>"
								style="width: 60px; height: 60px; border-radius: 8px; object-fit: cover;">
							</td>
							<td><%=b.getBookName()%></td>
							<td><%=b.getAuthor()%></td>
							<td>₹<%=b.getPrice()%></td>
							<td><%=b.getBookCategory()%></td>
							<td><span class="badge bg-success px-3 py-2"><%=b.getStatus()%></span>
							</td>
							<td>
								<div class="d-flex justify-content-center gap-2">
									<a href="editbook.jsp?id=<%=b.getBookId() %>"
										class="btn btn-sm btn-primary"> <i
										class="fas fa-edit me-1"></i>Edit
									</a> <a href="../delete?id=<%=b.getBookId() %>"
										class="btn btn-sm btn-danger ml-1"> <i
										class="fas fa-trash-alt me-1"></i>Delete
									</a>
								</div> 
							</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
