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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['line']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	
	var data = new google.visualization.DataTable();
	// 그래프에 표시할 컬럼
	data.addColumn('number', '년도');
	data.addColumn('number', '진료비');
	
	// 그래프에 표시할 데이터
	data.addRows([
	  [2015,  500],
	  [2016,  560],
	  [2017,  428],
	  [2018,  575],
	  [2019,  213],
	  [2020,  311],
	]);

	var options = {
	  chart: {
	    title: '',
	    subtitle: '단위 만원 (KW)'
	  },
	  width: 900,
	  height: 500
	};

	var chart = new google.charts.Line(document.getElementById('linechart_material'));

	chart.draw(data, google.charts.Line.convertOptions(options));
};
</script>

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
   	        <p class="text-white mt-5 mb-5"><b>결산</b></p>
   	    </div>
   	 </div>
<!-- msg close -->

<!-- contents start -->
		 <div class="container-fluid">
	        	<!-- row -->
	       	<div class="row-fluid">
	
	  		<div id = "linechart_material" align = "center"></div>
		
			</div>
		</div>
<!-- contents end -->
	</div>
</div>
<!-- container end -->

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
