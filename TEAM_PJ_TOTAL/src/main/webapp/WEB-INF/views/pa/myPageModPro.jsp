<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<body>

	<c:if test="${udtCnt == 1}">
		<script type="text/javascript">
			alert("정보가 수정 되었습니다.");
			window.location='index.lo';
		</script>
		
	</c:if>
	
	<c:if test="${udtCnt == 0}">
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다!");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${udtCnt == -1}">
		<script type="text/javascript">
			alert("주소 변경에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${udtCnt == -2}">
		<script type="text/javascript">
			alert("정보 변경에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>

</body>
</html>