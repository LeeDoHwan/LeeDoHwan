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
			          <div class="widget-title"> 
			            <h5>Collspan Table Example</h5>
			          </div>
			          <!-- <div class="widget-content nopadding"> -->
			            <table class="table table-bordered table-striped">
			              <thead>
			                <tr>
			                  <th>No</th>
			                  <th>Title</th>
			                  <th>Posted By</th>
			                  <th>Date</th>
			                </tr>
			              </thead>
				          <c:if test="${cnt != 0}">
							<c:forEach var="dto" items="${dtos}">
				             <tbody>
				               <tr>
				                 <td>${dto.boardNO}</td>
				                 <td onclick="location.href='boardView.lo?boardNO=${dto.boardNO}'" style = "cursor: pointer">${dto.subject}</td>
				                 <td>${dto.writer}</td>
				                 <td>${dto.regDate}</td>
				               </tr>
				             </tbody>
				            </c:forEach> 
				           		<tr>
			           		 		<c:if test="${'ROLE_ADMIN' eq sessionScope.authority }"> 
				               		<td colspan ="4" align = "right"><input type="button" class="btn btn-mini" value="작성" onclick="location.href='boardWriteForm.ho'"></td> 
				              	 </c:if>
				              	</tr>
				          	</c:if>
			            </table>  
			          </div>
			        </div>
		        </div>
	        </div>
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


<!-- <script src="resources/js/excanvas.min.js"></script> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/jquery.ui.custom.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.flot.min.js"></script> 
<script src="resources/js/jquery.flot.resize.min.js"></script> 
<script src="resources/js/jquery.peity.min.js"></script> 
<script src="resources/js/fullcalendar.min.js"></script> 
<script src="resources/js/matrix.js"></script> 
<script src="resources/js/matrix.dashboard.js"></script> 
<script src="resources/js/jquery.gritter.min.js"></script> 
<script src="resources/js/matrix.interface.js"></script> 
<script src="resources/js/matrix.chat.js"></script> 
<script src="resources/js/jquery.validate.js"></script> 
<script src="resources/js/matrix.form_validation.js"></script> 
<script src="resources/js/jquery.wizard.js"></script> 
<script src="resources/js/jquery.uniform.js"></script> 
<script src="resources/js/select2.min.js"></script> 
<script src="resources/js/matrix.popover.js"></script> 
<script src="resources/js/jquery.dataTables.min.js"></script> 
<script src="resources/js/matrix.tables.js"></script>  -->

</body>
</html>
