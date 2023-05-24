<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<!-- 구글 웹 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- 구글 웹 폰트 끝 -->
<!--  아이콘 추가하기 -->
<script src="https://kit.fontawesome.com/54cc554368.js"
	crossorigin="anonymous"></script>
<!--  아이콘 추가하기 끝 -->
<link rel="stylesheet"
	href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/assets/js/common.js'/>"
	charset="utf-8"></script>
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
	top: 100%;
	height: 30%;
	width: 100%;
	display: flex;
	justify-content:center;
	align-items:center;
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
</style>
</head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<body>
	<div class="mainContent" id="mainContent">
		<div class="sidebarArea">
			<%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
		</div>

		<div class="col-10" id="content"
			style="overflow: hidden; width: 85%; position: relative;">
			<div id="mapArea" style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%; height: 100%; position: absolute;">
				<!-- 지도 영역 start -->
				<div id="map" style="width: 100%; height: 100%; border: solid 2px #98A8F8; border-radius: 7px; z-index: 0;"></div>
				<!-- 지도 영역 end -->

				<!-- 게시판 영역 start -->
				<div class="board_hide">
					<div style="width: auto;">
					
					</div>
					<div id="boardArea" style="display: flex; justify-content: center;">
						<div class="table-responsive">
							<!-- <button type="button" value="게시판생성" id="boardBtn">게시글 불러오기</button> -->
							<table class="table-responsive"
								style="border: 1px solid #ccc; margin-left: auto; margin-right: auto;">
								<colgroup>
									<col width="15%" />
									<col width="20%" />
									<col width="40%" />
									<col width="40%" />
								</colgroup>
								<div>&nbsp;</div>
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
							<div id="pagingArea" style="display: flex; justify-content: center;">
								<!-- pageNum이 추가되는 위치 -->
							</div>
						</div>
					</div>
					<div style="width: auto;">
						<div id="addWriteBtn" style="display: flex; justify-content: center; padding-left: 50px;">
							<!--  글쓰기 버튼이 추가되는 위치 -->
							<div class="btn" id="write">글쓰기</div>
						</div>
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
      
      /* 클릭한 place의 게시글을 불러오는 기능 start */
         function fn_selectPage(selectedPage, placeNum){
            var boardPerPage = 5;  //한페이지당 출력할 게시물의 수
            var pagePerGroup = 5; // 그룹당 표시할 페이지 수    
            var currentPage = selectedPage; // 현재 페이지 번호
            var startIdx = currentPage * boardPerPage - ( boardPerPage -1);
            var endIdx = currentPage * boardPerPage;
            
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
      

      
     var boardShow = false; // board영역의 보이는지 여부를 나타내는 변수
      ////////////////////////////////지도 생성///////////////////////////////////////////////
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = { //지도를 생성할 때 필요한 기본 옵션
         center: new kakao.maps.LatLng(37.56677914878755, 126.97862963358072), //지도의 중심좌표.
         level: 9 //지도의 레벨(확대, 축소 정도)
      };
      
      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
      
      ////////////////////////////////지도 생성 끝///////////////////////////////////////////////      
      
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
                        "addr": placeData[i].PLACE_ADDR,
                        "placeNum": placeData[i].PLACE_NUM
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
               
               ////////////////////////////////여러 개의 마커 표시 시작///////////////////////////////////////////////
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
                     
                     var placeNum = placeData[i].PLACE_NUM;
                     
                     //좋아요
                     var iwContent = '<div class="bold"><h2>'+placeData[i].PLACE_NAME
                  + '&nbsp;<i class="fa-solid fa-heart dislikeBtn" style="color: #ff0000;"></i>'
						+ '&nbsp;<i class="fa-solid fa-heart likeBtn" style="color: #000000;"></i>'
						+ '&nbsp;<i type="button" class="fa-solid fa-user" id="likeUser"></i></i></h2>'
						+ '<h5>'+placeData[i].PLACE_ADDR+'</h5></div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                     
                        + '<input class="likePlaceNum" type="hidden" value="' + placeData[i].PLACE_NUM + '">'

                         iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                     
                     var infowindow = new kakao.maps.InfoWindow({
                         content: iwContent,
                         removable: iwRemoveable
                     });
                     
                     kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow, placeNum));
                  }
                 
            /* @@@@@@@@@@ 인포윈도우를 표시하는 클로저를 만드는 함수 start @@@@@@@@@@ */
            function makeOverListener(map, marker, infowindow, placeNum) {
               return function () {
                  infowindow.open(map, marker);
                  
                  /* 마커 클릭 시 해당하는 장소의 게시글들을 불러오는 기능 start */
                  var boardPerPage = 5; // 페이지당 게시글 수
         		  var pagePerBoard = 5; //페이징 할 때 묶을 페이지 수 
                  alert(placeNum);
                  
                  $.ajax({
                     url: '/myPlace/boardCount',
                     type: 'POST',
                     data: {
                        "BOARD_PLACE": placeNum,
                     },
                     dataType: "json",
                     success: function(result) {
                    	 // var x = parseInt(result/boardPerPage)    //몫을 int 값으로 정수만 출력
                         // var y = parseFloat(result/boardPerPage) // 몫을 float 값으로 소수까지 출력
                         var pageNum = Math.ceil(result/pagePerBoard); // 게시글 수를 5로 나누고 소수점 아래를 올림하여 정수로 나타냄
                         var A = Math.ceil(pageNum/5); 
                         var pageList = [];
                         var dataList = [];
                         var currentPNG; // 현재 pageNumGroup. 처음엔 1
                         var pagingHTML = "";
                         /* 
                        if( y-x > 0){      // y-x > 0 이라면 나누어 떨어지지 않는 수 이므로 x 페이징에 +1 를 해야함
                           pageNum = x+1;
                        }else {           // y-x = 0 이라면 pageNum 에 +1 을 할 필요가 없음.
                           pageNum = x;
                        }
                         */
                         
                        var pageNumGroup = [];
                        for (var i = 1; i <= pageNum; i++) {
                       	 pageNumGroup.push(i);
                        }
                        
                        currentPNG = 1;
                        
                        createPageNum(currentPNG);
          
                        // 페이지 번호를 추가
						function createPageNum(currentPNG){
							$("#pagingArea").html("");
							var startPageNum = currentPNG * 5 - 4
                        	
							for (var i = startPageNum; i < startPageNum + 5; i++) {
	                           pagingHTML = '<div class="pageNum">' + i + '</div>';
	                           
	                           $("#pagingArea").append(pagingHTML);
	                        }	
						}
                        	
 
                     }
                  });
          
                  /* 클릭한 page의 게시글 5개를 불러오는 기능 start */
                  fn_selectPage(1, placeNum);
                  /* 클릭한 page의 게시글 5개를 불러오는 기능 end */
                  
                  /* 마커 클릭 시 해당하는 장소의 게시글들을 불러오는 기능 end */
                  
                  $("#addWriteBtn").html('<div class="btn_write" id="write" name="' + placeNum + '">글쓰기</div>');
                  
                  $(".board_hide").addClass('board_show'); // board_show 클래스 추가(top:70%를 우선 적용)
                  boardShow = true;
         
                  $("#likeUser").on("click", function(e){  // 브랜드 회원정보 수정
                     e.preventDefault();
         
                     var formData = new FormData();
                     formData.append("PLACE_NUM", placeNum);
                    
                     $.ajax({
                        url:'/myPlace/idInLikePlace',
                        type:'POST',
                        data:formData,
                        processData: false,
                        contentType: false,
                        success:function(idInLikePlace) {
                           alert(idInLikePlace)
                        },
                        error:function() {
                           alert("서버 오류");
                        }
                     });
                  });
               };
            }
            /* @@@@@@@@@@ 인포윈도우를 표시하는 클로저를 만드는 함수 end @@@@@@@@@@ */
   
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
            alert(placeNum);
            fn_selectPage(currentPage, placeNum);
         });
      
         $(document).on("click", ".title", function(e) {
             e.preventDefault();
             
             var placeNum = $("#write").attr("name");
             var boardDetail = $(this).siblings('.boardNum').text();
             var url = "/myPlace/boardDetail?BOARD_NUM=" + boardDetail + "&BOARD_PLACE=" + placeNum;
             window.location.href = url;
          });
        
		$(document).on("click", "#write", function(e){
		   e.preventDefault();
		   
		   var placeNum = $("#write").attr("name");
		   
		   window.location.href = '/myPlace/boardWrite?BOARD_PLACE='+ placeNum;
		   
		});
      /* 게시판 클릭 기능 */

         
      /* @@@@@@@@@@ 검정하트클릭 @@@@@@@@@@ */ 
      $(document).on('click', '.likeBtn', function(e) {
         e.preventDefault();
         var memId = '<%=(String)session.getAttribute("MEM_ID")%>'
         var placeNum = $(this).siblings('.likePlaceNum').val();
         var placeNum = "1"
         
         $.ajax({
            url: '/myPlace/addLikePlace',
            type:'POST',
            data:{ "LIKEPLACE_MEM": memId, "LIKEPLACE_PLACE": placeNum},
            
            success:function(placeData) {
               alert("내장소 저장");
    		        	 $('.likeBtn').hide();
    		             $('.dislikeBtn').show();
    		        	 },
    		        error:function() {
    		            alert("ㅏ안된당");
    		         }
    		  
    		         }); 
    	});
		
    //빨강하트클릭 
      $(document).on('click', '.dislikeBtn', function(e) {
    	  
    	  e.preventDefault();
    	  var memId = '<%=(String)session.getAttribute("MEM_ID")%>'
    	  
          /* var placeNum = $(this).siblings('.likePlaceNum').val(); */

    	  
    	  /* alert(typeof placeNum) */
    	  
    	  var placeNum = "1"
    	  
    	  
    		  $.ajax({
    		         url: '/myPlace/disLikePlace',
    		         type:'POST',
    		         data:{ "LIKEPLACE_MEM": memId, "LIKEPLACE_PLACE": placeNum},
    		         
    		         success:function(placeData) {
    		        	 alert("내장소 저장취소");
    		        	 $('.dislikeBtn').hide();
    		             $('.likeBtn').show();
            },
               error:function() {
               alert("ㅏ안된당");
            }
         });
      });
    
      /* @@@@@@@@@@ 하트클릭 @@@@@@@@@@ */
      
      });
   
	$(document).on("click", ".likePlace", function(e) {
		// 모든 likePlace 요소에서 btn_write_selected 클래스 제거
		$(".likePlace").removeClass("btn_place_selected");
		// 클릭한 버튼에만 abc 클래스 추가
		$(this).addClass("btn_place_selected");
	});
   
   </script>
</body>

<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</html>