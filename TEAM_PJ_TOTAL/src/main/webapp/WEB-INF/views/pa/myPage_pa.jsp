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
	<!-- <link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
	<link rel="stylesheet" href="resources/css/matrix-style.css" />
	<link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> -->
	<!-- 끝 -->
	
	<!-- setting : 현재 부트스트랩 css 추가. 순서대로 안하면 깨져서 우선 현재 부트스트랩만 추가해놓음.-->
    <%@ include file = "../include/setting.jsp" %> 

</head>

<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">


function showModPw(){ 	
		$('.ModBefore').css("display","none");	// 숨김
		$('.ModAfter').css("display","block");	// 표시
}	

function BackToMod(){ 	
	$('.ModAfter').css("display","none");	// 숨김
	$('.ModBefore').css("display","block");	// 표시
}

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//주소찾기
function addressSearch(){
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; //최종 주소 변수
			var extraAddr = ''; //조합형 주소 변수
			
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if(data.userSelectedType === 'R') { //사용자가 도로명 주소를 선택했을 경우 
				fullAddr = data.roadAddress;
			} else { //사용자가 지번주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}
			
			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다.
				if(data.bname != '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== '') {  
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}
			  
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('address2').value = fullAddr;
			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('address3').focus();
		}
	}).open();
}
</script>

<style>

	.ModAfter {
		display : none;		
	}

</style>

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
       	        <p class="text-white mt-5"><b>마이페이지</b></p>
       	    </div>
     	 </div>
