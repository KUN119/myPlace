<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<!--  아이콘 추가하기 -->
	<script src="https://kit.fontawesome.com/54cc554368.js" crossorigin="anonymous"></script>
	<!--  아이콘 추가하기 끝 -->
<meta charset="UTF-8">
<title>placeRankForm</title>
<link
      href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css"
      rel="stylesheet"
      type="text/css"
/>
	<style>
		* {
		  box-sizing: border-box;
		  margin: 0;
		}
		
		body {
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: center;
		  width: 100%;
		  height: 100vh;
		  padding-bottom: 30px;
		  font-family: "Spoqa Han Sans Neo", "sans-serif";
		  color: #3f4150;
		  background-color: #f4f7fa;
		}
		
		ul,
		li {
		  list-style-type: none;
		  padding-left: 0;
		  margin-left: 0;
		}
		
		button {
		  font-family: "Spoqa Han Sans Neo", "sans-serif";
		  font-size: 15px;
		  line-height: 1;
		  letter-spacing: -0.02em;
		  color: #3f4150;
		  background-color: #fff;
		  border: none;
		  cursor: pointer;
		}
		
		button:focus,
		button:active {
		  outline: none;
		  box-shadow: none;
		}
		
		.title {
		  width: 200px;
		  margin-bottom: 16px;
		}
		
		.title img {
		  width: 100%;
		  height: auto;
		}
		
		form {
		  padding: 40px;
		  background-color: #fff;
		  border-radius: 6px;
		}
		
		form h1 {
		  margin-bottom: 8px;
		  font-size: 16px;
		  font-weight: 500;
		  letter-spacing: -0.02em;
		  color: #3f4150;
		}
		
		.dropdown {
		  position: relative;
		  z-index: 1;
		  width: 300px;
		  margin-bottom: 8px;
		}
		
		.dropdown-toggle {
		  width: 100%;
		  height: 50px;
		  padding: 0 16px;
		  line-height: 50px;
		  color: rgba(133, 136, 150, 0.5);
		  text-align: left;
		  border: 1px solid rgba(224, 226, 231, 0.75);
		  border-radius: 6px;
		  transition: border-color 100ms ease-in;
		}
		
		.dropdown-toggle.selected {
		  color: #3f4150;
		  border-color: rgba(224, 226, 231, 1);
		}
		
		.dropdown-toggle:active {
		  border-color: rgba(224, 226, 231, 1);
		}
		
		.dropdown-menu {
		  position: absolute;
		  z-index: 2;
		  top: calc(100% + 4px);
		  left: 0;
		  width: 100%;
		  max-height: 0;
		  overflow: auto;
		  background-color: #fff;
		  border: 1px solid transparent;
		  border-radius: 6px;
		  transition: border-color 200ms ease-in, padding 200ms ease-in,
		    max-height 200ms ease-in, box-shadow 200ms ease-in;
		}
		
		.dropdown-menu.show {
		  padding: 8px 0;
		  max-height: 280px;
		  border-color: rgba(224, 226, 231, 0.5);
		  box-shadow: 0 4px 9px 0 rgba(63, 65, 80, 0.1);
		}
		
		.dropdown-option {
		  width: 100%;
		  height: 44px;
		  padding: 0 16px;
		  line-height: 44px;
		  text-align: left;
		}
		
		.dropdown-option:hover {
		  background-color: #f8f9fa;
		}
		
		.next-button {
		  display: block;
		  width: 100%;
		  height: 44px;
		  padding: 0 16px;
		  line-height: 44px;
		  color: #f8f9fa;
		  background-color: #1b1c32;
		  border-radius: 6px;
		  transition: background-color 150ms ease-in;
		}
		
		.next-button:disabled {
		  background-color: #e0e2e7;
		  cursor: not-allowed;
}
	</style>
</head>
<body>
	<form action="" id="monthlyRankForm">
		<h1><i class="fa-sharp fa-solid fa-ranking-star" style="color: #3d2fa7;"></i>월간 좋아요 TOP3</h1>
		<div class="dropdown">
			<button type="button" class="dropdown-toggle">
	          날짜를 선택해주세요..
	        </button>
	        <ul class="dropdown-menu">
				<li class="dropdown-item">
		            <button type="button" value="1" class="dropdown-option">
		              1월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="2" class="dropdown-option">
		              2월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="3" class="dropdown-option">
		              3월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="4" class="dropdown-option">
		              4월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="5" class="dropdown-option">
		              5월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="6" class="dropdown-option">
		              6월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="7" class="dropdown-option">
		              7월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="8" class="dropdown-option">
		              8월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="9" class="dropdown-option">
		              9월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="10" class="dropdown-option">
		              10월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="11" class="dropdown-option">
		              11월
		            </button>
		          </li>
		          <li class="dropdown-item">
		            <button type="button" value="12" class="dropdown-option">
		              12월
		            </button>
		          </li>
			</ul>
		</div>
		
		<button type="submit" class="next-button" id="search" disabled>검색</button>
		
		<div id="rankArea"></div>
    </form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	const dropdownForm = document.querySelector(".drowpdown");
	const dropdownBtn = document.querySelector(".dropdown-toggle");
	const menuList = document.querySelector(".dropdown-menu");
	const itemList = document.querySelector(".dropdown-item");
	const optionBtn = document.querySelectorAll(".dropdown-option");
	const submit = document.querySelector(".next-button");
	
	dropdownBtn.addEventListener("click", function () {
	  menuList.classList.toggle("show");
	});

	// menuList는 사라진다
	dropdownBtn.addEventListener("blur", function () {
	  menuList.classList.remove("show");
	});
	
	optionBtn.forEach(function (item) {
		item.addEventListener("click", function (e) {
	    	// 선택한 값 지정
		    const selectValue = e.currentTarget.textContent.trim();
		    // 지정 값 출력
		    dropdownBtn.textContent = selectValue;
		    // 색깔 변화
		    e.currentTarget.classList.add("selected");
		    // 버튼 생성
		    submit.removeAttribute("disabled");
		    
		    submit.addEventListener("click", function (e) {
	            e.preventDefault();
	            var selectedOption = document.querySelector(".dropdown-item button.selected");
	            var month = selectedOption.value;
	            fn_rank(month);
	        });
	  	});
	});
	
	function fn_rank(month) {
		var formData = new FormData();
		var monthData = month;
		formData.append("PLACE_MONTH", monthData);
		
		$.ajax({
			url: "/myPlace/placeRank",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			success : function(data, status, xhr) {
				for(var i=0; i<3; i++){
					var map = data[i];
					var html = "";
					html += '<div style="display: flex; flex-direction: row; justify-content: space-between;">' + map["PLACE_NAME"] 
						+ 	'<div style="display: flex; justify-content: flex-end;">' 
						+ 		'<i class="fa-solid fa-heart" style="color: #ff0000;"></i>'
						+ 		map["CNT"] +'<br/>'
						+ 	'</div>'
						+ '</div>';
					
					$("#rankArea").append(html);
				}
			},
			error: function(xhr, status, error){
			}
		});
	}
})
</script>
</html>