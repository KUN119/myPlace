<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<!-- 구글 웹 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<!-- 구글 웹 폰트 끝 -->

<!--  아이콘 추가하기 -->
<script src="https://kit.fontawesome.com/54cc554368.js" crossorigin="anonymous"></script>
<!--  아이콘 추가하기 끝 -->

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/assets/js/common.js'/>" charset="utf-8"></script>
<meta charset="UTF-8">
<title>MyPlace</title>

<style>
/* 구글 폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

h5 {
	word-break: break-all;
}
.cursor_pointer{
	cursor: pointer; 
}

/* 글쓰기 버튼 관련 start*/
.btn_write{
	cursor: pointer;
	border: 2px solid #BFEAF5;
	border-radius: 10px;
	padding: 7px 15px;
	background-color: #EAFDFC;
	transition: background-color 0.2s ease; /* 배경색이 서서히 바뀌도록 transition 속성 설정 */
}
.btn_write:hover {
    color: #0d6efd;
    background-color: #BFEAF5;
    border-color: #BFEAF5;
}
/* 글쓰기 버튼 관련 end */

/* 버튼을 클릭할 때 추가하는 속성, 나머지는 해제 */
.btn_place_selected{
	color: #fff!important;
	background-color: #0d6efd!important;
	border-color: #0d6efd!important;
}

.board_show {
	top: 70% !important;
}

.board_hide {
	position: absolute;
	top: 100% ;
	height: 30%;
	width: 100%;
	display: flex;
	/* justify-content:center; */
	/* align-items:center; */
	transition: all .3s ease-out;
	border: solid 2px #66B2FF;
	border-radius: 0 0 7px 7px;
	background-color: #fff;
}

.mainContent {
	display: flex;
	height: calc(100vh - 120px);
}

.sidebarArea {
	display: flex;
	flex-direction: column;
}

.pageNum {
	margin: 5px;
	cursor: pointer;
}

.likeBtn {
	color: #000000;
}

.dislikeBtn {
	color: #ff0000;
}

.popup{
	position: relative;
	width: 200px;
	height: 200px;
	margin: 0 auto;
	animation: expand 0.2s ease-in-out forwards; /* 키프레임 지속시간  */
}

@keyframes expand {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}

.reverse-expand-animation {
  animation: reverse-expand 0.2s ease-in-out forwards;
}

@keyframes reverse-expand {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}

.category{
	float: left;
	width: 100px;
	height: 100px;
	background-color: #fff;
	border: 1.5px solid gray;
	display: flex;
	justify-content: center;
	align-items: center;
}

.category:hover{
	font-size: 25px;
}

.popup .category:nth-child(1) {
	border-top-left-radius: 100%;
	background-color: #FFACAC;
	padding-left: 20px;
	padding-top: 20px;
}

.popup .category:nth-child(1):hover {
	background-color: #F266AB!important;
}

.popup .category:nth-child(2) {
	border-top-right-radius: 100%;
	background-color: #97DEFF;
	padding-right: 20px;
	padding-top: 20px;
}

.popup .category:nth-child(2):hover {
	background-color: #6DA9E4!important;
}

.popup .category:nth-child(3) {
	border-bottom-left-radius: 100%;
	background-color: #FFFBAC;
	padding-left: 20px;
	padding-bottom: 20px;
}

.popup .category:nth-child(3):hover {
	background-color: #F7D060!important;
}

.popup .category:nth-child(4) {
	border-bottom-right-radius: 100%;
	background-color: #98EECC;
	padding-right: 20px;
	padding-bottom: 20px;
}

.popup .category:nth-child(4):hover {
	background-color: #A8E890!important;
}

.placeDetail{
	display: flex;
	flex-direction: column;
	padding: 5px;
	margin-right: 10px;
	background-color: #fff;
	white-space: nowrap;
}

.placeDetail_grandParent{
	padding: 5px;
	border: 1.5px solid #0d6efd!important;
	border-radius: 5px;
	white-space: nowrap;
	overflow: hidden;
}

.placeName_parent{
	left: 50%!important;
	transform: initial;
	white-space: nowrap;
	background-color: #fff;
	border: 1px solid gray;
}

