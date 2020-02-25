<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>우울증 자가진단</title>
    
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

	<c:if test = "${sessionScope.authority == 'ROLE_PATIENT'}">
		<%@ include file="../include/pa-header-test.jsp" %>
	</c:if>
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
       	        <p class="text-white mt-5 mb-5"><b>우울증 자가진단</b></p>
       	    </div>
     	 </div>
<!-- msg close -->

		  <div class="controls">
			<form action = "selfCheckDepressionResult.pa" method="post" 
			name="selfCheckBipolarDisorderResult" onsubmit="return totalScore();">
				<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<div align="center" style="">
				<table class="table table-bordered table-striped" style="width:750px; height:900px;">
					<tr>
						<th>질문</th>
						<th>전혀 아니다</th>
						<th>가끔 그렇다</th>
						<th>자주 그렇다</th>
						<th>거의 그렇다</th>
					</tr>
					<tr scope="rowgroup">
						<th style="width:400pxl;">
							평상시에는 아무렇지도 않은 일들이 귀찮게 느껴졌다.
						</th>
						<th>
							<label><input type="radio" name="score1" value="0"></label>
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
					</tr>
					<tr>
						<th>
							입맛이 없었다.
						</th>
						<th>
							<label><input type="radio" name="score2" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score2" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score2" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score2" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							가족이나 친구들을 만나보고 얘기도 했지만 계속 기분이 좋지 않았다.
						</th>
						<th>
							<label><input type="radio" name="score3" value="0"></label>
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
					</tr>
					<tr>
						<th>
							나는 남들만큼 괜찮은 사람이라고 생각했다.
						</th>
						<th>
							<label><input type="radio" name="score4" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score4" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score4" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score4" value="0"></label>
						</th>
					</tr>
					<tr>
						<th>
							내가 하는 일에 마음을 집중하기가 어려웠다.
						</th>
						<th>
							<label><input type="radio" name="score5" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score5" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score5" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score5" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							기분이 우울했다.
						</th>
						<th>
							<label><input type="radio" name="score6" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score6" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score6" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score6" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							내가 하고자 하는 일 모두가 어렵게 느껴졌다.
						</th>
						<th>
							<label><input type="radio" name="score7" value="0"></label>
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
					</tr>
					<tr>
						<th>
							미래에 대하여 희망적으로 느꼈다.
						</th>
						<th>
							<label><input type="radio" name="score8" value="3"></label>
						</th>
						<th>
							<label><input type="radio" name="score8" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score8" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score8" value="0"></label>
						</th>
					</tr>
					<tr>
						<th>
							내 인생은 실패작이라고 생각했다.
						</th>
						<th>
							<label><input type="radio" name="score9" value="0"></label>
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
					</tr>
					<tr>
						<th>
							두려움을 느꼈다.
						</th>
						<th>
							<label><input type="radio" name="score10" value="0"></label>
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
					</tr>
					<tr>
						<th>
							잠을 시원하게 못잤다.
						</th>
						<th>
							<label><input type="radio" name="score11" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score11" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score11" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score11" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							행복한 편이었다.
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
						<th>
							<label><input type="radio" name="score12" value="0"></label>
						</th>
					</tr>
					<tr>
						<th>
							평상시보다 대화를 적게 하였다.
						</th>
						<th>
							<label><input type="radio" name="score13" value="0"></label>
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
					</tr>
					<tr>
						<th>
							외로움을 느꼈다.
						</th>
						<th>
							<label><input type="radio" name="score14" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score14" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score14" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score14" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							다른사람들이 다정하지 못하다고 느꼈다.
						</th>
						<th>
							<label><input type="radio" name="score15" value="0"></label>
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
					</tr>
					<tr>
						<th>
							생활이 즐겁다고 느꼈다.
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
						<th>
							<label><input type="radio" name="score16" value="0"></label>
						</th>
					</tr>
					<tr>
						<th>
							울었던 적이 있다.
						</th>
						<th>
							<label><input type="radio" name="score17" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score17" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score17" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score17" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							슬픔을 느꼈다.
						</th>
						<th>
							<label><input type="radio" name="score18" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score18" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score18" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score18" value="3"></label>
						</th>
					</tr>
					<tr>
						<th>
							주위 사람들이 나를 싫어한다는 생각이 들었다.
						</th>
						<th>
							<label><input type="radio" name="score19" value="0"></label>
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
					</tr>
					<tr>
						<th>
							무슨 일이든 제대로 할 수가 없었다.
						</th>
						<th>
							<label><input type="radio" name="score20" value="0"></label>
						</th>
						<th>
							<label><input type="radio" name="score20" value="1"></label>
						</th>
						<th>
							<label><input type="radio" name="score20" value="2"></label>
						</th>
						<th>
							<label><input type="radio" name="score20" value="3"></label>
						</th>
					</tr>
				</table>
				</div>
				<br>
				<div align="center"><input type="submit" class="btn btn-info" value="진단결과확인" /></div>
			</form>
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

<script>
//자가진단 점수 합산
function totalScore() {
	
 	var depression = 0;	//점수 합산한 값
	var scoreValue;	//선택한 버튼의 값
	
	for(var i =1; i<=20; i++) {
	
		var score = document.getElementsByName('score'+i);
		for(var j=0; j<score.length; j++) {
			if(score[j].checked) {
				scoreValue = score[j].value;

			}
		}
		depression += Number(scoreValue);
	}
	alert('depression : ' + depression);
	
}
</script>
</body>
</html>
