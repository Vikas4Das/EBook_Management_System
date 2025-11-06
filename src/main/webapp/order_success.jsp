<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success | Ebook</title>
<%@include file="all_component/allcss.jsp"%>

<style>
body {
    background-color: #f0f1f2;
    font-family: 'Poppins', sans-serif;
}

.success-container {
    max-width: 700px;
    margin: 80px auto;
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0px 6px 18px rgba(0,0,0,0.1);
    text-align: center;
    padding: 50px 40px;
}

.success-icon {
    color: #28a745;
    font-size: 70px;
    margin-bottom: 20px;
    animation: pop 0.5s ease-in-out;
}

@keyframes pop {
    0% { transform: scale(0); opacity: 0; }
    80% { transform: scale(1.1); opacity: 1; }
    100% { transform: scale(1); }
}

.success-container h1 {
    font-size: 2rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 10px;
}

.success-container h2 {
    font-size: 1.3rem;
    color: #555;
    margin-bottom: 20px;
}

.success-container h5 {
    font-size: 1rem;
    color: #666;
    margin-bottom: 30px;
}

.success-container a {
    text-decoration: none;
    font-weight: 500;
    border-radius: 6px;
    transition: all 0.3s ease;
}

.btn-primary {
    background-color: #303f9f;
    border: none;
    padding: 10px 25px;
    margin: 0 10px;
}

.btn-primary:hover {
    background-color: #1a237e;
}

.btn-danger {
    background-color: #e74c3c;
    border: none;
    padding: 10px 25px;
    margin: 0 10px;
}

.btn-danger:hover {
    background-color: #c0392b;
}
</style>
</head>

<body>

<%@include file="all_component/navbar.jsp"%>

<div class="success-container">
    <i class="fa-solid fa-circle-check success-icon"></i>
    <h1>Thank You!</h1>
    <h2>Your Order Has Been Placed Successfully 🎉</h2>
    <h5>Within <strong>7 days</strong>, your product will be delivered to your address.</h5>

    <div>
        <a href="index.jsp" class="btn btn-primary mt-3">🏠 Home</a>
        <a href="order.jsp" class="btn btn-danger mt-3">📦 View My Orders</a>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>
</body>
</html>
