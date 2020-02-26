<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${selectCnt==1}">	<!-- 이미 우울증에서 인서트 된 경우 -->
		<c:if test="${updateCnt==1}">
		<script type="text/javascript">
			alert("제출되었습니다.");
			window.location='selfCheckMain.pa';
		</script>
		</c:if>
		<!-- 글쓰기 실패 -->
		<c:if test="${updateCnt==0}">
			<script type="text/javascript">
				alert("제줄에 실패했습니다. 확인 후 다시 시도해 주세요.");
				window.location='window.history.back()';
			</script>
		</c:if>
	</c:if>
	<c:if test="${selectCnt!=1}">	<!-- 아직 인서트 안 된 경우 -->
		<c:if test="${insertCnt==1}">
		<script type="text/javascript">
			alert("제출되었습니다.");
			window.location='selfCheckMain.pa';
		</script>
		</c:if>
		<!-- 글쓰기 실패 -->
		<c:if test="${insertCnt==0}">
			<script type="text/javascript">
				alert("제줄에 실패했습니다. 확인 후 다시 시도해 주세요.");
				window.location='window.history.back()';
			</script>
		</c:if>
	</c:if>
</body>
</html>