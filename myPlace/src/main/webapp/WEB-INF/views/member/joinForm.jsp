<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.join_element {
	display: flex;
	flex-direction: column;
}

.element_name {
	margin: 20px 0px 10px;
	font-size: 20px;
}
</style>
<title>회원가입</title>
</head>
<body style="background-color: gold;">
	<div style="display: flex; justify-content: center;">
		<div style="margin: 100px 0px 100px;">
			<div style="display: flex; justify-content: center; font-size: 30px;">
				회원가입
			</div>
			<div id="container">
				<div class="join_element">
					<h3 class="element_name">
						<label>아이디</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" id="joinId" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>비밀번호</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" id="joinPass1" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>비밀번호 확인</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" id="joinPass2" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>이름</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" id="joinName" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>이메일</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" id="joinEmail" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>핸드폰 번호</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" id="joinPhone" style="border: 0;">
					</span>
				</div>
			</div>
			<div
				style="display: flex; justify-content: center; margin: 50px 0px;">
				<button type="button" id="joinBtn"
					style="width: 150px; height: 50px; font-size: 20px; font-weight: 1000; background-color: springgreen;">회원가입</button>
			</div>
		</div>
	</div>
</body>

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$("#joinBtn").click(function(e){
	e.stopPropagation();
	
	var joinId = $("#joinId").val();
	var joinPass1 = $("#joinPass1").val();
	var joinPass2 = $("#joinPass2").val();
	var joinName = $("#joinName").val();
	var joinEmail = $("#joinEmail").val();
	var joinPhone = $("#joinPhone").val();
	
	var joinData = {
			"MEM_ID" : joinId,
			"MEM_PW" : joinPass1,
			"MEM_NAME" : joinName,
			"MEM_EMAIL" : joinEmail,
			"MEM_PHONE" : joinPhone
			};
	
	// 유효성 검증. 공란일 경우, id가 6~12자리가 아닐경우, 비밀번호가 10자리 미만일 경우
	// 중복된 아이디일 경우(controller에서 처리)
	if(joinId.length < 6 || joinId.length > 12){
		alert("아이디는 6~12자리로 입력하세요."); // 한글 자음,모음,특수기호는 입력되지 않도록
		$("#joinId").focus();
	}else if(joinPass1.length < 10){
		alert("비밀번호는 10자리 이상이어야 합니다.");
		$("#joinPass1").focus();
	}else if(joinPass1 != joinPass2){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#joinPass2").focus();
	}else if(joinName == ""){ // 한글 자음,모음,특수기호는 입력되지 않도록
		alert("이름을 입력하세요.");
		$("#joinName").focus();
	}else if(joinEmail == ""){ // 메일의 @ 뒷부분은 드롭다운과 직접 입력으로 변경. 한글 자음,모음,특수기호는 입력되지 않도록
		alert("메일을 입력하세요.");
		$("#joinEmail").focus();
	}else if(joinPhone == ""){ // 전화번호 1,2로 나누기, 전화번호 앞 3자리는 드롭다운으로 변경, 숫자만 입력 가능하도록
		alert("전화번호를 입력하세요.");
		$("#joinPhone").focus();
	}else{
		
		$.ajax({
			  url : "joinSuccess"
			, type : 'POST'
			, data : joinData
			, dataType : 'text'
			, success: function(result){
				
				if(result == "1"){
					alert("이미 존재하는 아이디입니다.");
				}else if(result == "2"){
					alert("이미 존재하는 이메일입니다.");	
				}else if(result == "3"){
					alert("이미 등록된 전화번호입니다.")
				}else if(result == "0"){
					alert("회원가입이 완료되었습니다!");
					location.href = "loginForm";
				}
			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
		
	}
})
</script>
</html>