.placeName_grandParent{
	position: relative!important;
	display: flex!important;
	width: auto!important;
	height: auto!important;
	justify-content: center;
	align-items: center;
}

</style>
</head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<body>
<div>${placeSearch.PLACE_NUM}</div>

	<div class="mainContent" id="mainContent">
		<div class="sidebarArea">
			<%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
		</div>

		<div class="col-10" id="content"
			style="overflow: hidden; width: 85%; position: relative;">
			<div id="mapArea" style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%; height: 100%; position: absolute;">
				<!-- 지도 영역 start -->
				<div id="map" style="position: relative; width: 100%; height: 100%; border: solid 2px #98A8F8; border-radius: 7px; z-index: 0;"></div>
				<div id="popup" style="position: absolute; display: none;">
					<div class="category" style="cursor: pointer;" id="CS2">
						편의점
					</div>
					<div class="category" style="cursor: pointer;" id="FD6">
						음식점
					</div>
					<div class="category" style="cursor: pointer;" id="CE7">
						카페
					</div>
					<div class="category" style="cursor: pointer;" id="PM9">
						약국
					</div>
				</div>
				<!-- 지도 영역 end -->

				<!-- 게시판 영역 start -->
				<div class="board_hide">
					<!-- <div style="width: 100px;">
						게시판 좌측 비어있는 공간
					</div> -->
					<div id="boardArea" style="/* display: flex; */ justify-content: center; width: 100%;">
						<div class="table-responsive">
							<!-- <button type="button" value="게시판생성" id="boardBtn">게시글 불러오기</button> -->
							<table class="table-responsive"
								style="border: 1px solid #ccc; margin-left: auto; margin-right: auto; width: 100%;">
								<colgroup>
									<col width="15%" />
									<col width="20%" />
									<col width="40%" />
									<col width="40%" />
								</colgroup>
								<!-- <div>&nbsp;</div> -->
								<thead>
									<tr style="background-color: #BFEAF5; border: 2px solid #fff;">
										<th scope="col" style="text-align:center; border-right: 2px solid #fff; border-bottom: 1px solid #ccc;">글번호</th>
										<th scope="col" style="text-align:center; border-right: 2px solid #fff; border-bottom: 1px solid #ccc;">작성자</th>
										<th scope="col" style="text-align:center; border-right: 2px solid #fff; border-bottom: 1px solid #ccc; width:500px;">제목</th>
										<th scope="col" style="text-align:center; border-right: 2px solid #fff; border-bottom: 1px solid #ccc;">작성일</th>
									</tr>
								</thead>
								<tbody id="board">
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<div  style="display: flex; justify-content: center;">
								<div id="prevBtnHTML">
									<!--  prevBtn 이 추가되는 위치 -->	
								</div>
								<div id="pagingArea" style="display: flex; justify-content: center;">
									<!-- pageNum이 추가되는 위치 -->
								</div>
								<div id="nextBtnHTML">
									<!--  nextBtn 이 추가되는 위치 -->
								</div>
							</div>
						</div>
					</div>
					<div style="width: 20%;">
						<div id="addWriteBtn" style="display: flex; justify-content: center; align-items: center;
	height: 100%; /* padding-left: 50px; */">
							<!--  글쓰기 버튼이 추가되는 위치 -->
							
							<div class="btn" id="write">글쓰기</div>
						</div>
					<input type="text" value="${test.AA }">
					</div>
				</div>
				<!-- 게시판 영역 end -->
			</div>
		</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269b5ee55a61404f07167949c5348f27"></script>

<script type="text/javascript">

   function fn_openBoardDetail(element) {
      var url = "<c:url value='/boardDetail?BOARD_NUM=" + element + "'/>"; // BOARD_NUM 값을 URL에 추가
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl(url);
      comSubmit.submit();
    }
   
</script>

