<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="<c:url value='/resources/assets/js/common.js'/>" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
.join_element {
   display: flex;
   flex-direction: column;
}

.element_name {
   margin: 20px 0px 10px;
   font-size: 20px;
}

.row {
  margin-top: 20px;
  padding-top: 20px;
}

.btn_login {
     background-color:#0a0a23;
    color: #fff;
    border:none; 
    border-radius:10px; 
    padding:10px;
    min-height:30px; 
    min-width: 120px;
}

.btn_Join {
     background-color:#0a0a23;
    color: #fff;
    border:none; 
    border-radius:10px; 
    padding:10px;
    min-height:30px; 
    min-width: 120px;
}

</style>
</head>
<body>      
       
       <div class="col-8">
       <a href="/myPlace/loginForm">
       <img src="./resources/assets/img/myPlace.png" width="200px" height="100px"></a>
       </div>
       
<form id="loginForm" class="needs-validation" method="post">
 
   <div style="display: flex; justify-content: center;">
      <div style="margin: 100px 0px 100px;">
         <div style="display: flex; justify-content: center; font-size: 30px;">
            로그인
         </div>
         <div id="container" style="width: 600px;">
            <div class="join_element">
               <h3 class="element_name">
                  <label>아이디</label>
               </h3>
               <span
                  style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
                  <input type="text" id="loginId" style="border: 0;">
               </span>
            </div>
            <div class="join_element">
               <h3 class="element_name">
                  <label>비밀번호</label>
               </h3>
               <span
                  style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
                  <input type="passWord" id="loginPass1" style="border: 0;">
               </span>
            </div>
            
            
         </div>
         <div style="display: flex; justify-content: center; margin: 50px 0px;">
            <button class="btn_login" type="button" id="loginBtn"
               style="margin-right: 20px; width: 150px; height: 50px; font-size: 20px; font-weight: 1000;">로그인</button>
               
            <button class="btn_Join" type="button" id="joinBtn"
               style="width: 150px; height: 50px; font-size: 20px; font-weight: 1000;">회원가입</button>
         </div>
         
      </div>
   </div>
   
   </form>
    
</body>

<%@ include file="/WEB-INF/include/include-footer.jsp" %>

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
   
   // session이 존재하면 메인화면으로 보내기
   if(<%=(String)session.getAttribute("MEM_ID")%> != null){
      alert("메인으로 이동");
      location.href = 'mainPage';
   }
   
   // 로그인 버튼 클릭
   $("#loginBtn").on("click", function(e) {
      e.preventDefault();
      
      if($("#loginId").val() == ""){
         alert("아이디를 입력하세요.");
         $("#loginId").focus();
      }else if($("#loginPass1").val() == ""){
         alert("비밀번호를 입력하세요.");
         $("#loginPass1").focus();
      }else{
         fn_loginForm();
      }
      
   });
   
   // 회원가입 버튼 클릭
   $("#joinBtn").on("click", function(e) {
      e.preventDefault();
      window.location.href = "joinForm";
   });
   
   function fn_loginForm() {
      var MEM_ID = $('#loginId').val();
      var MEM_PW = $('#loginPass1').val();
      
      var formData = {
            "MEM_ID" : MEM_ID,
            "MEM_PW" : MEM_PW
            };

      $.ajax({
         url: '/myPlace/loginCheck',
         type: 'POST',
         data: formData,
         success: function(data) {
            
            console.log(data);
            if(data=="idFail"){
               alert("아이디를 확인해주세요.");
            } else if(data=="pwFail"){
               alert("비밀번호를 확인해주세요.");
            } else if(data=="success"){
               location.href='mainPage';
            }
         },
         error: function(xhr, status, error) {
            console.log('실패');
         }
      }); 
   };
});

</script>
</html>