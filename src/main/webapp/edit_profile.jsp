<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile | Ebook</title>
<%@ include file="all_component/allcss.jsp" %>

<style>
    body {
        background-color: #f7f7f7;
    }

    .containerr {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 90vh;
    }

    .form-box {
        background-color: #fff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        width: 400px;
    }

    .form-box h3 {
        text-align: center;
        color: #303f9f;
        margin-bottom: 25px;
        font-weight: 600;
    }

    .form-group label {
        font-weight: 500;
        margin-bottom: 5px;
        color: #333;
    }

    .form-controll {
        border-radius: 5px;
        padding: 10px;
        border: 1px solid #ccc;
        margin-bottom: 15px;
        width: 100%;
    }

    .btn-primary {
        background-color: #303f9f;
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        font-weight: 500;
        color: white;
        border: none;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .message {
        text-align: center;
        margin-bottom: 10px;
        font-weight: 600;
    }
</style>
</head>

<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="containerr">
    <div class="form-box">
        <h3><i class="fa-solid fa-user-pen"></i> Edit Profile</h3>

        <!-- ✅ Display messages -->
        <c:if test="${not empty FailedMsg}">
            <h5 class="message text-danger">${FailedMsg}</h5>
            <c:remove var="FailedMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <h5 class="message text-success">${succMsg}</h5>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <!-- ✅ Form -->
        <form action="update_profile" method="post">

            <input type="hidden" value="${userobj.id}" name="id">

            <div class="form-group">
                <label>Name*</label>
                <input type="text" name="name" class="form-controll" value="${userobj.name}" required>
            </div>

            <div class="form-group">
                <label>Email address*</label>
                <input type="email" name="email" class="form-controll" value="${userobj.email}" readonly>
            </div>

            <div class="form-group">
                <label>Phone*</label>
                <input type="text" name="phone" class="form-controll" value="${userobj.phno}" required>
            </div>

            <div class="form-group">
                <label>Password (for verification)*</label>
                <input type="password" name="password" class="form-controll" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>
