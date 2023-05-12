<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<title>메인 페이지</title>

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

<body>
<div>
	<image-button><a href = '/myPlace/Main'></a></image-button>
   
	<nav>
		<div>
			<%=session.getAttribute("MEM_NAME")%> 님 안녕하세요
		</div>
		<button type="button" id="logoutBtn">logout</button>
	</nav>
</div>
</body>

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
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
</script>