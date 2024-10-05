<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="all_components/all_css.jsp" %>
<style type="text/css">
    html, body {
        height: 100%;
        margin: 0;
        display: flex;
        flex-direction: column;
        background: #f0f8ff; /* Light blue background */
        font-family: Arial, sans-serif;
    }
    .container-fluid {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .login-container {
        width: 100%;
        max-width: 400px;
    }
    .card {
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        background: #ffffff; /* White background for the card */
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }
    .card:hover {
        transform: scale(1.02);
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
    }
    .text-center {
        text-align: center;
    }
    .btn-primary {
        background-color: #007bff; /* Primary blue color */
        border-color: #007bff;
        font-weight: bold;
    }
    .btn-primary:hover {
        background-color: #0056b3; /* Darker blue on hover */
        border-color: #004085;
    }
    .popup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 15px;
        background: linear-gradient(145deg, #d4edda, #c3e6cb); /* Soft green gradient */
        border: 1px solid #c3e6cb;
        border-radius: 12px;
        color: #155724; /* Dark green text color */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        z-index: 1000;
        text-align: center;
        font-size: 14px;
        font-weight: bold;
    }
    .popup.show {
        display: block;
    }
    .popup .close {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 20px;
        color: #155724;
        cursor: pointer;
        transition: color 0.3s ease;
    }
    .popup .close:hover {
        color: #a8d5a2; /* Light green on hover */
    }
</style>
</head>
<body>
<%@ include file="all_components/navbar.jsp" %>
<div class="container-fluid">
    <div class="login-container">
        <div class="card">
            <div class="text-center mb-4">
                <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                <h4>Login</h4>
            </div>
            <c:if test="${not empty succMsg }">
            <div class="popup show">
                <span class="close" onclick="document.querySelector('.popup').classList.remove('show')">&times;</span>
                <h4>${succMsg}</h4>
            </div>
            <c:remove var="succMsg" />
            </c:if> 
            <form action="login" method="post">
                <div class="form-group">
                    <label>Enter Email</label>
                    <input type="email" required="required" class="form-control" id="exampleInputEmail1"
                        aria-describedby="emailHelp" name="email">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword">Enter Password</label>
                    <input type="password" required="required" class="form-control" id="exampleInputPassword1"
                        name="password">
                </div>
                <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
