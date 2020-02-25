<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Admin - Dashboard HTML Template</title>
    
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

	<%@ include file="../include/ho-header-test.jsp" %>

<!-- header end -->

<!-- container -->
	<div class="container">
	
	<!-- contents start -->
		<div class="container-fluid">
	    <form id="form">
	    	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
	   		<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
		            	<h5>의료인 가입 승인</h5>
		            	<span class="label label-info">Featured</span>
		            </div>
	          		<div class="widget-content ">
		            	<table class="table table-bordered table-striped with-check">
		              		<thead>
				                <tr>
				                  <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
				                  <th>아이디</th>
				                  <th>이름</th>
				                  <th>이메일</th>
				                  <th>부서</th>
				                  <th>승인</th>
				                </tr>
		              		</thead>
		              		<tbody>
		              			
		              			<c:forEach var="dto" items="${dtos}">
					                <tr>
										<td><input type="checkbox" /></td>
										<td>${dto.doctorID}</td>
										<td>${dto.doctorName}</td>
										<td>${dto.email}</td>
										<td>
											<c:if test="${dto.departmentNum == 0}">
							                  	<select name="departmentNum">
							                  		<option value=0>부서 선택</option>
							                  		<option value=1>영상의학과</option>
							                  		<option value=2>호흡기내과</option>
							                  		<option value=3>과3</option>
							                  		<option value=4>과4</option>
							                  	</select>
						                  	</c:if>
					                  		<c:if test="${dto.departmentNum == 1}">
					                  			<p>영상의학과</p>
					                  		</c:if>
					                  		<c:if test="${dto.departmentNum == 2}">
					                  			<p>호흡기내과</p>
					                  		</c:if>
					                  		<c:if test="${dto.departmentNum == 3}">
					                  			<p>과3</p>
					                  		</c:if>
					                  		<c:if test="${dto.departmentNum == 4}">
					                  			<p>과4</p>
					                  		</c:if>
					                	</td>
						              	<td>
											<c:if test="${dto.enabled != 1}">
												<input type="hidden" value="${dto.doctorID}" name="doctorID">
												<c:set var="enabled" value="1"/>
												<input type="hidden" value="${enabled}" name="enabled">
												<input type="submit" formaction="signConfirm.ho" value="승인" >
							                 </c:if>
							                 <c:if test="${dto.enabled == 1}">
							                 	<p>승인</p>
							                 </c:if>
						                </td>
									</tr>
				                </c:forEach>
	              			</tbody>
	            		</table>
	          		</div>
	        	</div>
	        </div>
	        </form>
		</div>
 <!-- contents end -->		
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
