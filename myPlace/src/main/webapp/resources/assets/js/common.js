function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId=="commonForm"){
		var frm = $("#commonForm");
		if(frm.length>0){
			frm.remove();
		}
		var str = "<form id='commonForm' name='commonForm'></form>";
		$('body').append(str);
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();	
	};
}

var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
	this.url = "";		
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.param = "";
	
	if(this.formId == "commonForm"){
        var frm = $("#commonForm");
        if(frm.length > 0){
	        frm.remove();
        }
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.setCallback = function setCallback(callBack){
		fv_ajaxCallback = callBack;
	};

	this.addParam = function addParam(key,value){ 
		this.param = this.param + "&" + key + "=" + value; 
	};
	
	this.ajax = function ajax(){
		if(this.formId != "commonForm"){
			this.param += "&" + $("#" + this.formId).serialize();
		}
		$.ajax({
			url : this.url,    
			type : "POST",   
			data : this.param,
			async : false, 
			success : function(data, status) {
				if(typeof(fv_ajaxCallback) == "function"){
					fv_ajaxCallback(data);
				}
				else {
					eval(fv_ajaxCallback + "(data);");
				}
			}
		});
	};
}

/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수 
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/

var gfv_pageIndex = null;
var gfv_eventName = null;

/* 페이징 검색 조건 및 검색 키워드 변수 선언 시작 */
var gfv_searchType = null;
var gfv_keyword = null;
/* 페이징 검색 조건 및 검색 키워드 변수 선언 끝 */

function gfn_renderPaging(params){
	var divId = params.divId; //페이징이 그려질 div id
	gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
	
	/* 페이징 검색 조건 및 검색 키워드 변수 초기화 시작 */
	gfv_searchType = params.searchType; //검색 조건이 저장될 input 태그
	gfv_keyword = params.keyword; //검색 키워드가 저장될 input 태그
	/* 페이징 검색 조건 및 검색 키워드 변수 초기화 끝 */
	
	var totalCount = params.totalCount; //전체 조회 건수
	var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
		currentIndex = 1;
	}
	
	var recordCount = params.recordCount; //페이지당 레코드 수
	if(gfn_isNull(recordCount) == true){
		recordCount = 10;
	}
	var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
	gfv_eventName = params.eventName;
	
	$("#"+divId).empty();
	var preStr = "<nav><ul class='pagination justify-content-center'>";
	var postStr = "";
	var str = "";
	
	var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
	var last = (parseInt(first+9) > parseInt(totalIndexCount)) ? parseInt(totalIndexCount) : parseInt(first+9);
	var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1; 
	var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
	
	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
		preStr += "<li class='page-item'>"
		+ "<a href='#this' class='page-link' onclick='_movePage(1)'><span>&laquo;</span></a></li>" +
				"<li class='page-item'><a href='#this' class='page-link' onclick='_movePage("+prev+")'><span>&lt;</span></a></li>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
		preStr += "<li class='page-item'>"
		+ "<a href='#this' class='page-link' onclick='_movePage(1)'><span>&laquo;</span></a></li>";
	}
	
	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
		postStr += "<li class='page-item'><a href='#this' class='page-link' onclick='_movePage("+next+")'><span>&gt;</span></a></li>" +
					"<li class='page-item'><a href='#this' class='page-link' onclick='_movePage("+totalIndexCount+")'><span>&raquo;</span></a></li>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
		postStr += "<li class='page-item'><a href='#this' class='page-link' onclick='_movePage("+totalIndexCount+")'><span>&raquo;</span></a></li>";
	}
	
	postStr += "</ul></nav>";
	
	for(var i=first; i<=last; i++){
		if(i != currentIndex){
			str += "<li class='page-item'><a href='#this' class='page-link' onclick='_movePage("+i+")'>"+i+"</a></li>";
		}
		else{
			str += "<li class='page-item'><strong><a href='#this' class='page-link' onclick='_movePage("+i+")'>"+i+"</a></strong></li>";
		}
	}
	$("#"+divId).append(preStr + str + postStr);
}

function _movePage(value){
	$("#"+gfv_pageIndex).val(value);
	
	/* 페이징 검색 조건 및 검색 키워드 값 가져오기 시작 */
	var searchType = $("#"+gfv_searchType).val();
	var keyword = $("#"+gfv_keyword).val();
	/* 페이징 검색 조건 및 검색 키워드 값 가져오기 끝 */
	
	if(typeof(gfv_eventName) == "function"){
		/* 매개변수 순서에 맞게 추가하기!! */
		gfv_eventName(value, searchType, keyword);
	}
	else {
		/* 매개변수 순서에 맞게 추가하기!! */
		eval(gfv_eventName + "(value, searchType, keyword);");
	}
}


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
                  boardShow = true;
                  
               };
            }