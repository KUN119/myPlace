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
<form id ="frm">
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
				<td>${map2.BOARD_NUM }</td>
			</tr>
			<tr>
				<th scope="row" >작성자</th>
				<td>${map2.BOARD_WRITER }</td>
				<th scope="row">작성시간</th>
				<td>${map2.BOARD_DATE }</td>
			</tr>
			<tr>
				<th scope="row">장소</th>
				<td>${map2.BOARD_PLACE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map2.BOARD_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map2.BOARD_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	</form>
	<a href="#this" class="btn" id="list">목록으로</a>
<c:if test="${sessionScope.MEM_ID eq map2.BOARD_WRITER}">
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
</c:if>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				var urlParams = new URLSearchParams(window.location.search);

				var AA = urlParams.get('AA');
				var CC = urlParams.get('currentPage');
				var placeNum = urlParams.get('BOARD_PLACE');
				 var pagingUrl = "/myPlace/mainPage?BOARD_PLACE="+placeNum+"&AA=" +AA + "&currentPage=" + CC;
						 location.href=pagingUrl;		
				});

			$("#update").on("click", function(e){  // 수정 버튼
				e.preventDefault();
				var urlParams = new URLSearchParams(window.location.search);

				var AA = urlParams.get('AA');
				var CC = urlParams.get('currentPage');
				var placeNum = urlParams.get('BOARD_PLACE');
				var pagingUrl = "openBoardUpdate?BOARD_NUM=${map2.BOARD_NUM}&BOARD_WRITER=${map2.BOARD_WRITER}&BOARD_PLACE="+placeNum+"&AA=" +AA + "&currentPage=" + CC;
				location.href=pagingUrl;
			});
			
			$("#delete").on("click", function(e){ // 삭제 버튼
				e.preventDefault();
				alert("삭제되었습니다.");
				fn_deleteBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/openBoardUpdate?BOARD_NUM=${map2.BOARD_NUM}&BOARD_WRITER=${map2.BOARD_WRITER}' />");
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