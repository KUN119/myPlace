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
	
	<button type="submit" class="btn_login" id="login">
    	<span class="btn_text">로그인</span>
    </button>
</body>

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#login").on("click", function(e) {
		e.preventDefault();
		fn_loginForm();
	});
	
	function fn_loginForm() {
		var formData = new FormData();
		var MEM_ID = $('#id').val();
		var MEM_PW = $('#pw').val();
		
		formData.append("MEM_ID", MEM_ID);
		formData.append("MEM_PW", MEM_PW);

		$.ajax({
			url: '/myPlace/loginCheck',
			type: 'POST',
			data: formData,
			processData: false,
			contentType: false,
			success: function(data) {
				console.log(data);
				if(data=="idFail"){
					alert("아이디를 확인해주세요.");
				} else if(data=="pwFail"){
					alert("비밀번호를 확인해주세요.");
				} else if(data=="success"){
					location.href='/myPlace/main';
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