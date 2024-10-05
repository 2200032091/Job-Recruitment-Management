<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.JobDAO" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>By category and location</title>
<%@ include file="all_components/all_css.jsp" %>
<style>
    body {
        background-color: #f2f2f2;
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
        padding: 1.5rem;
    }
    .btn-success {
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-success:hover {
        background-color: #0056b3;
        border-color: #004085;
    }
    h5.text-primary {
        font-size: 1.8rem;
        font-weight: bold;
        color: #007bff;
    }
    h4.text-danger {
        font-size: 1.5rem;
        font-weight: bold;
    }
    .text-primary {
        color: #007bff !important;
    }
    .form-control {
        border-radius: 5px;
    }
    .card-title {
        font-size: 1.5rem;
        font-weight: bold;
    }
    .card-text {
        color: #555;
    }
</style>
</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp" />
</c:if>
<%@ include file="all_components/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary mb-4">All Jobs</h5>
            <% 
                String loc = request.getParameter("loc");
                String cat = request.getParameter("cat");
                String msg = "";

                JobDAO dao = new JobDAO(DBConnect.getConn());
                List<Jobs> list = null;
                if ("loc".equals(loc) && "ca".equals(cat)) {
                    list = new ArrayList<Jobs>();
                    msg = "Job Not Available";
                } else if ("loc".equals(loc) || "ca".equals(cat)) {
                    list = dao.getJobsORLocationAndCate(cat, loc);
                } else {
                    list = dao.getJobsAndLocationAndCate(cat, loc);
                }
                if (list == null || list.isEmpty()) {
            %>
            <h4 class="text-center text-danger">Job Not Available</h4>
            <% 
                } else {
                    for (Jobs j : list) {
            %>
            <div class="card mt-4">
                <div class="card-body">
                    <div class="text-center text-primary">
                        <i class="far fa-clipboard fa-2x"></i>
                    </div>
                    <div class="card mt-3">
                        <div class="card-body">
                            <h6 class="card-title"><%= j.getTitle() %></h6>
                            <% 
                                if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                            %>
                            <p class="card-text"><%= j.getDescription() %></p>
                            <% 
                                } else {
                            %>
                            <p class="card-text"><%= j.getDescription().substring(0, 120) %>...</p>
                            <% 
                                }
                            %>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                                </div>
                            </div>
                            <h6>Publish Date: <%= j.getPdate().toString() %></h6>
                            <div class="text-center mt-3">
                                <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-sm btn-success text-white">View More</a>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <% 
                    }
                }
            %>
        </div>
    </div>
</div>

<%@ include file="all_components/footer.jsp" %>
</body>
</html>
