<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders | E-Book</title>
<%@include file="all_component/allcss.jsp"%>

<!-- ✅ Internal CSS for full page design -->
<style>

    .containerr {
        width: 90%;
        margin: 50px auto;
        background: #ffffff;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #2c3e9a;
        font-size: 26px;
        margin-bottom: 25px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .table-container {
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 15px;
        border-radius: 10px;
        overflow: hidden;
    }

    thead {
        background-color: #2c3e9a;
        color: white;
    }

    thead th {
        padding: 14px 10px;
        text-align: left;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }

    tbody td {
        padding: 12px 10px;
        border-bottom: 1px solid #e1e1e1;
        color: #333;
    }

    tbody tr:hover {
        background-color: #f1f4ff;
        transition: 0.3s;
    }

    tbody tr td:first-child {
        color: #2c3e9a;
        font-weight: 600;
    }

    .cod {
        color: #28a745;
        font-weight: 600;
    }

    .online {
        color: #007bff;
        font-weight: 600;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        h2 {
            font-size: 22px;
        }

        table {
            font-size: 13px;
        }

        thead th, tbody td {
            padding: 10px 6px;
        }
    }

</style>
</head>
<body style="background-color: #f7f7f7;">


	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

    <div class="containerr">
        <h2><i class="fa-solid fa-cart-shopping"></i>📦 Book Order Details</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Name</th>
                        <th>Book Name</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                <%
                User u=(User)session.getAttribute("userobj");
                BookOrderImpl dao=new BookOrderImpl(DBconnect.getConn());
                List<Book_Order> blist=dao.getboook(u.getEmail());
                for(Book_Order b:blist)
                
                {%>
                
                
                
                <tr>
                        <td><%=b.getOrderId() %></td>
                        <td><%=b.getUserName() %></td>
                        <td><%=b.getBookname() %></td>
                        <td><%=b.getAuthor() %></td>
                        <td><%=b.getPrice() %></td>
                        <td class="cod"><%=b.getPaymentType() %></td>
                    </tr>
                   
                
                
                <%}
                
                %>
                
                
                    
                </tbody>
            </table>
        </div>
    </div>
    
    <%@include file="all_component/footer.jsp"%>

</body>
</html>
