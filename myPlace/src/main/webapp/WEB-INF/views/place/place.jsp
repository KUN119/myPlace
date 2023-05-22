<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
div h2{
	color:blue;
	padding: 5px;
	margin-top: 0;
	font-family: "NotoSansKR";
}
div h5{
	padding: 5px;
	margin-top: 0;
	font-family: "NotoSansKR";
}

.info {
	ght: auto;
            width: auto;
            padding: 5px;
            margin-top: -15p	font-size: 12px;
		padding: 5px;
        }

.info .title {
		font-weight: bold;
        }
 .ifw {
            heix;
        }
        
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="map" style="width:1800px;height:800px;"></div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269b5ee55a61404f07167949c5348f27"></script>

<script type="text/javascript">

	////////////////////////////////지도 생성///////////////////////////////////////////////
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.56677914878755, 126.97862963358072), //지도의 중심좌표.
		level: 9 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	////////////////////////////////지도 생성 끝///////////////////////////////////////////////	
	
	var data = ${placeData};
	
	var positions = []
	
	for(var i = 0; i<data.length; i++){
		positions.push(
			{
				"title": data[i].PLACE_NAME, 
				"latlng": new kakao.maps.LatLng(data[i].PLACE_LAT, data[i].PLACE_LNG),
				"addr": data[i].PLACE_ADDR
			}
		);
	}
	
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
		
		var iwContent = '<div class="bold"><h2>'+data[i].PLACE_NAME+'</h2><h5>'+data[i].PLACE_ADDR+'</h5></div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						+ '<div class="row mb-4">'
			  		    + '<div id="goodsLikeDiv" class="col-lg-3 align-self-center">'
					  	+ '<p class="h6">'
					  	+ '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
						+ '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>'
						+ '</svg>&nbsp;'
						+ '</p>'
					    + '</div>'
					    + '</div>',
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
</script>
</html>