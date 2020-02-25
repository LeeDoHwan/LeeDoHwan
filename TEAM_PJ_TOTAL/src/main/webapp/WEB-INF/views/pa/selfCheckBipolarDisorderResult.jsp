<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 조울증 자가진단 결과 페이지 </title>
    
    <!-- 기존 부트스트랩 css 추가 부분 -->
	<link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
	<link rel="stylesheet" href="resources/css/matrix-style.css" />
	<link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<!-- 끝 -->
	
	<!-- setting : 현재 부트스트랩 css 추가. 순서대로 안하면 깨져서 우선 현재 부트스트랩만 추가해놓음.-->
    <%@ include file = "../include/setting.jsp" %> 
	
</head>

<body id="reportsPage">
	<div class="" id="home">

<!-- header start -->

	<c:if test = "${sessionScope.authority == 'ROLE_PATIENT'}">
		<%@ include file="../include/pa-header-test.jsp" %>
	</c:if>
	<%-- 
	<c:if test = "${sessionScope.authority == 'ROLE_DOCTOR'}">
		<%@ include file="include/dr-sidebar.jsp" %>
	</c:if>
	<c:if test = "${sessionScope.authority == 'ROLE_ADMIN'}">
		<%@ include file="include/ho-sidebar.jsp" %>
	</c:if> --%>
	
<!-- header end -->

<!-- container -->
	<div class="container">
		<div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>조울증 자가진단</b></p>
       	    </div>
     	 </div>

	    <div align="center"> <!-- 원래 form action :  BipolarResultPro.pa 였습니다. -->
		    <form action="#" method="post">
		    <input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<input type="hidden" name="manicScore" value="${manicScore}">
 			    <table class="table table-bordered table-striped">
				  	<tr>
				  		<td colspan="2"><br>자가진단 결과는 전문가에 의한 진단만큼 정확하지 않습니다.
				  						<br>정확한 진단을 원하시면 전문의와 상담받아보시기 바랍니다.
				  						<br>진단결과를 제출하시면 검진 시 상담에 활용될 수 있습니다.</td>
				  	</tr>
				  	<tr>
				  		<td colspan="2"><br>점수 : ${manicScore} 점</td>
				  	</tr> 
					<c:if test="${manicScore < 50}">
					  	<tr>
					  		<td colspan="2">
					  			<p id="message">현재 정상범위 안에 있습니다.</p>
					  			<input type="hidden" name="message" value="현재 정상범위 안에 있습니다.">
					  			<div align="right">
					  				<input type="submit" class="btn btn-info" name="제출하기">
					  			</div>
					  		</td>
					  	</tr>
					  	</c:if>
					  	<c:if test="${manicScore < 60 && manicScore >= 50}">
					  	<tr>
					  		<td colspan="2">
					  			<p id="message">조울증 경증이 의심됩니다.</p>
					  			<input type="hidden" name="message" value="조울증 경증이 의심됩니다.">
					  			<div align="right">
					  				<input type="submit" class="btn btn-info" name="제출하기">
					  			</div>
					  		</td>
					  	</tr>
					  	</c:if>
					  	<c:if test="${manicScore < 70 && manicScore >= 60}">
					  	<tr>
					  		<td colspan="2">
					  			<p id="message">조울증 중증이 의심됩니다. 전문가의 정확한 진단을 권장합니다.</p>
					  			<input type="hidden" name="message" value="조울증 중증이 의심됩니다. 전문가의 정확한 진단을 권장합니다.">
					  			<div align="right">
					  				<input type="submit" class="btn btn-info" name="제출하기">
					  			</div>
					  		</td>
					  	</tr>
					  	</c:if>
					  	<c:if test="${manicScore >= 70}">
					  	<tr>
					  		<td colspan="2">
					  			<p id="message">조울증의 정도가 심합니다. 정신건강 센터 방문을 권장합니다.</p>
					  			<input type="hidden" name="message" value="조울증의 정도가 심합니다. 정신건강 센터 방문을 권장합니다.">
					  			<div align="right">
					  				<input type="submit" class="btn btn-info" name="제출하기">
					  			</div>
					  		</td> 
					  	</tr>
					</c:if>
			    </table>  
			</form>
	    </div>
	</div>
</div>
<!-- close content -->

<!--Footer-part-->

	<%@ include file="../include/footer.jsp" %>
	
<!--end-Footer-part-->

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/Chart.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/tooplate-scripts.js"></script>

<!-- 기존 부트스트랩 js 추가 -->
<script src="resources/js/jquery.uniform.js"></script>  <!-- 예쁘게하는데에 필요 -->
<script src="resources/js/select2.min.js"></script> <!-- 예쁘게하는데에 필요 -->
<script src="resources/js/jquery2.min.js"></script> <!-- 필요 -->
<script src="resources/js/bootstrap2.min.js"></script> <!-- 필요 -->
<script src="resources/js/jquery.dataTables.min.js"></script> <!-- 필요 -->
<script src="resources/js/matrix.tables.js"></script> <!-- 필요 -->
<!-- 끝 -->

</body>
</html>
