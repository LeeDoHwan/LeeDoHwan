<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/setting.jsp" %>    
<html>
<body>
	<form action ="" method = "post">
		<c:forEach var = "dto" items = "${dtos}">
			<hr>
			<a href = "diagnosis.dr?patientName=${dto.patientName}" style = "font-size : 15px;">${dto.patientName}</a>
			<br>
			<hr>
		</c:forEach>
	</form>
</body>
</html>