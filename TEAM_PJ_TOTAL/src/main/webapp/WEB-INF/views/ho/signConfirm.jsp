<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
	<c:if test="${updateCnt==1}">
		<script type="text/javascript">
			alert("정보가 수정되었습니다.");
			window.location="signcheck.ho";
		</script>
	</c:if>

	<c:if test="${updateCnt!=1}">
		<script type="text/javascript">
			alert("수정에 실패했습니다.");
		</script>
	</c:if>
</body>
</html>