<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>


<body>
	<!--아이디와 비밀번호가 일치  -->
	
		
		<!--삭제에러  -->
		<c:if test="${deleteCnt == 0}">
			<script type="text/javascript">
			alert("예약취소에 실패하였습니다");
			window.location="appointment.pa";
			</script>
		</c:if>
		
		<!-- 삭제성공 - 세션삭제, selectCnt = 2(방문환영)로 주고 main으로 이동  -->
		<c:if test="${deleteCnt !=0}">
			
			<!-- 1초후에  alert창을 띄운후 main.do로 이동  -->
			<script type="text/javascript">
				setTimeout(function(){
					alert("예약취소 완료되었습니다");
					window.location="appointment.pa";
				},1000)
			</script>
		</c:if><!-- 삭제성공  -->
	
	
</body>
</html>