<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
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
						${map3.BOARD_NUM }
						<input type="hidden" id="BOARD_NUM" name="BOARD_NUM" value="${map3.BOARD_NUM }">
					</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map3.BOARD_WRITER }</td>
					<th scope="row">작성시간</th>
					<td>${map3.BOARD_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map3.BOARD_TITLE }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS">${map3.BOARD_CONTENTS }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
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