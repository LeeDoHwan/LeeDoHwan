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
<!-- header end -->

<!-- container -->
		<div class="container">
<!-- msg start  -->
      	 <div class="row" align="center">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>하이패스 카드등록</b></p>
       	    </div>
     	 </div>
<!-- msg close -->
		<!-- contents start -->
		<div class="container-fluid">
          	<!-- row -->
         	<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
			            <div class="widget-title"> 
			            	<h5>카드 관리</h5>
			            </div>
			          	<!-- <div class="widget-content nopadding"> -->
			            <table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>이름</th>
									<th>종류</th>
									<th>은행명</th>
									<th>계좌번호</th>
									<th>  </th>
								</tr>
							</thead>
							<form method="post">
							<c:if test="${cnt>0}">
								<c:forEach var="dto" items="${dtos}">
									<tbody>
									
										
											<tr>
											<td>${dto.name}</td>
											<c:if test="${dto.kind==0}">
												<td>계좌출금</td>
											</c:if>
											<c:if test="${dto.kind!=0}">
												<td>신용(체크) 카드</td>
											</c:if>
											<td>${dto.bankName}</td>
											<td>${dto.accoutNum}</td>
											<c:if test="${'ROLE_PATIENT' eq sessionScope.authority }"> 
												<td colspan ="4" align = "right"><input type="button" class="btn btn-mini" value="삭제" onclick=""></td> 
											</c:if>
											</tr>
									</tbody>
								</c:forEach>
							</c:if>
							</form>
							<c:if test="${cnt==0}">
								<tobody>
									<tr>
										<td align="center" colspan="5">등록된 카드가 없습니다.</td>
									</tr>
								</tobody>
							</c:if>
			            </table>  
			          </div>
			        </div>
		        </div>
	        </div>
		 <div class="container-fluid">
		  <div class="row-fluid">
		    <div class="span12">
		      <div class="widget-box">
		        <div class="widget-title">
		          <h5>하이패스 카드 등록</h5>
		        </div>
		        <div class="widget-content nopadding">
		          <form action="#" method="get" class="form-horizontal">
		            <div class="control-group">
		              <label class="control-label"> 카드번호 </label>
		              <div class="controls">
		                <input type="text" maxlength="4" class="span2" required />   -
		                <input type="password" maxlength="4" class="span2" required/>    -
		                <input type="password" maxlength="4" class="span2" required/>    -
		                <input type="password" maxlength="4" class="span2" required/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label"> 핸드폰번호 </label>
		              <div class="controls">
		                <input type="text" class="span2" name="phonNum1" maxlength="3" required/>	-
		                <input type="text" class="span2" name="phonNum2" maxlength="4" required/>	-
		                <input type="text" class="span2" name="phonNum3" maxlength="4" required/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">성별 </label>
		              <div class="controls">
		                <input type="radio" name="gender" id="woman" value="0" checked="checked"/><label for="woman" style="padding-right:10px;">여자</label>
		                <input type="radio" name="gender" id="man" value="1"/><label for="man">남자</label>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">이름</label>
		              <div class="controls">
		                <input type="text" class="span6" name="name" required/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">생년월일</label>
		              <div class="controls">
		                <input type="text" class="span6" maxlength="6" name="birth" required/><span class="help" style="color:gray">입력 예)771111</span>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">결제 선택 </label>
		              <div class="controls">
		                <input type="radio" name="pay" id="acc" value="0" checked="checked"/><label for="acc" style="padding-right:10px;">계좌출금</label>
		                <input type="radio" name="pay" id="card" value="1"/><label for="card">신용(체크)카드</label>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">출금은행명</label>
		              <div class="controls">
		              	<select name="bankName" class="span6" required="required">
		              		<option value="">선택</option>
		              		<option value="신한">신한(SH)</option>
		              		<option value="국민">국민(KB)</option>
		              		<option value="기업">기업(IBK)</option>
		              	</select>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label">계좌번호 </label>
		              <div class="controls">
		                <input type="text" class="span6" name="accoutNum" placeholder="-없이 입력" required/>
		              </div>
		            </div>
		            
		            <div class="form-actions">
		              <button type="submit" class="btn btn-success">Save</button>
		            </div>
		          </form>
		        </div>
		      </div>
		     </div>
		    </div>
		  </div>
		<!-- contents end -->
  </div> 
  <!-- container end -->
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
