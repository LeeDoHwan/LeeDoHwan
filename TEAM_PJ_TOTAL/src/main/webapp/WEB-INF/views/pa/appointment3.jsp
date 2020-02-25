<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>appointment2</title>
    
    <!-- 추가 -->
    <link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
    <link href="resources/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/css/matrix-style.css" /> <!-- widgetbox -- margin이용 -->
    <!--  -->

<!-- setting : 현재 부트스트랩 css 추가. 순서대로 안하면 깨져서 우선 현재 부트스트랩만 추가해놓음.-->
    <%@ include file = "../include/setting.jsp" %> 
	
</head>
    
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
/* function result(){
  $.ajax({
	  type : "GET",
	  url : "result.pa",
	  dataType : "text",
	  success : function(data) {
	    $('#examineResult').html(data);
	  },
	  error : function() {
	    alert('통신실패!!');
	  }
  });
} */  

$(document).ready(function(){
	$('#btn1').click(function() {
		$('#examine1').toggle();
		$.ajax({
			  type : "GET",
			  url : "result.pa",
			  dataType : "text",
			  success : function(data) {
			    $('#examine1').html(data);
			  },
			  error : function() {
			    alert('통신실패!!');
			  }
		  });
	});
});

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


</script>
    
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

<!-- main container-part-->
<div class="container">

<!-- msg start  -->
  <div class="row">
      <div class="col">
          <p class="text-white mt-5 mb-5"> <b> 검진결과 </b></p>
      </div>
  </div>
<!-- msg close -->

  <div class="container-fluid">
	<div class="row-fluid">
  	<div class="span12">
  	<div class="widget-box">
          <div class="widget-title">
            <h5>${sessionScope.mem_id} 님의 건강 검진 결과</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>검진종류</th>
                  <th>검진년도</th>
                  <th>검진일자</th>
                  <th>소견</th>
                  <th>상세검진결과</th>
                </tr>
              </thead>
              <tbody>
                <tr class="odd gradeX">
                  <td>일반</td>
                  <td>2010</td>
                  <td>2010.10.10</td>
                  <td class="center"> 혈압, 이상지질혈증 관리 요함</td> <!--  onclick = "result()" $('#examineResult').css("visibility","hidden"); -->
                  <td class="center"> <button type="button" id="btn1" class="btn btn-mini" style="align:center;"> <p class="icon-search"/> </button> </td>
                </tr>
                <tr>
                  <td class="center" colspan="5" id="examine"> 
					<div id="examine1" > <!-- style="visibility:hidden" -->
						<!-- 검진결과 -->
					</div>
				  </td>
                </tr>
                <tr class="even gradeC">
                  <td>일반</td>
                  <td>2011</td>
                  <td>2011.11.11</td>
                  <td class="center"> 비만주의, 고지혈증 주의</td>
                  <td class="center"> <button type="button" id="btn2" class="btn btn-mini"> <p class="icon-search"/> </button> </td>
                </tr>
                <tr>
                  <td class="center" colspan="5" id="examine"> 
					<div id="examine2" > <!-- style="visibility:hidden" -->
						<!-- 검진결과 -->
					</div>
				  </td>
                </tr>
                <tr class="odd gradeA">
                  <td>상세</td>
                  <td>2012</td>
                  <td>2012.12.12</td>
                  <td class="center"> 콜레스테롤 검사, 동맥경화 의심 (아무거나 적었어요) </td>
                  <td class="center"> <button type="button" class="btn btn-mini"> <p class="icon-search"/> </button> </td>
                </tr>
                <tr class="even gradeA">
                  <td>일반</td>
                  <td>2014</td>
                  <td>2014.04.11</td>
                  <td class="center"> 흉부촬영상 국소 증가 음영, CT촬영 요구</td>
                  <td class="center"> <button type="button" class="btn btn-mini"> <p class="icon-search"/> </button> </td>
                </tr>
                <tr class="odd gradeA">
                  <td>상세</td>
                  <td>2014</td>
                  <td>2014.04.14</td>
                  <td class="center"> CT촬영 결과, 흉부에 종양 발견 </td>
                  <td class="center"> <button type="button" class="btn btn-mini"> <p class="icon-search"/> </button> </td>
                </tr>
              </tbody>
            </table>
          </div>
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
