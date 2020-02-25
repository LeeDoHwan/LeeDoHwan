<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>조울증 자가진단 페이지</title>
    
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
       	        <p class="text-white mt-5 mb-5"><b>조울증 자가진단</b></p>
       	    </div>
     	 </div>
<!-- msg close -->
		  <div class="controls"> 
			<form action = "selfCheckBipolarDisorderResult.pa" method="post" name="selfCheckBipolarDisorderResult" onsubmit="">
				<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<div align="center">
				<table class="table table-bordered table-striped" style="width:750px; height:900px;">
					<tr>
						<th>질문</th>
						<th>전혀 아니다</th>
						<th>가끔 그렇다</th>
						<th>자주 그렇다</th>
						<th>거의 그렇다</th>
					</tr>
					<tr scope="rowgroup">
						<th>
							나는 의욕이 없고, 우울하고 슬프다
						</th>
						<th>
							<label><input type="radio" name="score1" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score1" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score1" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score1" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 하루 중 아침이 가장 기분이 좋다.
						</th>
						<th>
							<label><input type="radio" name="score2" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score2" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score2" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score2" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 갑자기 잘 울거나, 울고싶을 때가 있다.
						</th>
						<th>
							<label><input type="radio" name="score3" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score3" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score3" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score3" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 잠을 잘 못자거나 아침에 일직 깬다.
						</th>
						<th>
							<label><input type="radio" name="score4" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score4" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score4" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score4" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 평상시와 같이 잘 먹는다.
						</th>
						<th>
							<label><input type="radio" name="score5" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score5" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score5" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score5" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 이성과 이야기하고 함께 있기를 좋아한다.
						</th>
						<th>
							<label><input type="radio" name="score6" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score6" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score6" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score6" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 체중이 줄어든 것 같다.
						</th>
						<th>
							<label><input type="radio" name="score7" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score7" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score7" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score7" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 변비가 있다.
						</th>
						<th>
							<label><input type="radio" name="score8" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score8" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score8" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score8" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 심장이 평상시보다 빨리 뛰거나 두근거린다.
						</th>
						<th>
							<label><input type="radio" name="score9" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score9" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score9" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score9" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 별 이유 없이 몸이 나른하고 피곤하다.
						</th>
						<th>
							<label><input type="radio" name="score10" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score10" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score10" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score10" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							내 정신이 이 전처럼 맑다.
						</th>
						<th>
							<label><input type="radio" name="score11" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score11" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score11" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score11" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 어떤 일이든지 전처럼 쉽게 처리한다.
						</th>
						<th>
							<label><input type="radio" name="score12" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score12" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score12" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score12" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 안절부절못해서 가만히 있을 수가 없다.
						</th>
						<th>
							<label><input type="radio" name="score13" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score13" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score13" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score13" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나의 장래는 희망적이라고 느낀다.
						</th>
						<th>
							<label><input type="radio" name="score14" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score14" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score14" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score14" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 평소보다 짜증이 많아졌다.
						</th>
						<th>
							<label><input type="radio" name="score15" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score15" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score15" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score15" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 매사에 결단력이 있다고 생각한다.
						</th>
						<th>
							<label><input type="radio" name="score16" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score16" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score16" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score16" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 유익하고 필요한 사람이라고 생각한다.
						</th>
						<th>
							<label><input type="radio" name="score17" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score17" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score17" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score17" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 내 삶이 충만하고 의의가 있다고 느낀다.
						</th>
						<th>
							<label><input type="radio" name="score18" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score18" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score18" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score18" value="1"></label>
						</th>
					</tr>
					<tr>
						<th>
							내가 죽어야 남들이 편할 것 같다.
						</th>
						<th>
							<label><input type="radio" name="score19" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score19" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score19" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score19" value="4"></label>
						</th>
					</tr>
					<tr>
						<th>
							나는 전과 같이 즐겁게 일한다.
						</th>
						<th>
							<label><input type="radio" name="score20" value="4"></label>
						</th>
						<th>
							<label><input type="radio" name="score20" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score20" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score20" value="1"></label>
						</th>
					</tr>
				</table>
				</div>
				<br>
				<div align="center"><input type="submit" class="btn btn-info" value="진단결과확인"></div>
			</form>
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
