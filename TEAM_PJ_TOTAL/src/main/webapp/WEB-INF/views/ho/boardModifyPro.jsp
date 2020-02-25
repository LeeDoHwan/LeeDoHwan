<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<body>

	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("정보가 수정 되었습니다.");
			window.location='board.lo';
		</script>
		
	</c:if>
	
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("글을 수정하지못했습니다");
			window.history.back();
		</script>
	</c:if>

</body>
</html>