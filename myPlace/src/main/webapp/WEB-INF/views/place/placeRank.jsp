<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
	   월별 장소 랭킹: <input id='month' type='text' maxlength='5'/><br>
	  <input type='submit'>
	</form>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269b5ee55a61404f07167949c5348f27"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	var formdata = new formData();
	formdata.append("#month");
	
	$(document).on("click", "#month", function(){
		$.ajax({
			url: "/placeRank",
			type: "POST",
			data: formdata,
			success : function(data, status, xhr) {
				alert(data);
			},
			error: function(xhr, status, error){
				
			}
		});
	})
	
})
</script>
</html>

