<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Board</title>
    
    <!-- 기존 부트스트랩 css 추가 부분 -->
	<link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
	<link rel="stylesheet" href="resources/css/matrix-style.css" />
	<link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<!-- 끝 -->
	
	<!-- setting : 현재 부트스트랩 css 추가. 순서대로 안하면 깨져서 우선 현재 부트스트랩만 추가해놓음.-->
    <%@ include file = "include/setting.jsp" %> 
	
</head>
<body id="reportsPage">
	<div class="" id="home">

<!-- header start -->

	<c:if test = "${sessionScope.authority == 'ROLE_PATIENT'}">
		<%@ include file="include/pa-header-test.jsp" %>
	</c:if>
	<c:if test = "${sessionScope.authority == 'ROLE_DOCTOR'}">
		<%@ include file="include/dr-header-test.jsp" %>
	</c:if>
	<c:if test = "${sessionScope.authority == 'ROLE_ADMIN'}">
		<%@ include file="include/ho-header-test.jsp" %>
	</c:if>
	
<!-- header end -->

<!-- container -->
		<div class="container">
	<!-- msg start  -->
      	 <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>게시판</b></p>
       	    </div>
     	 </div>
	<!-- msg close -->
  
	<!-- contents start -->
			 <div class="container-fluid">
	         <!-- row -->
		         <div class="row-fluid">
					<div class="span12">
				        <div class="widget-box">
				          <div class="widget-title"> <span class="icon"> <i class="icon-list"></i> </span>
				            <h5>${dto.subject}<code>${dto.writer}</code></h5>
				          </div>
				          <div class="widget-content">${dto.content}</div>
				        </div>
				    </div>
				 </div>
			 </div>
		  	<c:if test="${'ROLE_ADMIN' eq sessionScope.authority}"> 
		   		<input type="button" class="btn btn-mini" value="수정" onclick="location.href='boardModifyForm.ho?boardNO=${dto.boardNO}'"> 
		   		<input type="button" class="btn btn-mini" value="삭제" onclick="location.href='boardDeletePro.ho?boardNO=${dto.boardNO}'"> 
		   	</c:if>
	<!-- contents end -->	   	
		   	
		</div>
	</div>
<!-- container end -->

<!--Footer-part-->

<%@ include file="include/footer.jsp" %>

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
