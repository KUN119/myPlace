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
  <div>
    <image-button><a href = '/myPlace/Main'></a></image-button>
     
      <nav>
      <button><a href = '/myPlacd/loginForm'>logout</a></button>
      
      </nav>
  </div>
   
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    
      <a href="main" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
      
        <img src="/resources/img/myPlace.png" alt="">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>
  
        
  
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-primary me-2">Login</button>
          <button type="button" class="btn btn-primary">Sign-up</button>
        </div>
      </header>
   

<style>
    nav {
        float: right;
         display: flex; 
          align-items: center;
    }
    
    body {
      margin-top: 20px;
    }
    
    div {
      display: flex;
      justify-content: space-between; /* 자식 요소를 가로로 정렬 */
      align-items: center; /* 자식 요소를 수직으로 정렬 */
    }
    
     image-button {
      display: inline-block;
      width: 100px; /* 버튼의 너비 조정 */
      height: 100px; /* 버튼의 높이 조정 */
      background-image: url("resources/img/myPlace.png"); /* 버튼 이미지의 경로 설정 */
      background-size: 100px 80%;
      border: none; /* 버튼 스타일링을 위해 테두리 제거 */
      cursor: pointer; /* 커서 스타일 변경 */
    }
</style>
</body>
</html>