<!-- msg close -->
  
	<!-- contents start -->
	 <div class="container-fluid">
	    <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
          <!-- 계정 -->
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
           
              <h2 class="tm-block-title">계정</h2>
           
              <form action="myPageModPw.pa" method="post" class="tm-signup-form row">
              <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
       		  <input type="hidden" name="hiddenId" value="0">
                <div class="form-group col-lg-7">
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
                
                <div class="form-group col-lg-12">
                </div>
                
                <div class="form-group col-lg-7 ModBefore">
                  <label for="patientPW">비밀번호</label>
                  <input
                    id="patientPW"
                    name="patientPW"
                    type="password"
                    class="form-control validate"
                    value="${vo.patientPW}"
                    readonly
                    maxlength=10
                  />
                </div>
                <div class="form-group col-lg-5 ModBefore">
                  <input type="button" class="btn-rad btn-primary btn-block" value="변경" style="margin-top:30%;" onclick="showModPw()">
                </div>
                
                <!-- 위의 변경 버튼을 누르면 나타나게 할 것임. -->
               	<div class="form-group col-lg-12 ModAfter">
	                 <input
	                   id="prePatientPW"
	                   name="prePatientPW"
	                   type="password"
	                   class="form-control validate"
	                   placeholder="현재 비밀번호"
	                   maxlength=10
	                 />
              	</div>
               	<div class="form-group col-lg-12 ModAfter">
	                 <input
	                   id="newPatientPW"
	                   name="newPatientPW"
	                   type="password"
	                   class="form-control validate"
	                    placeholder="신규 비밀번호"
	                   maxlength=10
	                 />
               	</div>
               	<div class="form-group col-lg-12 ModAfter">
	                 <input
	                   id="newPatientPWchk"
	                   name="newPatientPWchk"
	                   type="password"
	                   class="form-control validate"
	                    placeholder="신규 비밀번호 확인"
	                   maxlength=10
	                 />
               	</div>
              	<div class="form-group col-lg-6 ModAfter">
               	   <input type="submit" class="btn-rad btn-primary btn-block" value="변경">
               	</div>
              	<div class="form-group col-lg-6 ModAfter">
                   <input type="reset" class="btn-rad btn-primary btn-block" value="취소" onclick="BackToMod()" >
              	 </div>
	            <!-- 끝 -->   
                
                <div class="form-group col-lg-12">
                <label for="jumin1">주민번호</label> 
                </div>
                <div class="form-group col-lg-5" style="padding-right: 0px;">
                  <input
                    id="jumin1"
                    name="jumin1"
                    type="text"
                    class="form-control validate"
                    value="${vo.jumin1}"
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
                    value="${vo.jumin2}"
                    readonly
                  />
                </div>
              </form>
            </div>
          </div>
          
          <!-- 내 정보 -->
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
             
              <h2 class="tm-block-title">내 정보</h2>
             
              <form action="myPageModInfo.pa" method="post" class="tm-signup-form row">
              <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
       		  <input type="hidden" name="hiddenId" value="0">
                <div class="form-group col-lg-4">
                  <label for="name">이름</label>
                  <input
                    id="name"
                    name="name"
                    type="text"
                    value="${vo.patientName}"
                    class="form-control validate"
                    readonly
                  />
                </div>
                <%-- <div class="form-group col-lg-8"></div>
                <div class="form-group col-lg-4">
                  <label for="age">나이</label>
                  <input
                    id="age"
                    name="age"
                    type="text"
                    value="${vo.age}"
                    class="form-control validate"
                    readonly
                  />
                </div> --%>
                <!--<div class="form-group col-lg-8"></div>
                 <div class="form-group col-lg-4">
                  <label for="height">신장</label>
                  <input
                    id="height"
                    name="height"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-4">
                  <label for="weight">체중</label>
                  <input
                    id="weight"
                    name="weight"
                    type="text"
                    class="form-control validate"
                  />
                </div> -->
                <div class="form-group col-lg-8"></div>
                <div class="form-group col-lg-4">
                  <label for="tel">전화번호</label>
                  <input
                    id="tel"
                    name="tel"
                    type="text"
                    value="${vo.tel}"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-8">
                  <label for="email">이메일</label>
                  <input
                    id="email"
                    name="email"
                    type="text"
                    value="${vo.email}"
                    class="form-control validate"
                    readonly
                  />
                </div>
                
                <div class="col-12">
                  <input
                    type="submit"
                    class="btn-rad btn-primary btn-block text-uppercase" value="저장"
                  >
                </div>
               </form>
               
              <!-- margin 역할용 -->
               <div class="col-12">&nbsp;</div>
                
              <!-- 우편번호 수정  --> 
               <form action="myPageModAddr.pa" method="post" class="tm-signup-form row"> 
                <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
       		  	<input type="hidden" name="hiddenId" value="0">
                <div class="form-group col-lg-4">
                  <label for="postCode">우편번호</label>
                  <input
                    id="address1"
                    name="address1"
                    type="text"
                    value="${vo.address1}"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-4">
                  <button type="button" class="btn-rad btn-primary btn-block text-uppercase" style="margin-top:18%;" onclick = "addressSearch()">
               		우편번호 검색
             	  </button>
                </div>
                <div class="form-group col-lg-6">
                  <input
                    id="address2"
                    name="address2"
                    type="text"
                    value="${vo.address2}"
                    placeholder="지번주소 입력"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6"></div>
                <div class="form-group col-lg-6">
                  <input
                    id="address3"
                    name="address3"
                    type="text"
                    value="${vo.address3}"
                    class="form-control validate"
                    placeholder="상세주소 입력"
                  />
                </div>
                <div class="form-group col-lg-6">
                	<input type="submit" class="btn-rad btn-primary btn-block text-uppercase" style="margin-top:0;" value="변경">
                </div>
                
              </form>
            </div>
          </div>
          
          <div class="tm-block-col col-12">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
          		<h2 class="tm-block-title">검진기록 조회</h2>
          	
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
<!-- <script src="resources/js/jquery.uniform.js"></script>  예쁘게하는데에 필요
<script src="resources/js/select2.min.js"></script> 예쁘게하는데에 필요
<script src="resources/js/jquery2.min.js"></script> 필요
<script src="resources/js/bootstrap2.min.js"></script> 필요
<script src="resources/js/jquery.dataTables.min.js"></script> 필요
<script src="resources/js/matrix.tables.js"></script> 필요 -->
<!-- 끝 -->

</body>
</html>
