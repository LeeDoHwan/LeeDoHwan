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
    <%@ include file = "include/setting.jsp" %> 
    
</head>

<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
function ajaxTest(){
      $.ajax({
        type : "GET",
        url : "ajaxTest1",
        dataType : "text",
        success : function(data) {
	          $('#ajaxTest').html(data);
	        },
        error : function() {
          alert('통신실패!!');
        }
      });
    }

function ajaxTest2(){
      $.ajax({
        type : "GET",
        url : "ajaxTest2",
        dataType : "text",
        success : function(data) {
	          $('#ajaxTest').html(data);
	        },
        error : function() {
          alert('통신실패!!');
        }
      });
    }
    
function search(){
    $.ajax({
      type : "GET",
      url : "search",
      dataType : "text",
      success : function(data) {
	          $('#ajaxTest').html(data);
	        },
      error : function() {
        alert('통신실패!!');
      }
    });
  }    
  
/*  $(function(){
	$('#name').keyup(function(){	// keyup : 데이터 입력이 끝난 경우
	  */
function keyupName(){ 	
		var result = $('#name').val();	// 입력한 키워드
		
		if(result.length == 0){	// 글자수가 0인 경우
			$('#display').css("visibility","hidden");	// 숨김
		}else{
			$('#display').css("visibility","visible");	// 표시
			/* result -> 컨트롤러/search_next.jsp -> data -> 콜백함수 -> display */
			$.ajax({
				url : "searchPro", // {컨트롤러}/이동페이지
				type : 'POST',
				data : $("#searchForm").serialize(),
				success: function(data){
					$('#display').html(data);
				},
				error : function(){
					alert("오류");
				}
			});
		}	
	}
/*  	});
});    */


function imgtest(img){ 
	$.ajax({
		url : "imgtest", // {컨트롤러}/이동페이지
		dataType : "text",
		success: function(data){
			$('#imgtest').html("<img src = 'resources/img/" + data + "'>");
		},
		error : function(){
			alert("오류");
		}
	});
}
</script>
</head>
<body id="reportsPage">    
	<div class="" id="home">
	
<!-- header start -->

	<%-- <c:if test = "${sessionScope.authority == 'ROLE_PATIENT'}">
		<%@ include file="include/pa-header-test.jsp" %>
	</c:if> --%>
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
       	        <p class="text-white mt-5 mb-5"><b>TEST</b></p>
       	    </div>
     	 </div>
<!-- msg close -->
		
<!-- contents start -->
		 <div class="container-fluid">
          	<!-- row -->
         	<div class="row-fluid">
          		<div class="span12">
	          		<div class="widget-box">
					  	<input type = "button" value = "ajaxTest1" size = "30" onclick = "ajaxTest()">
					  	<input type = "button" value = "ajaxTest2" size = "30" onclick = "ajaxTest2()">
					  	<input type = "button" value = "search" size = "30" onclick = "search()">
					</div>
					
					<div class="widget-box">
						<div id = ajaxTest>
											
						</div>
					</div>
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
