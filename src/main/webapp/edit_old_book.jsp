<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BooksDAOImpl" %>
<%@ page import="com.DB.DBconnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Old Book | Ebook</title>
<%@ include file="all_component/allcss.jsp" %>

<style>
/* Container Box */
.table-container {
    max-width: 1100px;
    margin: 60px auto;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    overflow: hidden;
}

/* Title Section */
.table-container h2 { 
    color: #2b3aa3;
    text-align: center;
    padding: 20px;
    font-weight: 600;
    font-size: 22px;
    letter-spacing: 0.5px;
    margin: 0;
}

.table-container h2 i {
    margin-right: 10px;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background-color: #2b3aa3;
    color: #fff;
}

th, td {
    padding: 14px 20px;
    text-align: left;
    font-size: 15px;
    border-bottom: 1px solid #e0e0e0;
}

th {
    font-weight: 600;
    text-transform: uppercase;
}

tbody tr:nth-child(even) {
    background-color: #f3f6fc;
}

tbody tr:hover {
    background-color: #e9efff;
    transition: 0.3s;
}

/* Delete Button */
.btn-delete {
    background-color: #e74c3c;
    color: #fff;
    border: none;
    padding: 6px 14px;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    font-weight: 500;
    text-decoration: none;
    transition: 0.3s;
}

.btn-delete:hover {
    background-color: #c0392b;
}

/* Price Styling */
.price {
    font-weight: 600;
    color: #333;
}

/* Responsive Design */
@media (max-width: 768px) {
    th, td {
        font-size: 13px;
        padding: 10px;
    }

    .table-container {
        margin: 20px;
    }

    .table-container h2 {
        font-size: 18px;
    }
}
</style>
</head>

<body>

<%@ include file="all_component/navbar.jsp" %>


<c:if test ="${not empty succMsg}">
						<div class="alert alert-success text-center">
						${succMsg}
						</div>
						<c:remove var="succMsg"  scope="session"/>
						</c:if>
<div class="table-container">
    <h2><i class="fa-solid fa-pen-to-square"></i> Manage Old Books</h2>

    <table>
        <thead>
            <tr>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Category</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <%
                User u = (User) session.getAttribute("userobj");
                if (u != null) {
                    String email = u.getEmail();
                    BooksDAOImpl dao = new BooksDAOImpl(DBconnect.getConn());
                    List<BookDtls> list = dao.getBookByOld(email, "Old");

                    for (BookDtls b : list) {
            %>
                        <tr>
                            <td><%= b.getBookName() %></td>
                            <td><%= b.getAuthor() %></td>
                            <td class="price">₹<%= b.getPrice() %></td>
                            <td><%= b.getBookCategory() %></td>
                            <td>
                                <form action="delete_old_book" method="get" style="display:inline;">
    <input type="hidden" name="bid" value="<%= b.getBookId() %>">
    <button type="submit" class="btn-delete">Delete</button>
</form>

                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                        <tr>
                            <td colspan="5" style="text-align:center; color:red;">Please login to view your old books.</td>
                        </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="all_component/footer.jsp" %>

</body>
</html>
