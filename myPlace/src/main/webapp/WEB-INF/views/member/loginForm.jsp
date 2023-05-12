<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="input_row" id="id_line">
		<div class="icon_cell" id="id_cell">
			<span class="icon_id"> <span class="blind">아이디</span>
			</span>
		</div>
		<input type="text" id="id" name="id" placeholder="아이디" title="아이디"
			class="input_text" maxlength="41" value=""> <span
			role="button" class="btn_delete" id="id_clear" style="display: none;">
			<span class="icon_delete"> <span class="blind">삭제</span>
		</span>
		</span>
	</div>
	<div class="input_row" id="pw_line">
		<div class="icon_cell" id="pw_cell">
			<span class="icon_pw"> <span class="blind">비밀번호</span>
			</span>
		</div>
		<input type="password" id="pw" name="pw" placeholder="비밀번호"
			title="비밀번호" class="input_text" maxlength="16">
	</div>
	<div>
		<button type="submit" class="btn_login" id="login">
	    	<span class="btn_text">로그인</span>
	    </button>
	    <button type="submit" class="btn_Join" id="joinBtn">
	    	<span class="btn_text">회원가입</span>
	    </button>
    </div>
</body>

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
	$("#login").on("click", function(e) {
		e.preventDefault();
		
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
		}else if($("#pw").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
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
		var MEM_ID = $('#id').val();
		var MEM_PW = $('#pw').val();
		
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