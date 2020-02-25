<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MyPage</title>
    
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
	<c:if test = "${sessionScope.authority == 'ROLE_DOCTOR'}">
		<%@ include file="../include/dr-header-test.jsp" %>
	</c:if>
	<c:if test = "${sessionScope.authority == 'ROLE_ADMIN'}">
		<%@ include file="../include/dr-header-test.jsp" %>
	</c:if> 
	
<!-- header end -->

<!-- container -->
		<div class="container">
		
<!-- msg start  -->
      	 <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>마이페이지</b></p>
       	    </div>
     	 </div>
<!-- msg close -->
  
		<!-- contents start -->
		 <div class="container-fluid">
		  <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">계정</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="patientID">아이디</label>
                  <input
                    id="patientID"
                    name="patientID"
                    type="text"
                    class="form-control validate"
                    value="${sessionScope.mem_id}"
                    readonly
                  />
                </div>
                
                <div class="form-group col-lg-6">
                </div>
                
                <div class="form-group col-lg-6">
                  <label for="patientPW">비밀번호</label>
                  <input
                    id="patientPW"
                    name="patientPW"
                    type="password"
                    class="form-control validate"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-6">
                  <button class="btn-mod btn-primary btn-block text-uppercase" style="">
               		변경
             	 </button>
                </div>
                <div class="form-group col-lg-12">
                <label for="jumin1">주민번호</label> 
                </div>
                <div class="form-group col-lg-5" style="padding-right: 0px;">
                  <input
                    id="jumin1"
                    name="jumin1"
                    type="text"
                    class="form-control validate"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-2" style="padding-right: 5px; padding-left: 5px; text-align:center; color:white">-</div>
                <div class="form-group col-lg-5" style="padding-right: 0px; padding-left: 0px;">
                  <input
                    id="jumin2"
                    name="jumin2"
                    type="text"
                    class="form-control validate"
                    readonly
                  />
                </div>
              </form>
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">내 정보</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-4">
                  <label for="name">이름</label>
                  <input
                    id="name"
                    name="name"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-8"></div>
                <div class="form-group col-lg-4">
                  <label for="email">나이</label>
                  <input
                    id="email"
                    name="email"
                    type="email"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-8"></div>
                <div class="form-group col-lg-4">
                  <label for="password">신장</label>
                  <input
                    id="password"
                    name="password"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-4">
                  <label for="password2">체중</label>
                  <input
                    id="password2"
                    name="password2"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-4"></div>
                <div class="form-group col-lg-4">
                  <label for="hp">전화번호</label>
                  <input
                    id="hp"
                    name="hp"
                    type="tel"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-8">
                  <label for="email">이메일</label>
                  <input
                    id="email"
                    name="email"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                
                <div class="col-12">
                  <button
                    type="submit"
                    class="btn-mod-flat btn-primary btn-block text-uppercase"
                  >
                    	저장
                  </button>
                </div>
                
                <div class="col-12"></div>
                
                <div class="form-group col-lg-4">
                  <label for="postCode">우편번호</label>
                  <input
                    id="postCode"
                    name="postCode"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-4">
                  <button class="btn-mod btn-primary btn-block text-uppercase" style="margin-top:15%; margin-left:0;">
               		우편번호 검색
             	  </button>
                </div>
                <div class="form-group col-lg-6">
                  <input
                    id="jibunAddress"
                    name="jibunAddress"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6"></div>
                <div class="form-group col-lg-6">
                  <input
                    id="detailAddress"
                    name="detailAddress"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                	<button class="btn-mod btn-primary btn-block text-uppercase" style="margin-top:0;">
               			변경
             	    </button>
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
