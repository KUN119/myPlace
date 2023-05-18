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
		height: calc(100vh - 300px);
	}
</style>
</head>

<%@ include file="/WEB-INF/include/include-header.jsp" %>

<body>
<div class="mainContent" id="mainContent">
	<div class="col-2">
	   <%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
	</div>
	
	<div class="col-10" id="content">	
		<div id="map" style="height:50%; background-color: orange;">
			d
			<%-- <%@ include file="/WEB-INF/views/place/place.jsp"%> --%>
			 <div>
				<button type="button" value="게시판생성" id="boardBtn">sdfsdf</button>
			</div>
		</div>
		
		<div id="board" style="height:50%; background-color: yellow;">
			<div class="col-10" id="boardArea">
  <div class="table-responsive">
   <form id = "frm">
   <table class="table-responsive" style=" border:1px solid #ccc; margin-left: auto; margin-right: auto;">
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
        <tbody id="board">
           <tr>
            <td colspan="4">조회된 결과가 없습니다.</td>
         </tr>
      </tbody>
     </table>
    </form>
    <a href="#this" class="btn" id="write">글쓰기</a>

</div>

  </div>

		</div>
	</div>
</div>
  

  <script type="text/javascript">
$(document).ready(function(){
      
      $("#boardBtn").on("click", function(e) {
           e.preventDefault();
           $.ajax({
               url: '/myPlace/boardPlace',
               type: 'POST',
               data: { "BOARD_PLACE": 1 },
               dataType: "json",
               success: function(data) {
                       // 게시물 데이터를 반복하여 테이블 행으로 추가
                       $("#board").html("");
                       
                       for (var i = 0; i < data.length; i++) {
                           var map = data[i];
                           var tableHTML = "";
                           
                     tableHTML += '<tr>'
                     tableHTML += '<td class="boardNum" name="boardNum2">' + map["BOARD_NUM"] + '</td>'
                     tableHTML += '<td>' + map["BOARD_WRITER"] + '</td>'
                     tableHTML += '<td class="title" name="title">' + map["BOARD_TITLE"] + '</td>'
                     tableHTML += '<td>' + map["BOARD_DATE"] + '</td>'
                     tableHTML += '</tr>'
                       
                     // 테이블 HTML을 요소에 추가
                         $("#board").append(tableHTML);
                       }
                       
               },
               error: function(xhr, status, error) {
                   console.log('실패');
               }
           }); 
       });
      
      $(document).on("click", ".title", function(e) {
          e.preventDefault();
          var boardDetail = $(this).siblings('.boardNum').text();
          var url = "/myPlace/boardDetail?BOARD_NUM=" + boardDetail;
          window.location.href = url;
      });
	  
      $("#write").on("click", function(e){ //글쓰기 버튼
         e.preventDefault();
         fn_openBoardWrite();
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