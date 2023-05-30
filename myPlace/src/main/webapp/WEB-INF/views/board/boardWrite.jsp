<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/assets/js/common.js'/>" charset="utf-8"></script>

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
               <th scope="row">작성자</th>
               <th id="boardWriter">${sessionScope.MEM_ID}</th>
            </tr>
            <tr>
               <th scope="row">장소</th>
               <th id="boardPlace">${map.BOARD_PLACE}</th>
            </tr>
            <tr>
               <th scope="row">제목</th>
               <td>
                  <input type="text" id="boardTitle" name="TITLE" class="wdp_90"></input>
               </td>
            </tr>
            <tr>
               <td colspan="2" class="view_text">
                  <textarea rows="20" cols="100" title="내용" id="boardContent" name="CONTENTS"></textarea>
               </td>
            </tr>
         </tbody>
      </table>
   </form>
   <a href="#this" class="btn" id="write" >작성하기</a>
   <a href="#this" class="btn" id="list" >목록으로</a>
   
<script>

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
   
   $("#write").on("click", function(e){ //작성하기 버튼
      e.preventDefault();
   
      var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'; // 글 작성자
      var boardTitle = $("#boardTitle").val(); // 글 제목
      var boardContent = $("#boardContent").val(); // 글 내용
      var boardPlace = $("#boardPlace").text(); // 글 장소
      
      // 글 정보 boardData로 가공
      var boardData = {
         "BOARD_WRITER" : MEM_ID,
         "BOARD_TITLE" : boardTitle,
         "BOARD_CONTENT" : boardContent,
         "BOARD_PLACE" : boardPlace
      }
      
      if(boardTitle == ""){
         alert("글 제목을 입력하세요.");
         $("#boardTitle").focus();
      }else if(boardContent == ""){
         alert("글 내용을 입력하세요.");
         $("#boardContent").focus();
      }else{
         
         $.ajax({
              url : "insertBoard"
            , type : 'POST'
            , data : boardData
            , dataType : "text"
            , success: function(result){
               
            	var urlParams = new URLSearchParams(window.location.search);

        		var AA = urlParams.get('AA');
        		var CC = urlParams.get('currentPage');
        		var placeNum = urlParams.get('BOARD_PLACE');
        		 var pagingUrl = "/myPlace/mainPage?BOARD_NUM="+result+"&BOARD_PLACE="+placeNum+"&AA=" +AA + "&currentPage=" + CC;
        		 location.href=pagingUrl;
            	
               
            }
            , error: function(error){
               alert("실패");
               console.log("에러 : " + error);
            }
         });
      }
   });
   
});
 
function fn_openBoardList(){
   var comSubmit = new ComSubmit();
   comSubmit.setUrl("<c:url value='/mainPage' />");
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