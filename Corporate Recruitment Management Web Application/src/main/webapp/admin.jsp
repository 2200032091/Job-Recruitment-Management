<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@ include file="all_components/navbar.jsp" %>
<div class="container-fluid back-img">

   <div class="text-center">
     <h1 class="text-black p-4">
           <i class="fa fa-book" aria-hidden="true"></i>Welcome Admin
     </h1>
   </div>
</div>
<div class="footer">
    <%@ include file="all_components/footer.jsp" %>
</div>
</body>
</html>

