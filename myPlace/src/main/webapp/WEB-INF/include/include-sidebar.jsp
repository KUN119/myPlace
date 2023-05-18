<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div id="placeList" style="height: 90%; background-color: blue;">
	<h3 style="margin-left: 13%; color: black;"><%=(String)session.getAttribute("MEM_ID")%>님의 장소</h3>
	<hr style="border: solid 1px rgb(73, 73, 73); width: 80%; margin-left: 5%;">
	<!--  -->
	<!-- <div id="placeList" style="height: 90%; background-color: blue;"> -->
		<!-- 장소 리스트 추가되는 위치 -->
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
					
					htmls += '<div class="likePlace" style="height: 50px; background-color: yellow; margin: 5px;">';
					htmls += '<input type="hidden" name="likePlaceNum" value="';
					htmls += map["PLACE_NUM"];
					htmls += '"/>';
					htmls += map["PLACE_NAME"];
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
	
    $(document).on("click", ".likePlace", function(e) {
        e.preventDefault();
        var likePlaceNumValue = $(this).find('[name="likePlaceNum"]').val();
        alert(likePlaceNumValue);
    });
	</script>
	
</body>

</html>