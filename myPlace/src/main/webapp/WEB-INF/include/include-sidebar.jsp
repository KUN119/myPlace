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
	border: solid 2px #0d6efd;
	border-radius: 5px;
	transition: background-color 0.2s ease; /* 배경색이 서서히 바뀌도록 transition 속성 설정 */
}
.likePlace:hover {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
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
		<div id="placeList" style="display:flex; flex-direction:column; align-items:center; height: 80%; overflow-y: scroll;">
			<!-- 장소 리스트 추가되는 위치 -->
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		
		var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>';
		
		fn_addPlace(MEM_ID);
	});
	
	/* id를 통해 좋아요한 장소를 사이드바에 추가 start */
	function fn_addPlace(MEM_ID){
		
		/* "title_1"클래스를 갖고있는 요소가 "title_people"클래스를 갖고있다면 */
		if($(".title_1").hasClass("title_people")){
			$(".title_1").removeClass("title_people");	/* "title_people"클래스를 추가 */
		}
		
		$(".title_1").fadeOut(150); /* 헤더의 좌측 타이틀 페이드아웃 */
		$("#placeList").html("").fadeOut(150); /* sidebar 비우기 & 페이드아웃 */
		
		$(".title_1").text(MEM_ID + "'s place").fadeIn(150); /* "title_1"클래스를 갖고있는 요소의 내용 추가 & 페이드인 */
		$("#placeList").fadeIn(150); /* sidebar 페이드인 */
		
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
					
					htmls += '<div class="likePlace" style="height: 70px; margin: 5px;">';
					htmls += map["PLACE_NAME"];
					htmls += '<input type="hidden" name="likePlaceNum" value="';
					htmls += map["PLACE_NUM"];
					htmls += '"/>';
					htmls += '<input type="hidden" name="likePlaceLat" value="';
					htmls += map["PLACE_LAT"];
					htmls += '"/>';
					htmls += '<input type="hidden" name="likePlaceLng" value="';
					htmls += map["PLACE_LNG"];
					htmls += '"/>';
					htmls += '</div>';
					
					$("#placeList").append(htmls);
				}
			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
	}
	/* id를 통해 좋아요한 장소를 사이드바에 추가 end */
    
	</script>
	
</body>

</html>