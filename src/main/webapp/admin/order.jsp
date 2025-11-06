<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | All Orders</title>
<%@include file="allcss.jsp"%>

<style>


    /* Header Section */
    .admin-header {
        color: #303f9f;
        padding: 35px 0;
        text-align: center;
        border-radius: 0 0 25px 25px;
        margin-bottom: 40px;
    }

    .admin-header h3 {
        font-weight: 600;
        margin: 0;
        letter-spacing: 1px;
    }

    .admin-header p {
        font-size: 14px;
        opacity: 0.9;
        margin-top: 5px;
    }

    /* Table Container */
    .table-container {
        background: #ffffff;
        border-radius: 15px;
        padding: 25px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        overflow-x: auto;
        margin-bottom: 50px;
    }

    /* Table Styling */
    .table {
        border-collapse: separate;
        border-spacing: 0 10px;
    }

    .table th {
        background-color: #303f9f;
        color: #fff;
        font-weight: 600;
        text-align: center;
        vertical-align: middle;
        border: none;
        border-radius: 10px 10px 0 0;
    }

    .table td {
        text-align: center;
        vertical-align: middle;
        background-color: #fff;
        border: none;
        border-bottom: 1px solid #e0e0e0;
        font-size: 15px;
    }

    .table-striped > tbody > tr:nth-of-type(odd) {
        background-color: #f4f6ff;
    }

    /* Status Styles */
    .status-paid {
        background-color: #4caf50;
        color: white;
        padding: 5px 12px;
        border-radius: 6px;
        font-size: 13px;
    }

    .status-cancelled {
        background-color: #e53935;
        color: white;
        padding: 5px 12px;
        border-radius: 6px;
        font-size: 13px;
    }

    .status-pending {
        background-color: #ff9800;
        color: white;
        padding: 5px 12px;
        border-radius: 6px;
        font-size: 13px;
    }

    /* Scrollbar */
    .table-container::-webkit-scrollbar {
        height: 6px;
    }

    .table-container::-webkit-scrollbar-thumb {
        background: #bbb;
        border-radius: 10px;
    }

    @media (max-width: 768px) {
        .admin-header {
            border-radius: 0;
            padding: 25px 0;
        }

        .table-container {
            padding: 15px;
            border-radius: 10px;
        }

        .table th, .table td {
            font-size: 13px;
        }
    }
</style>
</head>

<body>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" ></c:redirect>
</c:if>

    <%@include file="navbar.jsp"%>

    <!-- Admin Header -->
    <div class="admin-header">
        <h3><i class="fas fa-receipt me-2"></i> Admin Dashboard — All Orders</h3>
        <p>View and manage all recent orders placed in your store</p>
    </div>

    <!-- Table Container -->
    <div class="container table-container">
        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                        
                    </tr>
                </thead>
                <tbody>
                
                
                
                <%
                BookOrderImpl dao=new BookOrderImpl(DBconnect.getConn());
                List<Book_Order> blist=dao.getAllOrder();
                for(Book_Order b:blist)
                {%>



					<tr>
						<td><%=b.getOrderId() %></td>
						<td><%=b.getUserName()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getFulladd()%></td>
						<td><%=b.getPhno()%></td>
						<td><%=b.getBookname()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>
                        
                    </tr>
                    
                    
                <%}
                
                
                
                %>
				</tbody>
            </table>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
