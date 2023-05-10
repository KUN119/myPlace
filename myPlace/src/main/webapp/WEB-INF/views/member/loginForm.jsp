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
			<span role="button" class="btn_delete" id="pw_clear" style="display: none;">
				<span class="icon_delete"> <span class="blind">삭제</span>
			</span>
		</span>
	</div>
</body>
</html>