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


<script type="text/javascript">    
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

function searchPatient(patientName){ 
	$.ajax({
		url : "diagnosis?patientName=" + patientName, // {컨트롤러}/이동페이지
		success: function(data){
		},
		error : function(){
			alert("오류");
		}
	});
}
</script>

<body id="reportsPage">    
	<div class="" id="home">

<!-- header start -->

	<%@ include file="../include/dr-header-test.jsp" %>

<!-- header end -->


<!-- container -->
	<div class="container">

	  <div class="container-fluid">
	    <div class="row-fluid">
	    <div class = "span12">
			<div class="widget-box">
				<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		          <h5>환자 검색</h5>
		        </div>
		        <div class="widget-content nopadding">
				<form id = "searchForm" method = "post" action = "" class="form-horizontal">
				<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div class="control-group">
		              <label class="control-label">환자 이름을 입력하세요.</label>
		              <div class="controls">
						<input type = "text" id = "name" name = "keyword" onkeyup = "keyupName();">
					  </div>
					</div>
				</form>
			</div>
		  </div>
		  </div>
		  </div>
		  
		  <div class="row-fluid">
		  <div class = "span12">
			<div class="widget-box">
				<div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		          <h5>환자 목록</h5>
		        </div>
		        <div class="widget-content nopadding">
		        	<div class="control-group">
					<div id = "display" class = "controls" style = "padding : 30px;">
						<!-- 결과 출력 위치 -->
				    </div>
				    </div>
			    </div>
			</div>
		  </div>
		  </div>
		</div>
	</div>
</div>
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
