<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 구글 웹 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<!-- 구글 웹 폰트 끝 -->
 	<link rel="stylesheet" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/resources/assets/js/common.js'/>" charset="utf-8"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
<style>
	.mainContent{
		display: flex;
		height: calc(100vh - 300px);
	}
	div {
		font-family: 'Nanum Gothic', sans-serif;
	}
	.bold {
		  font-weight: 700;
	}
</style>
</head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<body>

<hr>
<div class="col-2">
   <%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
 </div>
 <div id="map" style="width:1800px;height:400px;"></div>
<hr>

<div class="col-2"></div>
<div class="col-10">
 	<div class="table-responsive">
		<form id = "frm">
		<table class="table-responsive" style=" border:1px solid #ccc; margin-left: auto; margin-right: auto;">
		     <colgroup>
		        <col width="15%"/>
		        <col width="20%"/>
		        <col width="40%"/>
		        <col width="40%"/>
		     </colgroup>
		   
		    <caption>리뷰</caption>
		    <thead>
		     <tr>
		        <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">글번호</th>
		        <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">작성자</th>
		        <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">제목</th>
		        <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">작성일</th>
		     </tr>
		    </thead>
		    <tbody id="board">
		       <tr>
		        <td colspan="4">조회된 결과가 없습니다.</td>
		     </tr>
		  </tbody>
		 </table>
		</form>
	<a href="#this" class="btn" id="write">글쓰기</a>
	</div>
</div>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269b5ee55a61404f07167949c5348f27"></script>

<script type="text/javascript">
$(document).ready(function(){
	////////////////////////////////지도 생성///////////////////////////////////////////////
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.56677914878755, 126.97862963358072), //지도의 중심좌표.
		level: 9 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	////////////////////////////////지도 생성 끝///////////////////////////////////////////////	
	$.ajax({
		url: '/myPlace/place',
		type:'POST',
        processData: false,
		contentType: false,
		success:function(placeData) {
			var positions = []
			
			for(var i = 0; i<placeData.length; i++){
				positions.push(
					{
						"title": placeData[i].PLACE_NAME, 
						"latlng": new kakao.maps.LatLng(placeData[i].PLACE_LAT, placeData[i].PLACE_LNG),
						"addr": placeData[i].PLACE_ADDR
					}
				);
			}
			console.log(positions);
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			//마커의 이미지
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			
			//장소들의 길이만큼 반복해서 여러개의 마커 표시
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			}
			////////////////////////////////여러 개의 마커 표시 끝///////////////////////////////////////////////

			for (var i = 0; i < positions.length; i++) {
				var marker = new kakao.maps.Marker({
				    map: map,
				    position: positions[i].latlng,
				    clickable: true
				});
				
				var iwContent = '<div class="bold"><h2>'+placeData[i].PLACE_NAME+'</h2><h6>'+placeData[i].PLACE_ADDR+'</h6></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				
				var infowindow = new kakao.maps.InfoWindow({
				    content: iwContent,
				    removable: iwRemoveable
				});
				
				kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
			}	
			
			// 인포윈도우를 표시하는 클로저를 만드는 함수
			function makeOverListener(map, marker, infowindow) {
			    return function () {
			        infowindow.open(map, marker);
			    };
			}
			// 인포윈도우를 닫는 클로저를 만드는 함수
			function makeOutListener(infowindow) {
			    return function () {
			        infowindow.close();
			    };
			}
        },
        error:function() {
        	alert("서버 오류");
        }
	});
	//////////////////////////////////////////////////////////////////////////////////////////
      $("#write").on("click", function(e){ //글쓰기 버튼
         e.preventDefault();
         fn_openBoardWrite();
      });   
   });

   function fn_openBoardWrite(){
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/boardWrite' />");
      comSubmit.submit();
   }
   
   function fn_openBoardDetail(element) {
      var url = "<c:url value='/boardDetail?BOARD_NUM=" + element + "'/>"; // BOARD_NUM 값을 URL에 추가
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl(url);
      comSubmit.submit();
    }
   
</script>   
</body>

<%@ include file="/WEB-INF/include/include-footer.jsp" %>


</html>