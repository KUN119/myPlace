<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
		<th scope="col" style="border-right: 1px solid #ccc;">글번호</th>
		<th scope="col" style="border-right: 1px solid #ccc;">작성자</th>
		<th scope="col" style="border-right: 1px solid #ccc;">내용</th>
		<th scope="col">작성일</th>
	</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_NUM}</td>
						<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_WRITER}</td>
						<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_CONTENT}</td>
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
</body>
</html>