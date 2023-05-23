<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<!--  아이콘 추가하기 -->
	<script src="https://kit.fontawesome.com/54cc554368.js" crossorigin="anonymous"></script>
	<!--  아이콘 추가하기 끝 -->
<meta charset="UTF-8">
<title>placeRankForm</title>
</head>
<body>
	<form id="monthlyRankForm">
		<div>
		    달 : <input type="text" id="month">
	    	<button type="submit">검색</button>
    	</div>
    	<div id="rankArea">
    		<!-- 랭크가 추가되는 위치 -->
    	</div>
    </form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#monthlyRankForm").on("submit", function(e) { // 이메일아이디 중복확인
		e.preventDefault();
		fn_monthRank();
	});
	
	function fn_monthRank() {
		var formData = new FormData();
		var month = $("#month").val();
		formData.append("PLACE_MONTH", month);
		alert(month);
		
		$.ajax({
			url: "/myPlace/placeRank",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			success : function(data, status, xhr) {
				alert(data);
				$("#rankArea").html();
				
				for(var i=0; i<data.length; i++){
					var map = data[i];
					var html = "";
					
					html += '<div>랭킹&nbsp;'+ i+1 + '위: ' + map["PLACE_NAME"] 
						 + '&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-heart" style="color: #ff0000;"></i>'
						 + map["CNT"] +'<br/>'
						 + '</div>';
					
					$("#rankArea").append(html);
				}
			},
			error: function(xhr, status, error){
			}
		});
	}
})
</script>
</html>