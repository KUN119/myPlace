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
						<input type="text" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>비밀번호</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>비밀번호 확인</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>이름</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>이메일</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" style="border: 0;">
					</span>
				</div>
				<div class="join_element">
					<h3 class="element_name">
						<label>핸드폰 번호</label>
					</h3>
					<span
						style="background-color: white; padding: 10px 50px 10px 10px; border: solid 1px black;">
						<input type="text" style="border: 0;">
					</span>
				</div>
			</div>
			<div
				style="display: flex; justify-content: center; margin: 50px 0px;">
				<button type="button"
					style="width: 150px; height: 50px; font-size: 20px; font-weight: 1000; background-color: springgreen;">회원가입</button>
			</div>
		</div>
	</div>
</body>

<script>
	
</script>
</html>