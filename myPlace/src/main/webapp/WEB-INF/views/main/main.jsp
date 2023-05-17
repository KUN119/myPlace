<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.mainContent{
	display: flex;
	height: calc(100vh - 175px);
}
</style>

</head>

<div id="header">
	<%@ include file="/WEB-INF/include/include-header.jsp" %>
</div>

<body>
<div class="mainContent" id="mainContent">
	<div class="col-2">
	   <%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
	</div>
	
	<div class="col-10" id="content">	
		<div id="map" style="background-color: orange;">
			지도	
		</div>
	
		<div id="board" style="background-color: yellow;">

			<div class="col-12">
					<table class="table-responsive" style="margin-left: auto; margin-right: auto; border:1px solid #ccc;">
						<colgroup>
						   <col width="15%"/>
						   <col width="20%"/>
						   <col width="40%"/>
						   <col width="40%"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">글번호</th>
								<th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">작성자</th>
								<th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">제목</th>
								<th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">
										<tr style="border-bottom: 1px solid #ccc;">
											<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_NUM}</td>
											<td scope="col" style="border-right: 1px solid #ccc;">${row.BOARD_WRITER}</td>
											<td scope="col" class="title" style="border-right: 1px solid #ccc;">
												<a href='/myPlace/boardDetail?BOARD_NUM=${row.BOARD_NUM }'>${row.BOARD_TITLE}</a>
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
				    <div>
				    	<a href="#this" class="btn" id="write">글쓰기</a>
					</div>
			</div>
		</div>
	</div>

</div>
   
</body>
<div id="footer">
	<%@ include file="/WEB-INF/include/include-footer.jsp" %>
</div>

<script>
	$(document).ready(function(){
		$("#write").on("click", function(e){ //글쓰기 버튼
			e.preventDefault();
			location.href='boardWrite';
		});
	});
</script>
</html>