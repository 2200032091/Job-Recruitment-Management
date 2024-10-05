<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.JobDAO" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job View</title>
    <%@ include file="all_components/all_css.jsp" %>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            background-color: #fff;
            padding: 30px;
            font-size: 1.2rem;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 20px;
        }
        .card h6 {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .card p {
            font-size: 1.2rem;
            color: #666;
        }
        .form-control-sm {
            font-size: 1rem;
            color: #333;
        }
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #89CFF0;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>
    <%@ include file="all_components/navbar.jsp" %>

    <div class="container"s>
        <div class="row justify-content-center">
            <div class="col-md-10">
                <h3 class="text-center text-primary">Job Details</h3>
                <% 
                    int id = Integer.parseInt(request.getParameter("id"));
                    JobDAO dao = new JobDAO(DBConnect.getConn());
                    Jobs j = dao.getJobById(id);
                %>
                <div class="card mt-4">
                    <div class="card-body">
                        <h6><%= j.getTitle() %></h6>
                        <% 
                            if (j.getDescription().length() > 0 && j.getDescription().length() < 150) {
                        %>  
                        <p><%= j.getDescription() %></p>
                        <% 
                            } else {
                        %>
                        <p><%= j.getDescription().substring(0, 150) %>...</p>
                        <% 
                            }
                        %>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                            </div>
                        </div>
                        <p><b>Publish Date: <%= j.getPdate().toString() %></b></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        Team-32 Project-4
    </div>
</body>
</html>
