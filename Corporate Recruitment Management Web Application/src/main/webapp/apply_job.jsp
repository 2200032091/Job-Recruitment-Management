<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.JobDAO" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="javax.servlet.http.*,java.io.*,javax.servlet.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply Job</title>
    <%@ include file="all_components/all_css.jsp" %>
    <style>
        body {
            background-color: #f4f7f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 2rem;
        }
        .btn-primary {
            background-color: #0056b3;
            border-color: #0056b3;
            font-size: 1.2rem;
            padding: 0.6rem 1.2rem;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #004085;
            border-color: #003366;
        }
        .popup-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            padding: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 5px;
        }
        h5.text-primary {
            font-size: 1.8rem;
            font-weight: bold;
            color: #0056b3;
        }
        h4, p {
            color: #555;
        }
    </style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>
    <%@ include file="all_components/navbar.jsp" %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="text-center text-primary">Apply for Job</h5>
                        <%
                            int jobId = Integer.parseInt(request.getParameter("jobId"));
                            JobDAO jobDAO = new JobDAO(DBConnect.getConn());
                            Jobs job = jobDAO.getJobById(jobId);
                        %>
                        <h4>Title: <%= job.getTitle() %></h4>
                        <p>Description: <%= job.getDescription() %></p>
                        <p>Location: <%= job.getLocation() %></p>
                        <p>Category: <%= job.getCategory() %></p>
                        <p>Publish Date: <%= job.getPdate().toString() %></p>
                        <form action="applyJob" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="jobId" value="<%= job.getId() %>">
                            <div class="form-group">
                                <label for="cv">Upload CV:</label>
                                <input type="file" name="cv" id="cv" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Apply</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${param.success == 'true'}">
        <div class="popup-message">
            Your job application was successful!
        </div>
    </c:if>

    <%@ include file="all_components/footer.jsp" %>
</body>
</html>
