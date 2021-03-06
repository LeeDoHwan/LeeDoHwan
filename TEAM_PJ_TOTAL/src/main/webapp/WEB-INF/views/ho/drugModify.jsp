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
      	        <p class="text-white mt-5 mb-5"><b>Data-info</b></p>
      	    </div>
    	 </div>
<!-- msg close -->

<!-- contents start -->
		 <div class="container-fluid">
          	<!-- row -->
         	<div class="row-fluid">
	
			  <div class="widget-box">
				  <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
				    <h5>Data-info</h5>
				  </div>
				  <div class="widget-content nopadding">
				    <form action="#" method="get" class="form-horizontal">
				      <div class="control-group">
				        <label class="control-label">제목 :</label>
				        <div class="controls">
				          <input type="text" class="span11" placeholder="subject" />
				        </div>
				      </div>
				      
				      <div class="control-group">
				        <label class="control-label">키워드 :</label>
				        <div class="controls">
				          <input type="text" class="span11" placeholder="keyword" />
				        </div>
				      </div>
				      
				      <div class="control-group">
				        <label class="control-label">레퍼런스 :</label>
				        <div class="controls">
				          <input type="text" class="span11" placeholder="reference" />
				        </div>
				      </div>
				     
				      <div class="control-group">
				        <label class="control-label">요약 :</label>
				        <div class="controls">
				          <textarea class="span11" ></textarea>
				        </div>
				      </div>
				      <div class="form-actions">
				        <button type="submit" class="btn btn-success">Save</button>
				        <button class="btn btn" onclick="window.location='druginfo.ho'">Previous</button>
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
