<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	
<style>
.likePlace{
	display: flex!important;
	justify-content: center;
	align-items:center;
	font-size: 20px;
	width:100%;
	margin: 10px;
	border: solid 1px #0d6efd;
	border-radius: 5px;
}

#placeList {
    overflow: auto; /* Add this line to enable scrolling */
    overflow-x: hidden;
    max-height: 80vh; /* Set a maximum height for the sidebar */
}

.likePeople{
	cursor: pointer;
	display: flex!important;
	justify-content: center;
	align-items:center;
	font-size: 20px;
	width:100%;
	margin: 10px;
	border: solid 2px #28DF99;
	border-radius: 5px;
	transition: background-color 0.2s ease; /* 배경색이 서서히 바뀌도록 transition 속성 설정 */
}

.likePeople:hover {
    color: #fff;
    background-color: #28DF99;
    border-color: #0d6efd;
}

</style>

</head>
<body>
	<div style="display: flex; width:220px; flex-direction:column; align-items: center; z-index: 1">
		<%-- <h3 style="margin-left: 13%; color: black;"><%=(String)session.getAttribute("MEM_ID")%>님의 장소</h3> --%>
		<!-- <hr style="border: solid 1px rgb(73, 73, 73); width: 80%; margin-left: 5%;"> -->
		<div id="placeList" style="display:flex; flex-direction:column; align-items:center; height: 100%;">
			<!-- 장소 리스트 추가되는 위치 -->
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>';
		
		$.ajax({
			url: '/myPlace/likePlaceList',
			type: 'POST',
			data: {"MEM_ID" : MEM_ID},
			dataType: "json",
			success: function(data) {
				//data에 담긴 list 항목만큼 반복.
				for(var i=data.length-1; i>=0; i--){
					var map = data[i]; // 각 리스트 요소인 맵을 객체로 정의
					var htmls = "";
					
					htmls += '<div class="likePlace btn btn-outline-primary" style="height: 70px; margin: 5px;">';
					htmls += 	map["LIKEPLACE_NAME"];
					htmls += 	'<input type="hidden" name="likePlaceNum" value="';
					htmls += 		map["LIKEPLACE_PLACE"];
					htmls += 	'"/>';
					htmls += 	'<input type="hidden" name="likePlaceLat" value="';
					htmls += 		map["LIKEPLACE_LAT"];
					htmls += 	'"/>';
					htmls += 	'<input type="hidden" name="likePlaceLng" value="';
					htmls += 		map["LIKEPLACE_LNG"];
					htmls += 	'"/>';
					htmls += 	'<input type="hidden" name="likePlaceAddr" value="';
					htmls += 		map["LIKEPLACE_ADDR"];
					htmls += 	'"/>';
					htmls += '</div>';
					
					$("#placeList").append(htmls);
				}
			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
		
	});
    
	</script>
	
</body>

</html>