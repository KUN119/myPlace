<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<style>
  table {
    width: 50%;
    border: 1px solid #333;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #333;
  }
</style>
</head>
<body>
<h2>게시판 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="10%"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
		<th scope="col" style="border-right: 1px solid #ccc;">글번호</th>
		<th scope="col" style="border-right: 1px solid #ccc;">제목</th>
		<th scope="col" style="border-right: 1px solid #ccc;">작성자</th>
		<th scope="col">작성일</th>
	</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr style="border-bottom: 1px solid #ccc;">
						<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_NUM}</td>
						<td scope="col" class="title" style="border-right: 1px solid #ccc;">
						<a
							href='/myPlace/boardDetail?BOARD_NUM=${row.BOARD_NUM }'>${row.BOARD_TITLE}</a>
						<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_WRITER}</td>
						<td>${row.BOARD_DATE}</td>
					</tr>

				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
	
</table>

<br/>
<a href="#this" class="btn" id="write">글쓰기</a>

<script type="text/javascript">

		$(document).ready(function(){
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				location.href='boardWrite';
			});	

	
	/* 	$("a[name='title']").on("click", function(e){
			e.preventDefault();
			fn_openBoardDetail($(this));
		}); */
		});
		
		/* function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='boardDetail' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
			comSubmit.submit();
		} */
</script>	
</body>
</html>