<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<%@ include file="include/dr-header-test.jsp" %>
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
                    <th scope="col">NO</th>
                    <th scope="col">TITLE</th>
                    <th scope="col">WRITER</th>
                    <th scope="col">DATE</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <c:if test="${cnt != 0}">
				<c:forEach var="dto" items="${dtos}">
                <tbody>
                  <tr>
                    <th scope="row" style="padding-right:150px;  color:#cccccc; ">${dto.boardNO}<!-- <input type="checkbox" /> --></th>
                    <td onclick="location.href='boardView.lo?boardNO=${dto.boardNO}'" style = "padding-right:150px;cursor: pointer; color:white;">${dto.subject}</td>
                    <td style="padding-right:150px; color:white;">${dto.writer}</td>
                    <td style="color:white;">${dto.regDate}</td>
                    <td>
                    <c:if test="${'ROLE_ADMIN' eq sessionScope.authority}"> 
						<a href="#" class="tm-product-delete-link">
                        	<i class="far fa-trash-alt tm-product-delete-icon" onclick="location.href='boardDeletePro.ho?boardNO=${dto.boardNO}'"></i>
                        </a>	
		   			</c:if>
                    </td>
                  </tr>
                </tbody>
                <c:if test="${'ROLE_ADMIN' eq sessionScope.authority}"> 
	                <tbody>
	                	<tr>
	                		<td align="right" colspan="8">
	                			<input type="button"  value="작성" onclick="location.href='boardWriteForm.ho'">
	                		</td>
	                	</tr>
	                </tbody>	
                </c:if>
                </c:forEach>
                </c:if>
              </table>
            </div>
	</div>
	</div>
<!-- contents end -->
 </div> 
</div>
<!-- close content -->

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