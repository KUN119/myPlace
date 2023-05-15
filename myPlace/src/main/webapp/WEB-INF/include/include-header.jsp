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
      
       
       <div class="col-8">
       <a href="/myPlace/mainPage">
       <img src="./resources/assets/img/myPlace.png" width="200px" height="100px"></a>
       </div>
       
  
        
  
        <div class="col-md-4 justify-content-end align-items-end">
        
			<%=session.getAttribute("MEM_NAME")%> 님 안녕하세요
		
          <button type="button" class="btn btn-outline-primary">Sign-up</button>
          <button type="button" class="btn btn-outline-primary"><a href = '/myPlacd/loginForm'>logout</a></button>
          
        </div>
        
    </div> 
   
<style>
.row {
  margin-top: 20px;
  padding-top: 20px;
}
</style>

</body>

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%-- <script type="text/javascript">
$(document).ready(function() {
	// session이 존재하지 않으면 로그인 페이지로 이동
	if('<%=session.getAttribute("MEM_ID")%>' == "null"){
		alert("세션이 없으므로 로그인으로 이동");
		location.href = 'loginForm';
	}
});

$("#logoutBtn").click(function(e){
	e.stopPropagation();
	
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	
	alert(MEM_ID);
	
	$.ajax({
		  url : "logout"
		, type : 'POST'
		, data : {"MEM_ID" : MEM_ID}
		, dataType : 'text'
		, success: function(result){
			
			alert("로그아웃 성공");
			location.href = "loginForm";
			
		}
		, error: function(error){
			alert("실패");
			console.log("에러 : " + error);
		}
	});
	
});
</script> --%>
</html>