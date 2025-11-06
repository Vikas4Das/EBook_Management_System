<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allcss.jsp"%>

<style>
body {
    background-color: #f7f7f7;
}

.card {
    border-radius: 10px;
    border: none;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

h4 {
    font-weight: 600;
    color: #303f9f;
}

.btn-danger {
    background-color: #e74c3c;
    border: none;
}

.btn-danger:hover {
    background-color: #c0392b;
}

.btn-warning {
    background-color: #f1c40f;
    color: white;
    font-weight: 500;
}

.btn-warning:hover {
    background-color: #d4ac0d;
    color: white;
}

.btn-success {
    background-color: #27ae60;
    color: white;
    font-weight: 500;
}

.btn-success:hover {
    background-color: #1e8449;
}

.table th, .table td {
    vertical-align: middle;
}
</style>
</head>
<body>

<%@include file="all_component/navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" ></c:redirect>
</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>

		<c:remove var="succMsg" scope="session" />

	</c:if>
	
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>

		<c:remove var="failedMsg" scope="session" />

	</c:if>

	<div class="container my-5">
    <div class="row g-4">
    
        <!-- LEFT SIDE CART -->
        <div class="col-md-7">
            <div class="card p-3">
                <h4 class="mb-3">🛒 Your Cart Items</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Book Name</th>
                            <th>Author</th>
                            <th>Price (₹)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            User u = (User)session.getAttribute("userobj");
                            CartDAOImpl dao = new CartDAOImpl(DBconnect.getConn());
                            List<cart> list = dao.getBookByUser(u.getId());
                            double total = 0;
                            if (list != null && !list.isEmpty()) {
                                for (cart c : list) {
                                    total += c.getPrice();
                        %>
                        <tr>
                            <td><%= c.getBookName() %></td>
                            <td><%= c.getAuthor() %></td>
                            <td>₹<%= c.getPrice() %></td>
                            <td>
                                <a href="remove_book?bid=<%=c.getBid() %>&&uid=<%=c.getUserId() %>&&cid=<%=c.getCid() %>" class="btn btn-danger btn-sm">Remove</a>
                            </td>
                        </tr>
                        <% 
                                }
                            } else { 
                        %>
                        <tr>
                            <td colspan="4" class="text-center text-muted">Your cart is empty 🛒</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <h5 class="text-center fw-bold mt-3" style="color:#303f9f;">Total Price : ₹<%= total %></h5>
            </div>
        </div>

        <!-- RIGHT SIDE DELIVERY DETAILS -->
        <div class="col-md-5">
            <div class="card p-4">
                <h4 class="mb-3">📦 Delivery Details</h4>
                <form action="order" method="post">
                
                <input type="hidden" value="${userobj.id}" name="id">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>Name</label>
                            <input type="text" class="form-control" name ="username" value="<%=u.getName()%>" readonly>
                        </div>
                        <div class="col-md-6">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" value="<%=u.getEmail()%>" readonly>
                        </div>
                        <div class="col-md-6">
                            <label>Mobile No</label>
                            <input type="text" class="form-control" name="phno" value="<%=u.getPhno()%>" required>
                        </div>
                        <div class="col-md-6">
                            <label>Address</label>
                            <input type="text" class="form-control" name="address" required>
                        </div>
                        <div class="col-md-6">
                            <label>Landmark</label>
                            <input type="text" class="form-control" name="landmark">
                        </div>
                        <div class="col-md-6">
                            <label>City</label>
                            <input type="text" class="form-control" name="city" required>
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>State</label> 
                            <select class="form-select" name="state"
									required>
									<option value="">-- Select State --</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>								
									<option value="Chandigarh">Chandigarh</option>
									<option value="Delhi">Delhi (NCT)</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Ladakh">Ladakh</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Puducherry">Puducherry</option>
								</select>
							</div>
                        <div class="col-md-6">
                            <label>Zip</label>
                            <input type="text" class="form-control" name="zip" required>
                        </div>
                        <div class="col-md-12 mt-5">
                            <label>Payment Type</label>
                            <select class="form-select" name="paymentType" required>
                                <option value="noselect">-- Select --</option>
                                <option vlaue="COD">Cash On Delivery</option>
                                
                                
                            </select>
                        </div>
                    </div>

                    <div class="mt-4 d-flex justify-content-between">
                        <button  class="btn btn-warning">Order Now</button>
                        <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>
</body>
</html>
