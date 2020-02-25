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
      	 <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>사진 감정분석</b></p>
       	        <p class="text-white">
					인물 사진을 올리면 이미지 분석을 통해 사진 속 인물의 감정을 분석합니다.
					<br>
  					JPG,PNG,BMP,GIF(첫번째프레임)파일만 가능합니다.
				</p>
       	    </div>
     	 </div>
<!-- msg close -->
  		
  	<!-- contents start -->
  		<div class="container-fluid">
          	<!-- row -->
	       	<div class="row-fluid">
	       		<div class="span2"></div>
				<div class="span8">
					<div class="widget-box">
					  <form action="emotionRecognitionPro">
						  <input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
						  <div align="center">
						  <table class="table table-bordered table-striped" style="width:800px; height:420px;">
						  	<tr>
						  		<td style="text-align:center; text-valign:middle;">이미지</td>
						  		<td rowspan="2" style="text-align:center; text-valign:middle; width:450px;">결과</td>
						  	</tr>
						  	<tr>
						  		<td style="height:50px; padding:5px;"><input type="file" name="image" maxlength="50" placeHolder="이미지파일 입력" required></td>
						  	</tr>
						  
						  </table>
						  </div>
					  </form>
					 </div>
				 </div>
			</div>
		</div>
	<!-- contents end -->	
	
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
<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>
