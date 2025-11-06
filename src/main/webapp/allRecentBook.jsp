<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BooksDAOImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books | Ebook</title>
<%@include file="all_component/allcss.jsp"%>

<style>
/* ===== Styling for Book Cards ===== */
body {
    background-color: #f8f9fa;
}

.card.crd-ho {
    border-radius: 15px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    overflow: hidden;
}


/* ===== Buttons ===== */

.btn[style*="red"]:hover {
    background-color: #b30000 !important;
}

.btn[style*="white"]:hover {
    background-color: #f1f1f1 !important;
}

/* ===== Image Styling ===== */
.book-img {
    height: 180px;
    width: auto;
    object-fit: contain;
    margin-bottom: 15px;
}

h6 {
    color: #303f9f;
    font-weight: 600;
}
</style>
</head>

<body>
<%@include file="all_component/navbar.jsp"%>

<%
    // ✅ Get current logged-in user
    User u = (User) session.getAttribute("userobj");
%>

<div class="container my-5 px-4">
    <h3 class="text-center fw-bold mb-4" style="color: #303f9f;">
        📚 Recent Books
    </h3>

    <div class="row gy-4 justify-content-center">
        <%
            BooksDAOImpl dao2 = new BooksDAOImpl(DBconnect.getConn());
            List<BookDtls> list2 = dao2.getAllRecentBook();

            if (list2 != null && !list2.isEmpty()) {
                for (BookDtls b : list2) {
        %>

        <!-- ====== Single Book Card ====== -->
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
            <div class="card crd-ho flex-fill shadow-sm text-center mt-3">
                <div class="card-body">
                    <img src="book/<%= b.getPhotoName() %>"
                         alt="<%= b.getBookName() %>"
                         class="book-img img-fluid rounded">

                    <h6><%= b.getBookName() %></h6>
                    <p class="text-muted small mb-1"><%= b.getAuthor() %></p>

                    <p class="badge bg-success text-white mb-3">
                        Category: <%= b.getBookCategory() %>
                    </p>

                    <div class="d-flex justify-content-center flex-wrap gap-2">
                        <%
                            if (b.getBookCategory().equalsIgnoreCase("Old")) {
                        %>
                            <!-- ===== Old Book Buttons ===== -->
                            <a href="viewbooks.jsp?bookId=<%= b.getBookId() %>"
                               class="btn btn-sm text-white shadow-sm"
                               style="background-color: #303f9f;">
                                <i class="fa-solid fa-eye"></i> View
                            </a>
                            <a href="#" class="btn btn-sm shadow-sm ml-1"
                               style="background-color: white; color: #303f9f; border: 1px solid #303f9f;">
                               Price ₹<%= b.getPrice() %>
                            </a>
                        <%
                            } else {
                                if (u == null) {
                        %>
                            <!-- ===== Not Logged In ===== -->
                            <a href="login.jsp"
                               class="btn btn-sm shadow-sm text-white"
                               style="background-color: #e74c3c;">
                                <i class="fa-solid fa-cart-plus"></i> Add
                            </a>
                        <%
                                } else {
                        %>
                            <!-- ===== Logged In (Add to Cart) ===== -->
                            <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
                               class="btn btn-sm shadow-sm text-white"
                               style="background-color: #e74c3c;">
                                <i class="fa-solid fa-cart-plus"></i> Add
                            </a>
                        <%
                                }
                        %>
                            <!-- ===== Common View & Buy Buttons ===== -->
                            <a href="viewbooks.jsp?bookId=<%= b.getBookId() %>"
                               class="btn btn-sm text-white shadow-sm ml-1"
                               style="background-color: #303f9f;">
                               <i class="fa-solid fa-eye"></i> View
                            </a>
                            <a href="#" class="btn btn-sm shadow-sm mt-1"
                               style="background-color: white; color: #303f9f; border: 1px solid #303f9f;">
                               Price ₹<%= b.getPrice() %>
                            </a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <%
                } // end for
            } else {
        %>
        <div class="col-12 text-center mt-4">
            <h5 class="text-muted">No recent books available at the moment.</h5>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>
</body>
</html>
