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
      	        <p class="text-white mt-5 mb-5"><b>통계</b></p>
      	    </div>
    	 </div>
<!-- msg close -->

		<div id="donutchart" style="width: 900px; height: 500px;"></div>

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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	  var data = google.visualization.arrayToDataTable([
	    ['진단명', '발생자 수'],
	    ['위암',     29685],
	    ['대장',      28111],
	    ['폐',  26985],
	    ['갑상선', 26170],
	    ['간',    15405],
	    ['전립선',    12797],
	    ['췌장',    7032],
	    ['담낭 및 기타 담도',    6846],
	    ['신장',    5299]
	  ]);
	
	  var options = {
	    title: '주요 암발생 현황: 남녀전체, 2017 (단위:%/10만명), 국립 암 센터',
	    pieHole: 0.4,
	  };
	
	  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	  chart.draw(data, options);
	}
</script>
</body>
</html>
