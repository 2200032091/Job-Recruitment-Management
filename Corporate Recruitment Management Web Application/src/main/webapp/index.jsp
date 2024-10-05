<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>

<%@page import="java.io.StringWriter" %>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Job Portal</title>
<%@ include file="all_components/all_css.jsp" %>
<style type="text/css">
 .footer {
        text-align: center;
        padding: 10px;
        background-color: #89CFF0;
        border-top: 1px solid #ddd;
    }

.back-img{
   background:url("img/bgimg.jpg");
   width:100%;
   height:85vh;
   background-repeat:no-repeat;
   background-size:cover;
}

</style>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<%
    Connection conn = null;
    try {
        conn = DBConnect.getConn();
        /* out.println(conn); */
    } catch (Exception e) {
        StringWriter sw = new StringWriter();
        e.printStackTrace(new PrintWriter(sw));
        out.println(sw.toString());
    }
%>
<div class="container-fluid back-img">

   <div class="text-center">
     <h1 class="text-white p-4">
           <i class="fa fa-book" aria-hidden="true"></i>Online Job Portal
     </h1>
   </div>
</div>

<div class="footer">
    <%@ include file="all_components/footer.jsp" %>
</div></body>

</body>
</html>