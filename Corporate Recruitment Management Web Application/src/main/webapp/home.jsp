<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.JobDAO" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <%@ include file="all_components/all_css.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .card-description {
            font-size: 1rem;
            color: #6c757d;
        }
        .card-footer {
            background-color: #e9ecef;
            border-radius: 0 0 10px 10px;
            padding: 10px;
            text-align: center;
        }
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #89CFF0;
            border-top: 1px solid #ddd;
        }
        .search-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #ffffff;
            margin-bottom: 20px;
        }
        .search-card-body {
            padding: 20px;
        }
        .form-inline {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .form-inline .form-group {
            margin: 0;
        }
        .form-inline .custom-select {
            width: 100%;
        }
    </style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>
    <%@ include file="all_components/navbar.jsp" %>

<c:if test="${not empty succMsg }">
                <div class="alert alert-success text-center" role="alert">
                    ${succMsg}
                </div>
                <c:remove var="succMsg" />
            </c:if> 

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                  <div class="card">
                <div class="card-body">
                    <form class="form-inline" action="more_view.jsp" method="get">
                        <div class="form-group col-md-5 mt-1">
                            <h5>Location</h5>
                        </div>
                        <div class="form-group col-md-4 mt-1">
                            <h5>Category</h5>
                        </div>
                        <div class="form-group col-md-5">
                            <select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
                                <option selected value="loc">Choose</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Mumbai">Mumbai</option>
                                <option value="Kolkata">Kolkata</option>
                                <option value="Chennai">Chennai</option>
                                <option value="Bengaluru">Bengaluru</option>
                                <option value="Hyderabad">Hyderabad</option>
                                <option value="Ahmedabad">Ahmedabad</option>
                                <option value="Pune">Pune</option>
                                <option value="Jaipur">Jaipur</option>
                                <option value="Lucknow">Lucknow</option>
                            </select>
                        </div>
                        <div class="form-group col-md-5">
                            <select name="cat" class="custom-select" id="inlineFormCustomSelectPref">
                                <option value="ca" selected>Choose</option>
                                <option value="">Select Category</option>
                                <option value="Developer">Developer</option>
                                <option value="Banking">Banking</option>
                                <option value="Teacher">Teacher</option>
                                <option value="Engineer">Engineer</option>
                                <option value="IT">IT</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Sales">Sales</option>
                                <option value="Finance">Finance</option>
                                <option value="Human Resources">Human Resources</option>
                            </select>
                        </div>
                        <button class="btn btn-success">Submit</button>
                    </form>
                </div>
            </div>
                
                
                <%
                    JobDAO dao = new JobDAO(DBConnect.getConn());
                    List<Jobs> list = dao.getAllJobsForUser();
                    for (Jobs j : list) {
                %>
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title"><%= j.getTitle() %></h5>
                        <p class="card-description">
                            <%= (j.getDescription().length() > 120) ? j.getDescription().substring(0, 120) + "..." : j.getDescription() %>
                        </p>
                        <div class="d-flex justify-content-between">
                            <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                            <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                        </div>
                        <h6 class="mt-2">Publish Date: <%= j.getPdate().toString() %></h6>
                        <div class="text-center mt-3">
                            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-success btn-sm">View More</a>
                            <a href="apply_job.jsp?jobId=<%= j.getId() %>" class="btn btn-primary btn-sm">Apply</a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>

    <div class="footer">
        <%@ include file="all_components/footer.jsp" %>
    </div>
</body>
</html>
