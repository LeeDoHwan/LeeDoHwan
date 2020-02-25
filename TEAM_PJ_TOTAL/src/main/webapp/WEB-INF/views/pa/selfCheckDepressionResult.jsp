<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>우울증 자가진단 결과 페이지</title>
    
    <!-- 기존 부트스트랩 css 추가 부분 -->
    <link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
    <link href="resources/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/css/matrix-style.css" /> <!-- widgetbox -- margin이용 -->
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
	<%-- <c:if test = "${sessionScope.authority == 'ROLE_DOCTOR'}">
		<%@ include file="include/dr-sidebar.jsp" %>
	</c:if>
	<c:if test = "${sessionScope.authority == 'ROLE_ADMIN'}">
		<%@ include file="include/ho-sidebar.jsp" %>
	</c:if> --%>
<!-- header end -->

<!-- container -->
		<div class="container">
		
<!-- msg start  -->
      	 <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>우울증 자가진단</b></p>
       	    </div>
     	 </div>
<!-- msg close -->
		
		 <!--  <div style="text-align:center"><h4> 우울증 자가진단 </h4></div> -->
		  <div align="center">
			  <table class="table table-bordered table-striped">
				  	<tr>
				  		<td colspan="2"><br>자가진단 결과는 전문가에 의한 진단만큼 정확하지 않습니다.
				  						<br>정확한 진단을 원하시면 전문의와 상담받아보시기 바랍니다.</td>
				  	</tr>
				  	<tr>
				  		<td><br>점수 : </td>
				  		<td> <br>점</td>
				  	</tr> 
				<!--   	<c:if test="totalScore<16">
				  	<tr>
				  		<td>현재 정상범위 안에 있습니다.</td>
				  	</tr>
				  	</c:if>
				  	<c:if test="totalScore<25">
				  	<tr>
				  		<td>
					  		우울증이 있지만 그 정도가 심하지는 않습니다.
					  		<br>
					  		전문가의 정확한 진단이 필요합니다.
				  		</td>
				  	</tr>
				  	</c:if>
				  	<c:if test="totalScore>24">
				  	<tr>
				  		<td>우울증의 정도가 심합니다. 정신건강 센터 방문을 권장합니다.</td> 
				  	</tr>
				  </c:if> -->
			  </table>
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