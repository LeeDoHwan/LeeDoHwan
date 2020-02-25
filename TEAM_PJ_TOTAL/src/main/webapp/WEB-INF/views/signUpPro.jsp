<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test = "${insertCnt == 0}">	<!-- insert 실패 -->
	<script type="text/javascript">
		alert("회원가입 실패");
		window.history.back();
	</script>
</c:if>

<c:if test = "${insertCnt != 0 }">	<!-- insert 성공 -->
	<script type="text/javascript">
		alert("회원가입 성공!!");
		window.location = "start.lo";
	</script>
	<%-- <c:redirect url = "login.gu" /> --%>
	<!-- response.sendRedirect("mainSuccess.do?insertCnt=" + cnt); -->
</c:if>
</body>
</html>