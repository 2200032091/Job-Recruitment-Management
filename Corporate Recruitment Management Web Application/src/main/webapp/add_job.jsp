<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Job</title>
<%@ include file="all_components/all_css.jsp" %>
<style type="text/css">
    html, body {
        height: 100%;
        margin: 0;
        display: flex;
        flex-direction: column;
    }
    .container-fluid {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .card {
        width: 100%;
        max-width: 800px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .footer {
        text-align: center;
        padding: 10px;
        background-color: #89CFF0;
        border-top: 1px solid #ddd;
    }
    .form-row {
        display: flex;
        justify-content: space-between;
    }
    .form-group {
        flex: 1;
        margin-right: 10px;
    }
    .form-group:last-child {
        margin-right: 0;
    }
    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 5px;
        position: relative;
        z-index: 1;
        display: flex;
        align-items: center;
    }
    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    .alert-success .alert-icon {
        font-size: 1.5em;
        margin-right: 15px;
        color: #155724;
    }
    .alert-success .alert-text {
        flex: 1;
    }
    .alert-success .alert-close {
        font-size: 1.5em;
        cursor: pointer;
        color: #155724;
        margin-left: 15px;
    }
</style>
</head>
<body>

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ include file="all_components/navbar.jsp" %>
<div class="container-fluid">
    <div class="row p-5 w-100">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-body">
                    <div class="text-center">
                        <i class="fa fa-briefcase fa-2x" aria-hidden="true"></i>
                        <h4>Add Job</h4>
                    </div>
                    <c:if test="${not empty succMsg }">
                    <div class="alert alert-success">
                        <span class="alert-icon">✔</span>
                        <span class="alert-text">${succMsg}</span>
                        <span class="alert-close" onclick="this.parentElement.style.display='none';">&times;</span>
                    </div>
                    <c:remove var="succMsg" />
                    </c:if> 
                    <form action="add_job" method="post">
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" required="required" class="form-control" name="title">
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Location</label>
                                <select class="form-control" name="location" required="required">
                                    <option value="">Select Location</option>
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
                            <div class="form-group">
                                <label>Category</label>
                                <select class="form-control" name="category" required="required">
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
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="status" required="required">
                                    <option value="">Select Status</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Job Description</label>
                            <textarea class="form-control" name="desc" rows="4" required="required"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary badge-pill btn-block">Publish Job</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <%@ include file="all_components/footer.jsp" %>
</div>
</body>
</html>
