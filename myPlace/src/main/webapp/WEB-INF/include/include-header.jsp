<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
  
   <div class="row">
   <image-button><a href = '/myPlace/Main'></a></image-button>
      
        <img src="/resources/img/myPlace.png" alt="">
       <div class="clo-9"></div>
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-primary me-2">Login</button>
          <button type="button" class="btn btn-primary">Sign-up</button>
          <button type="button" class="btn btn-primary"><a href = '/myPlacd/loginForm'>logout</a></button>
        </div>
        
    </div> 
   


</body>
</html>