<!-- 카카오 맵 기능 -->
<script type="text/javascript">
	
	$(document).ready(function(){
		var CC; //currentPage
		var AA = 1; // 현재 페이지 덩어리
		var placeNum;
		
		////////////////////////////////지도 생성///////////////////////////////////////////////
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.56677914878755, 126.97862963358072), //지도의 중심좌표.
			level: 9 //지도의 레벨(확대, 축소 정도)
			};
      
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		////////////////////////////////지도 생성 끝///////////////////////////////////////////////
		
		/* @@@@@@@@@@@@@@@@@@@@@@ 지도 관련 기능 추가 start @@@@@@@@@@@@@@@@@@@@@@ */
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
		/* @@@@@@@@@@@@@@@@@@@@@@ 지도 관련 기능 추가 end @@@@@@@@@@@@@@@@@@@@@@ */
		
		var marker = new kakao.maps.Marker()
		var markers = [];
		
		var positions = []; //장소 정보를 담을 객체
		
		var category = ""; //장소를 조회할 카테고리
		var lat = ""; // 위도
		var lng = ""; // 경도
		
		var mapClickable = true;
		
		/* 지도를 클릭하여 해당 위치의 위도,경도를 확보 start */
		
		/* 맵상에 클릭한 위치에 popup요소를 보이게 한다 start */
		var mapClickPopup = function(e){
			var leftPosition = e.pageX - 320; // 클릭한 위치의 X 좌표
			var topPosition = e.pageY - 200; // 클릭한 위치의 Y 좌표
			$("#popup").css({ left: leftPosition, top: topPosition }); // 팝업 창의 위치 설정
			
			$("#popup").removeClass("popup");
			$("#popup").removeClass("reverse-expand-animation");
			$("#popup").addClass("popup");
			$("#popup").show(); // 팝업 창 보이기	
		}
		/* 맵상에 클릭한 위치에 popup요소를 보이게 한다 end */
		
		/* 마우스up 위치의 위도, 경도를 저장 start */
		kakao.maps.event.addListener(map, 'mouseup', function(mouseEvent) {
			var latlng = mouseEvent.latLng; // 위도, 경도를 담을 객체
		    lat = latlng.getLat(); // 클릭한 위치의 위도
		    lng = latlng.getLng(); // 클릭한 위치의 경도
		    
		    if(mapClickable == true){
		    	$('#map').on('click', mapClickPopup); // 맵을 클릭했을 때 동작하는 팝업 이벤트를 off
		    }
		});
		/* 마우스up 위치의 위도, 경도를 저장 end */
		
		// 마우스가 인포윈도우2 영역에 들어오고 나갈 때 mapClickable 상태를 수정
		$(document).on('mouseover', '.placeDetail', function(e){
			mapClickable = false;
			$('#map').off('click', mapClickPopup); // 맵을 클릭했을 때 동작하는 팝업 이벤트를 off
		})
		$(document).on('mouseout', '.placeDetail', function(e){
			mapClickable = true;
		})
		
		/* 마우스가 popup 영역을 벗어났을 때 popup이 사라지는 기능 start */
		$('#popup').mouseleave(function() {
			$("#popup").addClass("reverse-expand-animation");
		});
		/* 마우스가 popup 영역을 벗어났을 때 popup이 사라지는 기능 end */
		
		/* @@@@@@@@@@ 카테고리를 선택했을 때 @@@@@@@@@@ */
		$(document).on("click", ".category", function(e) {
			e.preventDefault();
			category = e.target.id;
			
			$("#popup").hide(); // 팝업 창 숨기기
			$("#popup").removeClass("popup");
			
			// 장소를 검색할 장소와 카테고리 정보
			var searchData = {
					"lat" : lat,
					"lng" : lng,
					"category" : category
				}
			
			var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			/* @@@@@ 선택한 위치정보를 기반으로 kakao로부터 정보를 불러온다 start @@@@@ */
			$.ajax({
				url: '/myPlace/searchPlace',
				type:'POST',
				data: searchData,
				dataType: "json",
				success:function(placeData) {
					
					/* 기존의 마커를 삭제 start */
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null); // 마커 객체의 지도 연결을 해제하여 삭제
					}
					
					markers = []; // 배열 초기화
					
					/* 기존의 마커를 삭제 end */
					
					positions = [] // 장소정보 초기화
					
					/* positions에 리턴된 결과정보를 주입 start */
					for(var i = 0; i<placeData.length; i++){
						positions.push({
							"title": placeData[i]["name"], 
							"latlng": new kakao.maps.LatLng(placeData[i]["lat"], placeData[i]["lng"]),
							"addr": placeData[i]["addr"],
							"placeNum": placeData[i]["id"]
						});
					}
					/* positions에 리턴된 결과정보를 주입 end */
					
					/* 마커 표시를 위한 과정 start */
					for (var i = 0; i < positions.length; i++) {
						marker = new kakao.maps.Marker({
							map: map,
							position: positions[i].latlng,
							clickable: true
						});
						
						// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
						// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						var iwContent = '<div class="placeName" style="display: inline-flex; margin: 0!important; align-items:center; min-width: 50px; flex-wrap: nowrap!important; height: 30px!important; padding:5px;">'
										+ placeData[i]["name"]
										+ '</div>';

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
							content : iwContent
						});
						
						/* @@@@@ 마커를 클릭 시 팝업되는 인포윈도우2 설정 start @@@@@ */
						// 세션으로부터 좋아요한 장소 리스트를 가져온다
						var jsonList = '<%= session.getAttribute("PLACE_LIST") %>';
						// JSON 문자열을 JavaScript 객체로 변환
						var data = JSON.parse(jsonList);
						// 변수를 추가하여 기본값을 false로 설정
						var liked = false;
						// 마커를 클릭했을 때 표시되는 인포윈도우2
						var iwContent2 = '';
						
						// 변환된 JavaScript 객체 사용 예시
						for (var a = 0; a < data.length; a++) {
							var map2 = data[a];
							if (map2["LIKEPLACE_PLACE"] == placeNum) {
	                  	    	// 좋아하는 장소가 있는 경우 하트를 빨간색으로 설정
								iwContent2 = '<div class="placeDetail">'
									+	'<h2>'
									+	'<div style="display:flex;">'
									+		'<div id="placeName">'
									+	 		placeData[i]["name"]
									+		'</div>'
									+		'&nbsp;<i class="fa-solid fa-heart dislikeBtn" ></i>' //빨간하트
									+		'&nbsp;<i type="button" class="fa-solid fa-user" id="likeUser"></i>' // 사람아이콘
									+	'</div>'
									+	'</h2>'
									+	'<div>'
									+		'&nbsp;'
									+	'</div>'
									+	'<div>'
									+		'<h5>'+placeData[i]["addr"]+'</h5>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									+	'</div>'
									+	'<input type="hidden" class="likePlaceNum" value="' + placeData[i]["id"] + '">'
									+	'<input type="hidden" class="placeLat" value="' + placeData[i]["lat"] + '">'
									+	'<input type="hidden" class="placeLng" value="' + placeData[i]["lng"] + '">'
									+ '</div>'
									
									liked = true; // 좋아요 상태를 true로 설정
									break; // 이미 좋아하는 장소를 찾았으므로 루프를 종료
									}
								}
						
							if (!liked){
								// 좋아하는 장소가 없는 경우 하트를 검은색으로 설정
								iwContent2 = '<div class="placeDetail">'
									+	'<h2>'
									+	'<div style="display:flex;">'
									+		'<div id="placeName">'
									+	 		placeData[i]["name"]
									+		'</div>'
									+		'&nbsp;<i class="fa-solid fa-heart likeBtn" ></i>' //까만하트
									+		'&nbsp;<i type="button" class="fa-solid fa-user" id="likeUser"></i>' // 사람아이콘
									+	'</div>'
									+	'</h2>'
									+	'<div>'
									+		'&nbsp;'
									+	'</div>'
									+	'<div>'
									+		'<h5>'+placeData[i]["addr"]+'</h5>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									+	'</div>'
									+	'<input type="hidden" class="likePlaceNum" value="' + placeData[i]["id"] + '">'
									+	'<input type="hidden" class="placeLat" value="' + placeData[i]["lat"] + '">'
									+	'<input type="hidden" class="placeLng" value="' + placeData[i]["lng"] + '">'
									+ '</div>'
	                  	        }
							
						var infowindow2 = new kakao.maps.InfoWindow({
							content : iwContent2,
							removable: iwRemoveable
						});
						/* @@@@@ 마커를 클릭 시 팝업되는 인포윈도우2 설정 end @@@@@ */

						// 각 마커에 마우스오버,아웃 이벤트를 적용시켜주는 익명함수
						(function(marker, infowindow) {
							kakao.maps.event.addListener(marker, 'mouseover', function() {
								infowindow.open(map, marker);
								$(".placeName").parent().parent().addClass("placeName_grandParent");
								$(".placeName").parent().addClass("placeName_parent");
								});
							
							kakao.maps.event.addListener(marker, 'mouseout', function() {
								infowindow.close();
								});
							})(marker, infowindow);
						
						// 인포윈도우2 open&close 이벤트를 설정하는 익명함수
						(function(marker, infowindow2, e) {
							kakao.maps.event.addListener(marker, 'click', function() {
								$('#map').off('click',mapClickPopup); // 맵을 클릭했을 때 동작하는 팝업 이벤트를 동작하지 않도록 off
								infowindow2.open(map, marker);
								$(".placeDetail").parent().parent().addClass("placeDetail_grandParent");
								$(".board_hide").addClass('board_show'); // board_show 클래스 추가(top:70%를 우선 적용)
								});
							
							// 지도를 클릭 시 인포윈도우 close
							kakao.maps.event.addListener(map, 'click', function() {
								infowindow2.close(map, marker);
								});
							
							})(marker, infowindow2);
						
						markers.push(marker); // 마커 객체를 배열에 저장
					}
					/* 마커 표시를 위한 과정 end */
					
				},
				error: function(xhr, status, error) {
				console.log('실패');
				}
			});
			/* @@@@@ 선택한 위치정보를 기반으로 kakao로부터 정보를 불러온다 end @@@@@ */
			
		});
		/* @@@@@@@@@@ 카테고리를 선택했을 때 @@@@@@@@@@ */

			////////////////////////////////여러 개의 마커 표시 끝///////////////////////////////////////////////
               

                 
            /* @@@@@@@@@@ 인포윈도우를 표시하는 클로저를 만드는 함수 start @@@@@@@@@@ */
            function makeOverListener(map, marker, infowindow, placeNum) {
               return function () {
                  infowindow.open(map, marker);
 
	               /* 마커 클릭 시 해당하는 장소의 게시글들을 불러오는 기능 start */
	                  var boardPerPage = 5; // 페이지당 게시글 수
	         		  var pagePerBoard = 5; //페이징 할 때 묶을 페이지 수
	         		  
                  $.ajax({
                     url: '/myPlace/boardCount',
                     type: 'POST',
                     data: {
                        "BOARD_PLACE": placeNum,
                     },
                     dataType: "json",
                     success: function(result) {
                         var pageNum = Math.ceil(result/pagePerBoard); // 게시글 수를 pagePerBoard로 나누고 소수점 아래를 올림하여 정수로 나타냄
                         var A = Math.ceil(pageNum/5); // 총 게시글 페이지 덩어리 ( 1~5, 6~10)
                         var B = pageNum%5  // 덩어리(몫)을 구한 후 나머지 값을 구하는 식 (남은 페이징 출력)
                         
						if(result==0){
							pageNum = 1
							A = 1
                       	 }
                         
                         var pageList = [];
                         var dataList = [];
                         var currentPNG; // 현재 pageNumGroup. 현재페이지 덩어리 처음엔 1
                         var pagingHTML = "";
                        var pageNumGroup = [];
                        for (var i = 1; i <= pageNum; i++) {
                       	 pageNumGroup.push(i);
                        }
                        
                        currentPNG = 1;
                        
                        selectPageBoard(A, currentPNG);   // A = 2, currentPNG = 1
                        
                        function selectPageBoard(A, currentPNG) {
                        	  $("#prevBtnHTML").html("");
                        	  var pagingHTML = '<div id="prevBtn"><</div>';
                        	  $("#prevBtnHTML").append(pagingHTML);
                        	
                        	  $("#nextBtnHTML").html("");
							  var pagingHTML = '<div id="nextBtn">></div>';
                        	  $("#nextBtnHTML").append(pagingHTML);

                        	  // 다음 버튼 클릭 시 페이지 이동
                        	
	                        	  $("#nextBtn").click(function() {
	                        		  if(A!=currentPNG){
			                        	    currentPNG++; // currentPNG 값을 증가시킴
			                   				
			                        	    createPageNum(currentPNG); // 증가된 currentPNG 값을 인자로 createPageNum 함수 호출
			                        	    
			                        	    AA = currentPNG
	                        		  }
	                        	  });
                        	  
	                        	  $("#prevBtn").click(function() {
	                        		    if (A == currentPNG) {
	                        		        if (currentPNG > 1) {
	                        		            currentPNG--;
	                        		            createPageNum(currentPNG);
	                        		            AA = currentPNG
	                        		        }
	                        		    }
	                        		});
	                        	  $("#prevBtn, #nextBtn").css("cursor", "pointer");
                        }
                        
                        // 페이지 번호를 추가
						function createPageNum(currentPNG){
							$("#pagingArea").html("");
							var startPageNum = currentPNG * 5 - 4
							
							
							if(A==currentPNG) {
								for(var i = startPageNum; i< startPageNum+B; i++ ){
									pagingHTML = '<div class="pageNum">' + i + '</div>';	                           
			                           $("#pagingArea").append(pagingHTML);
								}
							}else {
								for (var i = startPageNum; i < startPageNum+5; i++) {
		                           pagingHTML = '<div class="pageNum">' + i + '</div>';	                           
		                           $("#pagingArea").append(pagingHTML);
		                        }
							} 
						}
					     createPageNum(currentPNG);
                     }
                  });
                  /* 클릭한 page의 게시글 5개를 불러오는 기능 start */
                  fn_selectPage(1, placeNum);
                  /* 클릭한 page의 게시글 5개를 불러오는 기능 end */
                  
                  /* 마커 클릭 시 해당하는 장소의 게시글들을 불러오는 기능 end */
                  
					$("#addWriteBtn").html('<div class="btn_write" id="write" name="' + placeNum + '">글쓰기</div>');
                  
                  $(".board_hide").addClass('board_show'); // board_show 클래스 추가(top:70%를 우선 적용)
                  
                  
               };
            }
            
            /* @@@@@@@@@@ 인포윈도우를 표시하는 클로저를 만드는 함수 end @@@@@@@@@@ */
			
            function makeOutListener(infowindow) {
			    return function () {
			        infowindow.close();
			    };
			}
            
			/* @@@@@ sidebar에서 동작하는 기능 start @@@@@ */
			/* 클릭한 LIKEPLACE를 지도의 중심으로 위치시킨다. */
			$(document).on("click", ".likePlace", function(e) {
			   e.preventDefault();
			     var likePlaceNum = $(this).find('[name="likePlaceNum"]').val();
			     var likePlaceLat = $(this).find('[name="likePlaceLat"]').val();
			     var likePlaceLng = $(this).find('[name="likePlaceLng"]').val();
			   
			   var moveLatLon = new kakao.maps.LatLng(likePlaceLat, likePlaceLng);
			   // 지도 중심을 이동 시킵니다
			   map.setCenter(moveLatLon);
			   map.setLevel(3);
			   // setCenter 직후 setLevel을 실행 시 마커가 가운데에 위치하지 않아서 setCenter를 한 번 더 실행
			   map.setCenter(moveLatLon);
			});
			/* @@@@@ sidebar에서 동작하는 기능 end @@@@@ */
			
			/* 클릭한 place의 게시글을 불러오는 기능 start */
			function fn_selectPage(selectedPage, placeNum){
			   var boardPerPage = 5;  //한페이지당 출력할 게시물의 수
			   var pagePerGroup = 5; // 그룹당 표시할 페이지 수    
			   var currentPage = selectedPage; // 현재 페이지 번호
			   var startIdx = currentPage * boardPerPage - ( boardPerPage -1);
			   var endIdx = currentPage * boardPerPage;
			
			   CC = currentPage
			
			   var formData = { "BOARD_PLACE": placeNum,
			                    "startIdx" : startIdx,
			                    "endIdx" : endIdx};
			     $.ajax({
			      url: '/myPlace/boardPlace',
			      type: 'POST',
			      data: formData,
			      dataType: "json",
			      success: function(data) {
			         // 게시물 데이터를 반복하여 테이블 행으로 추가
			         $("#board").html("");
			         
			         for (var i = 0; i < data.length; i++) {
			           var map = data[i];
			           var tableHTML = "";
			
			            tableHTML += '<tr style="background-color: #EAFDFC; border: 3px solid #fff">';    
			            tableHTML += '<td class="boardNum" name="boardNum2" style="text-align:center;">' + map["BOARD_NUM"] + '</td>';
			            tableHTML += '<td style="text-align:center;">' + map["BOARD_WRITER"] + '</td>';
			            tableHTML += '<td class="title cursor_pointer" name="title">' + map["BOARD_TITLE"] + '</td>';
			            tableHTML += '<td style="text-align:center;">' + map["BOARD_DATE"] + '</td>';
			            tableHTML += '</tr>';
			
			            // 테이블 HTML을 요소에 추가
			            $("#board").append(tableHTML);
			         }
			         
			      },
			      error: function(xhr, status, error) {
			         console.log('실패');
			      }
			   });
			}
			/* 클릭한 place의 게시글을 불러오는 기능 end */
			
			/* 게시글 제목을 클릭했을 때 디테일 페이지로 이동 start */		
			$(document).on("click", ".title", function(e) {
				e.preventDefault();
				var placeNum = $("#write").attr("name");
				var boardDetail = $(this).siblings('.boardNum').text();
				var url = "/myPlace/boardDetail?BOARD_NUM=" + boardDetail + "&BOARD_PLACE=" + placeNum + "&AA=" +AA + "&currentPage=" + CC;
				window.location.href = url;
				});
			/* 게시글 제목을 클릭했을 때 디테일 페이지로 이동 end */
			
			
			
