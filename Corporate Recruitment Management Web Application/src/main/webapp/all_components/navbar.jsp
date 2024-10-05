<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">


  <a class="navbar-brand" href="#">Online Job Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <c:if test="${userobj.role eq 'admin' }">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="view_jobs.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      
     
      <li class="nav-item">
        <a class="nav-link" href="add_job.jsp"><i class="fas fa-plus-circle"></i>Post Job</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link " href="view_jobs.jsp"><i class="fas fa-eye"></i>View Job</a>
      </li>
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <a href="#" class="btn btn-light"><i class="fas fa-user"></i>${userobj.name }</a>
      <a href="logout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
    
    
   
    
      
    </form>
  </div>
  </c:if>
  
  
     <c:if test="${userobj.role eq 'user' }">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      
     
      <li class="nav-item">
        <a class="nav-link"  href="applied_jobs.jsp" ><i class="fas fa-plus-circle"></i>Applied Jobs</a>
      </li>
      
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <a href="#" class="btn btn-light"><i class="fas fa-user"></i>${userobj.name }</a>
      <a href="logout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
      
    </form>
  </div>
  </c:if>
  
  
  <c:if  test="${empty userobj }">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
 
       
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <a href="login.jsp" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Login</a>
      <a href="signup.jsp" class="btn btn-light"><i class="fas fa-user"></i>SignUp</a>
    </form>
  </div>
  </c:if>
  
  
  
  
    
    
    
</nav>