<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file = "../include/setting.jsp" %> 
</head>
<body>
 <c:if test="${selectCnt != 0}">
		<script type="text/javascript">
			alert("이미 예약된 검진이 있습니다.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${selectCnt == 0}">
		<script type="text/javascript">
			
			window.location='appointmentConfirm.pa?date=${date}&time=${time}&reservationNo=${reservationNo}';
		</script>
	</c:if>
</body>
</html>