/* 			
            },
            error:function() {
               alert("서버 오류");
            }
       });
       
        */
       
   
      /* @@@@@ 지도를 클릭하면 게시판 사라짐 start @@@@@ */
      $("#map").on("mousedown", function(e) {
         e.preventDefault();
         if (!$(this).hasClass('board_show')) {
            $(".board_hide").removeClass('board_show'); // board_show 클래스를 제거
         }
      });
      /* @@@@@ 지도를 클릭하면 게시판 사라짐 end @@@@@ */
      
      /* 게시판 클릭 기능 */
         $(document).on("click", ".pageNum", function(e) {
            e.preventDefault();
            var currentPage = $(this).text();
            var placeNum = $("#write").attr("name");
            fn_selectPage(currentPage, placeNum);
         });      
        
      $(document).on("click", "#write", function(e){
         e.preventDefault();
         
         var placeNum = $("#write").attr("name");
         window.location.href = '/myPlace/boardWrite?BOARD_PLACE='+ placeNum + "&AA=" + AA + "&currentPage=" + CC;
         
      });
      /* 게시판 클릭 기능 */
      
	});
   
	/* class="likePlace" 인 요소 클릭 시 배경색상을 바꾸는 기능 start */
	$(document).on("click", ".likePlace", function(e) {
		// 모든 likePlace 요소에서 btn_write_selected 클래스 제거
		$(".likePlace").removeClass("btn_place_selected");
		// 클릭한 버튼에만 abc 클래스 추가
		$(this).addClass("btn_place_selected");
	});
	/* class="likePlace" 인 요소 클릭 시 배경색상을 바꾸는 기능 end */
	
	/* @@@@@@@@@@ 검정하트클릭(좋아요) @@@@@@@@@@ */ 
	$(document).on('click', '.likeBtn', function(e) {
		e.preventDefault();
		//검정하트를 클릭했을때 버튼을 숨기고 보이고
		$(this).addClass('dislikeBtn');
		$(this).removeClass('likeBtn');
		var memId = '<%=(String)session.getAttribute("MEM_ID")%>'
		//siblings 같은 위치에 있는(마커눌렀을때 나오는 상자) 정보들
		var placeName = $(this).siblings('#placeName').text();
		var placeNum = $(this).parent().parent().siblings('.likePlaceNum').val();
		var placeLat = $(this).parent().parent().siblings('.PlaceLat').val();
		var placeLng = $(this).parent().parent().siblings('.PlaceLng').val();
		
		$.ajax({
			// 컨트롤러의 addLikePlace
			url: '/myPlace/addLikePlace', 
			type:'POST',
			data:{ "LIKEPLACE_MEM": memId, "LIKEPLACE_PLACE": placeNum},
			success:function(placeData) {
				/* DB에 장소 추가 */
				
				/* 사이드바에서 id가 placeList인 영역에 해당 장소를 추가(NAME, NUM, LAT, LNG) */
				var htmls = "";
				
				htmls += '<div class="likePlace btn btn-outline-primary" style="height: 70px; margin: 5px;">';
				htmls += 	placeName;
				htmls += 	'<input type="hidden" name="likePlaceNum" value="' + placeNum + '"/>';
				htmls += 	'<input type="hidden" name="likePlaceLat" value="' + placeLat + '"/>';
				htmls += 	'<input type="hidden" name="likePlaceLng" value="' + placeLng + '"/>';
				htmls += '</div>';
				
				//사이드바에 좋아요 장소 추가
				$("#placeList").append(htmls);
				//좋아요 장소 버튼 숨김
				$('input[name="likePlaceNum"][value="' + placeNum + '"]').closest('.likePlace').hide();
				
			},
			error:function() {
				alert("error");
			}    		  
		});
		
	});
	
	/* @@@@@@@@@@ 빨강하트클릭(좋아요취소) @@@@@@@@@@ */
	$(document).on('click', '.dislikeBtn', function(e) {
		e.preventDefault();
		//빨강하트를 클릭했을때 버튼을 숨기고 보이고
		$(this).addClass('likeBtn');
		$(this).removeClass('dislikeBtn');
		var memId = '<%=(String)session.getAttribute("MEM_ID")%>'    	  
		var placeNum = $(this).parent().parent().siblings('.likePlaceNum').val();
		
			$.ajax({
				// 컨트롤러의 disLikePlace
				url: '/myPlace/disLikePlace',
				type:'POST',
				data:{ "LIKEPLACE_MEM": memId, "LIKEPLACE_PLACE": placeNum},
				success:function(placeData) {
					/* DB에서 장소 제거 */
					
					/* 사이드바에서 name="likePlaceNum" 인 요소의 value가 placeNum1인 요소의 부모요소를 삭제*/
					$('input[name="likePlaceNum"][value="' + placeNum + '"]').parent('.likePlace').remove();
					
				},
				error:function() {
					alert("error");
				}
			});
		}); 
      /* @@@@@@@@@@ 하트클릭 end@@@@@@@@@@ */
	
	/* id="likeUser" 인 요소 클릭 시 header, sidebar를 변경 start */
	$(document).on("click", "#likeUser", function(e) {
		e.preventDefault();
		var placeName = $(this).siblings('#placeName').text(); // 클릭한 요소의 형제요소중 id가 placeName인 요소의 글씨
		var placeNum = $(this).parent().parent().siblings('.likePlaceNum').val();
		var formData = {"PLACE_NUM" : placeNum}
		
		/* "title_1"클래스를 갖고있는 요소가 "title_people"클래스를 갖고있지 않다면 */
		if(!$(".title_1").hasClass("title_people")){
			$(".title_1").addClass("title_people");	/* "title_people"클래스를 추가 */
		}
		
		$(".title_1").fadeOut(150); /* 헤더의 좌측 타이틀 페이드아웃 */
		$("#placeList").html("").fadeOut(150); /* sidebar 비우기 & 페이드아웃 */
		
		$(".title_1").text(placeName + "'s people").fadeIn(150); /* "title_1"클래스를 갖고있는 요소의 내용 추가 & 페이드인 */
		$("#placeList").fadeIn(150); /* sidebar 페이드인 */
		
		$.ajax({
			url:'/myPlace/idInLikePlace',
			type:'POST',
			data:formData,
			success:function(data) {
				
				/* 사이드바에 회원들의 id를 추가 */
				for(var i=data.length-1; i>=0; i--){
					var map = data[i]; // 각 리스트 요소인 맵을 객체로 정의
					var htmls = "";
					
					htmls += '<div class="likePeople" style="height: 70px; margin: 5px;">';
					htmls += map["MEM_ID"];
					htmls += '</div>';
					
					$("#placeList").append(htmls);
				}
           },
           error:function() {
              alert("서버 오류");
           }
        });
	});
	/* id="likeUser" 인 요소 클릭 시 header, sidebar를 변경 end */
	
	$(document).on("click", ".likePeople", function(e){
		e.preventDefault();
		var MEM_ID = $(this).text();
		fn_addPlace(MEM_ID);
	})
	
   </script>
</body>

<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</html>