<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/assets/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map2.BOARD_NUM }
						<input type="hidden" id="BOARD_NUM" name="BOARD_NUM" value="${map2.BOARD_NUM }">
					</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map2.BOARD_WRITER }</td>
					<th scope="row">작성시간</th>
					<td>${map2.BOARD_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map2.BOARD_TITLE }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENT" name="CONTENT">${map2.BOARD_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<a href="#this" class="btn" id="cancel">취소</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#cancel").on("click", function(e){ //취소 버튼
				e.preventDefault();
				fn_openBoardDetail();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){
				e.preventDefault();
				alert("삭제되었습니다.");
				fn_deleteBoard();
			});
		});
		
		function fn_openBoardDetail(){
			var comSubmit = new ComSubmit("frm");
			window.history.go(-1);
		}
		
		function fn_updateBoard() {
		    var comSubmit = new ComSubmit("frm");
		    var BOARD_NUM = $("#map2.BOARD_NUM").val();
		    var BOARD_TITLE = $("#TITLE").val();
		    var BOARD_CONTENT = $("#CONTENT").val();
		    var urlParams = new URLSearchParams(window.location.search);
		    var AA = urlParams.get('AA');
		    var CC = urlParams.get('currentPage');
		    var placeNum = urlParams.get('BOARD_PLACE');

		    comSubmit.setUrl("<c:url value='/boardUpdate' />");
		    comSubmit.addParam("BOARD_NUM", BOARD_NUM);
		    comSubmit.addParam("BOARD_TITLE", BOARD_TITLE);
		    comSubmit.addParam("BOARD_CONTENT", BOARD_CONTENT);
		    comSubmit.addParam("AA", AA);
		    comSubmit.addParam("placeNum", placeNum);
		    comSubmit.addParam("CC", CC);		// BOARD_TITLE, BOARD_CONTENT 를 수정해야하므로 controller 의 boardUpdate 메서드를 거쳐야함.
		    													// 거기서 mv.addObject 를 통해 AA, placeNum, CC를 넘겨받고 url에도 나타남.

/* 		    var pagingUrl = "/myPlace/boardDetail?BOARD_NUM=" + encodeURIComponent(BOARD_NUM2);
		    pagingUrl += "&BOARD_PLACE=" + encodeURIComponent(placeNum);
		    pagingUrl += "&AA=" + encodeURIComponent(AA);
		    pagingUrl += "&currentPage=" + encodeURIComponent(CC);
		    location.href = pagingUrl; */
		    console.log(comSubmit);
		    comSubmit.submit();

		}	
		
		function fn_deleteBoard(){
			var BOARD_NUM = ${map2.BOARD_NUM };
		    var comSubmit = new ComSubmit("frm");
		    comSubmit.setUrl("<c:url value='/boardDelete' />");
		    comSubmit.addParam("BOARD_NUM", BOARD_NUM);
		    comSubmit.submit();
		}
	</script>
</body>
</html>