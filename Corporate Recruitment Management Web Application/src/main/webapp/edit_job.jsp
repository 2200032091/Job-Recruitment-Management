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
    <title>Edit Job</title>
    <%@ include file="all_components/all_css.jsp" %>
    <style>
        body {
            background-color: #f4f7f8;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-body {
            padding: 2rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
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
            display: none;
        }
        .popup-message.error {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>
    <%@ include file="all_components/navbar.jsp" %>

    <c:if test="${userobj.role ne 'admin' }">
        <c:redirect url="login.jsp" />
    </c:if>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="text-center text-primary">Edit Job</h5>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            JobDAO dao = new JobDAO(DBConnect.getConn());
                            Jobs job = dao.getJobById(id);
                        %>
                        <form action="update" method="post">
                            <input type="hidden" name="id" value="<%= job.getId() %>">
                            <c:if test="${not empty succMsg }">
                                <h4 class="text-center text-success">${succMsg}</h4>
                                <c:remove var="succMsg" />
                            </c:if>
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" required class="form-control" name="title" value="<%= job.getTitle() %>">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Location</label>
                                    <select class="form-control" name="location" required>
                                        <option value="<%= job.getLocation() %>"><%= job.getLocation() %></option>
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
                                <div class="form-group col-md-6">
                                    <label>Category</label>
                                    <select class="form-control" name="category" required>
                                        <option value="<%= job.getCategory() %>"><%= job.getCategory() %></option>
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
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="status" required>
                                    <option value="<%= job.getStatus() %>"><%= job.getStatus() %></option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Job Description</label>
                                <textarea class="form-control" name="desc" rows="4" required><%= job.getDescription() %></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Update Job</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="popup-message" id="popupMessage">
        Job updated successfully!
    </div>

    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('success') === 'true') {
                document.getElementById('popupMessage').style.display = 'block';
                setTimeout(() => {
                    document.getElementById('popupMessage').style.display = 'none';
                }, 3000);
            }
        };
    </script>

    <div class="footer">
        <%@ include file="all_components/footer.jsp" %>
    </div>
</body>
</html>
