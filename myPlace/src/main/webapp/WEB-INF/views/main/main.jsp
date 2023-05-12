<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>

<body>


<hr>

  <%@ include file="/WEB-INF/include/include-sidebar.jsp"%>

<hr>

<div class="row">
  <div class="col-2">
  <h1 style="text-align: center;">장소리뷰</h1>
  </div>
<div class="col-10">
  
    <table class="table" style="text-align: center;">
    
        
        <thead>
          <tr>
            
            <th scope="col">유저이름</th>
            <th scope="col">리뷰내용</th>
            
          </tr>
        </thead>
        <tbody>
          <tr>
            
            <td>Mark</td>
            <td>Otto러ㅏㅇ넘라언미ㅏㅇ러ㅣㅁㄴ</td>
            
          </tr>
          <tr>
            
            <td>Jacob</td>
            <td>Thorntonㄹㅇㄴㅁㄹㅇㄴㅁ</td>
           
          </tr>
          <tr>
            
            <td>Larry</td>
            <td>the Birdㅇㅂㅈㅇㅈㅂㅇㅈㅂㅇㅂ</td>
            
          </tr>
        </tbody>
    </table>
</div>
</div>


</body>

<%@ include file="/WEB-INF/include/include-footer.jsp" %>


</html>