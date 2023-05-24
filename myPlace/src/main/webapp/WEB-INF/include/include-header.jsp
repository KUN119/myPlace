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

<style>
/* 구글 폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

.title_1{
	font-family: 'Jeju Gothic', cursive;
	font-size: 40px;
	display: flex;
	align-items: center;
	justify-content:flex-end;
	color: #0d6efd;
}

</style>

</head>
<body>
	<div style="display: flex; padding: 0 15px 0 15px; justify-content: space-between;">
		<div class="title_1">
			<%=session.getAttribute("MEM_ID")%>'s place
		</div>
		<div>
			<a href="/myPlace/mainPage">
				<!-- myPlace 로고 -->
				<img src="./resources/assets/img/myPlace.png" width="200px" height="100px">
			</a>
		</div>
		<div style="display: flex; justify-content:flex-end; align-items: center;">
			<%=session.getAttribute("MEM_NAME")%> 님 안녕하세요
			&nbsp;
			<button type="button" class="btn btn-outline-primary" id="logoutBtn">logout</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-primary" onClick="location.href='/myPlace/placeRankForm'">월별 랭킹</button>
		</div>
	</div>
</body>

<script>
$(document).ready(function() {
	// session이 존재하지 않으면 로그인 페이지로 이동
	if('<%=session.getAttribute("MEM_ID")%>' == "null"){
		location.href = 'loginForm';
	}
});

$("#logoutBtn").click(function(e){
   e.stopPropagation();
   
   var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
   
   $.ajax({
        url : "logout"
      , type : 'POST'
      , data : {"MEM_ID" : MEM_ID}
      , dataType : 'text'
      , success: function(result){
         
         location.href = "loginForm";
         
      }
      , error: function(error){
         alert("실패");
         console.log("에러 : " + error);
      }
   });
   
});
</script>
</html>