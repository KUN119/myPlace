<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="map" style="width:1500px;height:800px;"></div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269b5ee55a61404f07167949c5348f27"></script>

<script type="text/javascript">

   ////////////////////////////////지도 생성///////////////////////////////////////////////
   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
   var options = { //지도를 생성할 때 필요한 기본 옵션
      center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
      level: 3 //지도의 레벨(확대, 축소 정도)
   };

   var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
   ////////////////////////////////지도 생성 끝///////////////////////////////////////////////   
   
   var data = ${placeData}
   console.log(data);
   
   //var jsonArray = "${jsonArray}";
   //console.log(${jsonArray});
   
   /* var positions = [
       {
           title: "${placeList[0].PLACE_NAME}", 
           latlng: new kakao.maps.LatLng(${placeList[0].PLACE_LAT}, ${placeList[0].PLACE_LNG})
       },
       {
          title: "${placeList[1].PLACE_NAME}", 
           latlng: new kakao.maps.LatLng(${placeList[1].PLACE_LAT}, ${placeList[1].PLACE_LNG})
       },
       {
           title: '텃밭', 
           latlng: new kakao.maps.LatLng(33.450879, 126.569940)
       },
       {
           title: '근린공원',
           latlng: new kakao.maps.LatLng(33.451393, 126.570738)
       }
   ];  */
   
   /* console.log(positions); */
   
   
   //마커의 이미지
   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
   
   //장소들의 길이만큼 반복해서 여러개의 마커 표시
   for (var i = 0; i < positions.length; i ++) {
       
       // 마커 이미지의 이미지 크기 입니다
       var imageSize = new kakao.maps.Size(24, 35); 
       
       // 마커 이미지를 생성합니다    
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
       
       // 마커를 생성합니다
       var marker = new kakao.maps.Marker({
           map: map, // 마커를 표시할 지도
           position: positions[i].latlng, // 마커를 표시할 위치
           title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
           image : markerImage // 마커 이미지 
       });
   }
   ////////////////////////////////여러 개의 마커 표시 끝///////////////////////////////////////////////


</script>
</html>