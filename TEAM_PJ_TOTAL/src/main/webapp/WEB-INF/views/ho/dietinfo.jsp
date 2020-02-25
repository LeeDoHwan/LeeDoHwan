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
	
<!-- msg start  -->
     	 <div class="row">
      	    <div class="col">
      	        <p class="text-white mt-5 mb-5"><b>식단정보</b></p>
      	    </div>
    	 </div>
<!-- msg close -->

<!-- contents start -->
		 <div class="container-fluid">
          	<!-- row -->
         	<div class="row-fluid">
			 <div class="widget-box">
		          <div class="widget-title">
		            <h5>Diet Data</h5>
		          </div>
		          <div class="widget-content nopadding">
		            <table class="table table-bordered data-table">
		              <thead>
		                <tr>
		                  <th><input type="checkbox" name="deleteChek"></th> 
		                  <th>데이터 번호</th>
		                  <th>제목</th>
		                  <th>상태</th>
		                  <th>날짜</th>
		                  <th>수정</th>
		                </tr>
		              </thead>
		              <tbody>
		                <tr class="gradeX">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Trident</td>
		                  <td>Internet
		                    Explorer 4.0</td>
		                  <td>Win 95+</td>
		                  <td class="center">4</td>
		                  <td><button class="btn" onclick="window.location='drugModify.ho'">수정</button></td>
		                </tr>
		                <tr class="gradeC">
		               	  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Trident</td>
		                  <td>Internet
		                    Explorer 5.0</td>
		                  <td>Win 95+</td>
		                  <td class="center">5</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Trident</td>
		                  <td>Internet
		                    Explorer 5.5</td>
		                  <td>Win 95+</td>
		                  <td class="center">5.5</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Trident</td>
		                  <td>Internet
		                    Explorer 6</td>
		                  <td>Win 98+</td>
		                  <td class="center">6</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Trident</td>
		                  <td>Internet Explorer 7</td>
		                  <td>Win XP SP2+</td>
		                  <td class="center">7</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Trident</td>
		                  <td>AOL browser (AOL desktop)</td>
		                  <td>Win XP</td>
		                  <td class="center">6</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Gecko</td>
		                  <td>Firefox 1.0</td>
		                  <td>Win 98+ / OSX.2+</td>
		                  <td class="center">1.7</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Gecko</td>
		                  <td>Firefox 1.5</td>
		                  <td>Win 98+ / OSX.2+</td>
		                  <td class="center">1.8</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		                <tr class="gradeA">
		                  <td><input type="checkbox" name="deleteChek"></td> 
		                  <td>Gecko</td>
		                  <td>Firefox 2.0</td>
		                  <td>Win 98+ / OSX.2+</td>
		                  <td class="center">1.8</td>
		                  <td><button class="btn">수정</button></td>
		                </tr>
		               
		           			<td colspan="6"><button type="submit" class="btn btn-success">삭제</button></td>
		           		</tr>
		              </tbody>
		             
		            </table>
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
