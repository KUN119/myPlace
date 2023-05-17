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
</head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>

<body>


<hr>
<div class="col-2">
   <%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
 </div>
<hr>


<div class="col-2"></div>
<div class="col-10">
  <div class="table-responsive">
   <table class="table-responsive" style="margin-left: auto; margin-right: auto;">
      <table style="border:1px solid #ccc">
         <colgroup>
            <col width="15%"/>
            <col width="20%"/>
            <col width="40%"/>
            <col width="40%"/>
         </colgroup>
    	
        <caption>리뷰</caption>
        <thead>
         <tr>
            <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">글번호</th>
            <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">작성자</th>
            <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">제목</th>
            <th scope="col" style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;">작성일</th>
         </tr>
        </thead>
        <tbody>
        <form id = "frm">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr  id="abc">
							<td class="boardNum">${row.BOARD_NUM}</td>
							<td>${row.BOARD_WRITER }</td>
							<td class="title" name="title">${row.BOARD_TITLE }</td>
							<td>${row.BOARD_DATE }</td>
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
    </table>
    <a href="#this" class="btn" id="write">글쓰기</a>

</div>

  </div>
  

  <script type="text/javascript">
  $(document).ready(function(){
	  
      $("#write").on("click", function(e){ //글쓰기 버튼
         e.preventDefault();
         fn_openBoardWrite();
      });   
      
      $("[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			var boardNum = $(this).siblings('.boardNum').text();
			fn_openBoardDetail(boardNum);
		});
   });

   function fn_openBoardWrite(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/boardWrite' />");
		comSubmit.submit();
	}
   
   function fn_openBoardDetail(element) {
	   var url = "<c:url value='/boardDetail?BOARD_NUM=" + element + "'/>"; // BOARD_NUM 값을 URL에 추가
	   var comSubmit = new ComSubmit("frm");
	   comSubmit.setUrl(url);
	   comSubmit.submit();
	 }
   
</script>   
</body>

<%@ include file="/WEB-INF/include/include-footer.jsp" %>


</html>