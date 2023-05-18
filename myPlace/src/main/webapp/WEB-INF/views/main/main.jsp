<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/resources/assets/js/common.js'/>" charset="utf-8"></script>
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


<hr>
<div class="col-2">
   <%@ include file="/WEB-INF/include/include-sidebar.jsp"%>
 </div>
<hr>


<div class="col-2"></div>
<div class="col-10">
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
  

  <script type="text/javascript">
  $(document).ready(function(){
	  
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