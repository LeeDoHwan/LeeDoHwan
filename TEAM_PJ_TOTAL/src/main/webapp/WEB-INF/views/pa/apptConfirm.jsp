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

<!-- msg start  -->
      	 <!-- <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>예약완료</b></p>
       	    </div>
     	 </div> -->
<!-- msg close -->  
  
<!-- contents start -->  
	<div class="container-fluid">
	  	<div id="content-section">
	    	<div class="apptConfirm">
	      		<div class="widget-content nopadding">
	            	<ul class="apptRecord">
		              <li>
		                <div class="emblem"> 
		                	<img width="200" height="200" alt="User" src="resources/img/appointment/logo.png"> 
		                </div>
		                <div class="article-post">
		                  <p>"건강검진 예약이 완료되었습니다."</p>
		                  <div><span>마이페이지에서 예약정보를 확인하실 수 있습니다.</span></div><br/>
		                  <div class="apptInfo"> <b>예약번호 : ${reservationNo} / </b> <b>예약날짜 : ${date} / </b> <b>예약시간 : ${time}</b> </div><br/>
		                  <a href="#" class="btn btn-success btn-large">마이페이지로 이동</a>
		                </div>
		              </li>
	            	</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
<!-- close content -->

<!--Footer-part-->

	<%@ include file="../include/footer.jsp" %>
	
<!--end-Footer-part-->
<script src="resources/js/excanvas.min.js"></script> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/jquery.ui.custom.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.flot.min.js"></script> 
<script src="resources/js/jquery.flot.resize.min.js"></script> 
<script src="resources/js/jquery.peity.min.js"></script> 
<script src="resources/js/matrix.js"></script> 
<script src="resources/js/fullcalendar.min.js"></script> 
<script src="resources/js/matrix.calendar.js"></script> 
<script src="resources/js/matrix.chat.js"></script> 
<script src="resources/js/jquery.validate.js"></script> 
<script src="resources/js/matrix.form_validation.js"></script> 
<script src="resources/js/jquery.wizard.js"></script> 
<script src="resources/js/jquery.uniform.js"></script> 
<script src="resources/js/select2.min.js"></script> 
<script src="resources/js/matrix.popover.js"></script> 
<script src="resources/js/jquery.dataTables.min.js"></script> 
<script src="resources/js/matrix.tables.js"></script> 
<script src="resources/js/matrix.interface.js"></script> 

</body>
</html>
