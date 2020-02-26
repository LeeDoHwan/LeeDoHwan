<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Board</title>
    
    <!-- 기존 부트스트랩 css 추가 부분 :: 여기서는 기존 부트스트랩 css를 쓸 필요가 없어서 주석처리 해놓습니다.  -->
	<!-- <link rel="stylesheet" href="resources/css/bootstrap2.min.css" /> -->
	<!-- <link rel="stylesheet" href="resources/css/matrix-style.css" /> -->
	<!-- <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> -->
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
	<c:if test = "${sessionScope.authority == 'ROLE_DOCTOR'}">
		<%@ include file="../include/dr-header-test.jsp" %>
	</c:if>
	<c:if test = "${sessionScope.authority == 'ROLE_ADMIN'}">
		<%@ include file="../include/dr-header-test.jsp" %>
	</c:if> 
	
<!-- header end -->

<!-- container -->
		<div class="container">
		
<!-- msg start  -->
      	 <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>공지사항</b></p>
       	    </div>
     	 </div>
<!-- msg close -->

<!-- contents start -->
	<div class="container-fluid">
      <div class="row tm-content-row">
           <div class="tm-product-table-container-noscroll col-12">
              <table class="table table-hover tm-table-small tm-product-table">
                <thead>
                  <tr>
                    <th scope="col">NO.${dto.boardNO}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${dto.subject}" style="color:#cccccc; width:500px; height:40px;"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td scope="row"><textarea style="width:1050px; height:500px;">${dto.content}</textarea></td>
                    <td style = "padding-right:150px;cursor: pointer"></td>
                    <td style="padding-right:150px;"></td>
                    <td align="right"></td>
                    <td></td>
                  </tr>
                </tbody>
                <c:if test="${'ROLE_ADMIN' eq sessionScope.authority}"> 
	                <tbody>  
	                  <tr>
	                  	<td align="right" colspan="8">
	                    	<input type="button"  value="수정" onclick="location.href='boardModifyForm.ho?boardNO=${dto.boardNO}'"> 
	                    </td>			
	                  </tr>
	                </tbody>
                </c:if>
              </table>
	      <div>
	     	 <%@ include file = "../comments.jsp" %>            
	      </div>
      <!-- contents end -->       
      	</div>
    	</div>
	</div>
</div>

<!-- contents end -->
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