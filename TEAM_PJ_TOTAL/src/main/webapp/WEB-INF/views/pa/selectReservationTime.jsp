<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="appointmentTime">						
		<tr>
			<c:forEach var = "dto" items = "${dtos}">
			<td>
				<label><input type="radio" name="apptTime" value="${dto}" onclick = "clickTime();"/>${dto}
					<%-- <c:forEach var="dtoN" begin="1" end="${dtosNum[i]}"><img width="18" height="18" alt="예약가능한 인원 수 " src="resources/img/icons/park/man_on.png"></c:forEach> --%>
				</label>
				<c:set var = "i" value = "${i+1}" />
			</td>
			</c:forEach>			
		</tr>
	</table>
	
	<input type="hidden" name="date" value="${date}">
	
</body>
</html>