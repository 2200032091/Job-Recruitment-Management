<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.JobApplicationDAO" %>
<%@ page import="com.DAO.JobDAO" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.JobApplication" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="com.entity.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applied Jobs</title>
    <%@ include file="all_components/all_css.jsp" %>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f9;
            color: #333;
        }
        .container {
            padding: 30px;
        }
        .card {
            border-radius: 10px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            margin-bottom: 20px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 1.5rem;
            color: #007bff;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 1rem;
            color: #555;
        }
        .form-row {
            margin-top: 10px;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            box-shadow: none;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            color: #fff;
            border-top: 1px solid #ddd;
        }
        .delete-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp" />
</c:if>
<%@ include file="all_components/navbar.jsp" %>

<div class="container">
    <h3 class="text-center text-primary mb-4">Applied Jobs</h3>
    <%
        User user = (User) session.getAttribute("userobj");
        JobApplicationDAO jobAppDAO = new JobApplicationDAO(DBConnect.getConn());
        JobDAO jobDAO = new JobDAO(DBConnect.getConn());
        List<JobApplication> jobAppList = jobAppDAO.getUserAppliedJobs(user.getId());
    %>
    <% for (JobApplication jobApp : jobAppList) { 
        Jobs job = jobDAO.getJobById(jobApp.getJobId());
    %>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><%= job.getTitle() %></h5>
            <p class="card-text"><%= job.getDescription() %></p>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <input type="text" class="form-control" value="Location: <%= job.getLocation() %>" readonly>
                </div>
                <div class="form-group col-md-6">
                    <input type="text" class="form-control" value="Category: <%= job.getCategory() %>" readonly>
                </div>
            </div>
            <h6>Publish Date: <%= job.getPdate().toString() %></h6>
            <h6>Application Date: <%= jobApp.getApplicationDate() %></h6>
            <form action="DeleteJobApplicationServlet" method="post">
                <input type="hidden" name="applicationId" value="<%= jobApp.getId() %>">
                <button type="submit" class="delete-btn">Delete Application</button>
            </form>
        </div>
    </div>
    <% } %>
</div>

<%@ include file="all_components/footer.jsp" %>
</body>
</html>
