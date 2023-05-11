<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<a href="#this" class="btn" id="write" >작성하기</a>
		<a href="#this" class="btn" id="list" >목록으로</a>
	</form>
	
<script>

$(document).ready(function(){
	$("#list").on("click", function(e){ //목록으로 버튼
		e.preventDefault();
		fn_openBoardList();
	});
	
	$("#write").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_insertBoard();
	});
});

function fn_openBoardList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myPlace/boardList' />");
	comSubmit.submit();
}

function fn_insertBoard(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/insertBoard' />");
	comSubmit.submit();
}

</script>
</body>
</html>