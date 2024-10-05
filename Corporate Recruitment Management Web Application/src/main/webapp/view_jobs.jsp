<%@page import="com.DAO.JobDAO" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.util.*" %>
<%@page import="com.entity.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin: View Jobs</title>
    <%@ include file="all_components/all_css.jsp" %>
    <style>
        body {
            background-color: #f5f9fc; /* Light blue background */
        }
        .container {
            margin-top: 20px;
        }
        .text-primary {
            color: #003366; /* Dark blue color */
        }
        .card {
            background-color: #ffffff; /* White background for cards */
            border: 1px solid #e0e0e0; /* Light grey border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px); /* Slight lift on hover */
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2); /* More pronounced shadow on hover */
        }
        .card-body {
            padding: 20px;
        }
        .btn-success {
            background-color: #28a745; /* Success green */
            border: none;
        }
        .btn-danger {
            background-color: #dc3545; /* Danger red */
            border: none;
        }
        .btn {
            color: #ffffff;
        }
        .text-success {
            color: #28a745; /* Success green for messages */
        }
        .header {
            font-size: 1.5em;
            font-weight: bold;
            color: #003366; /* Dark blue */
        }
        .form-row {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ include file="all_components/navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center header">All Jobs</h5>

            <c:if test="${not empty succMsg }">
                <div class="alert alert-success text-center" role="alert">
                    ${succMsg}
                </div>
                <c:remove var="succMsg" />
            </c:if> 

            <% 
            JobDAO dao = new JobDAO(DBConnect.getConn());
            List<Jobs> list = dao.getAllJobs();
            for (Jobs j : list) {
            %>
                <div class="card mt-3">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-2x"></i>
                        </div>
                        <h5 class="text-primary"><%= j.getTitle() %></h5>
                        <p><%= j.getDescription() %></p>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-4">
                                <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                            </div>
                            <div class="form-group col-md-4">
                                <input type="text" class="form-control form-control-sm" value="Status: <%= j.getStatus() %>" readonly>
                            </div>
                        </div>
                        <h6>Publish Date: <%= j.getPdate() %></h6>
                        <div class="text-center">
                            <a href="edit_job.jsp?id=<%= j.getId() %>" class="btn btn-success">Edit</a>
                            <a href="delete?id=<%= j.getId() %>" class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
            <% 
            }
            %>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp" %>
</body>
</html>
