<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<h3>환자 검색</h3>
	
	<form id = "searchForm" method = "post" action = "">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
		검색할 단어를 입력하세요.<br>
		
		<input type = "text" id = "name" name = "keyword" onkeyup = "keyupName();">
		  	
		<div id = "display">
			<!-- 결과 출력 위치 -->
		</div>
	</form>

	
	
</body>
</html>
