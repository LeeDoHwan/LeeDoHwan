<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

    
<head>
	<title>login</title><meta charset="UTF-8" />
	<script type="text/javascript">
		//중복확인 버튼을 클릭하지 않은 경우
		function signInCheck() {
			var mag_confirmId="중복확인을 해주세요.";
			var msg_repwd_diff="비밀번호가 일치하지 않습니다.";
			
			if(document.loginform_pa.patientPW.value != document.loginform_pa.patientPWChk.value){
				alert(msg_repwd_diff);
				document.loginform_pa.patientPWChk.focus();
				return false;
			}
			
			if(document.loginform_pa.hiddenId.value == 0){
				alert(mag_confirmId);
				document.loginform_pa.idChk.focus();
				return false;
			}
		}
		
		function confirmId(){
			// id값 미입력시
			if(!document.loginform_pa.patientID.value){
				alert("아이디를 입력해주세요.");
				document.loginform_pa.patientID.focus();
				return false;
			}
			var url = "confirmId_pa.lo?patientID=" + document.loginform_pa.patientID.value;
			window.open(url,"confirm","menubar=no ,width=300,height =200");
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
			document.getElementById('sample4_roadAddress').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('sample4_jibunAddress').value = fullAddr;
			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample4_detailAddress').focus();
		}
	}).open();
}
</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="resources/css/matrix-login.css" />
	<link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>

<body>
    <div id="loginbox">            
        <form name = "loginform_pa" class="form-vertical" action="signUp_pa.lo" onsubmit="signInCheck();">
        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
        <input type="hidden" name="hiddenId" value="0">
 		<div class="control-group normal_text"> <h3><img src="resources/img/logo.png" alt="Logo" /></h3></div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px">아이디</span><input type="text" name="patientID" placeholder="UserId"  required autofocus style="width:50%"/>
                        <input type="button" value="중복확인" name="idChk" class="add-on bg_ly" style="width:25%; height:38px;" onclick="confirmId();">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px">패스워드</span><input type="password" name="patientPW" placeholder="Password" required autofocus />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px">패스워드확인</span><input type="password" name="patientPWChk" required autofocus />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px">이름</span><input type="text" placeholder="Name" name = "patientName" required autofocus />
                    </div>
                </div>
            </div>
         	<div class="control-group">
               <div class="controls">
                   <div class="main_input_box">
                       <span class="add-on bg_lg" style="width:80px">주민등록번호</span><input type="text" name="jumin1" maxlength="6"  style="width:31%"  required autofocus/>
                       <b style="color:white">- </b><input type="text" name="jumin2" maxlength="7" style="width:40%" required autofocus/>
                   </div>
               </div>
            </div>
            <div class="control-group">
               <div class="controls">
                   <div class="main_input_box">
                       <span class="add-on bg_lg" style="width:80px">전화번호</span><input type="text" name="hp1" maxlength="3" style="width:21%"  required autofocus/>
                       <b style="color:white">- </b><input type="text" name="hp2" maxlength="4" style="width:23%" required autofocus/>
                       <b style="color:white">- </b><input type="text" name="hp3" maxlength="4" style="width:23%" required autofocus/>
                   </div>
               </div>
            </div>
             <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px">이메일</span><input type="email" name="email" placeholder="@을 포함한 이메일을 입력하세요." required autofocus/>
                    </div>
                </div>
            </div>
             <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px">주소</span><input type="text" id="sample4_roadAddress" onclick="sample6_postcode" name="postCode" placeholder="우편번호" style="width:50%"/>
                        <input type="button" value="주소찾기" class="add-on bg_ly" style="width:25%; height:38px;" onclick = "addressSearch()" />
                        <input type="text" id="sample4_jibunAddress" name="add1" placeholder="주소" style="margin-left:97px; width:76%"/>
                       	<input type="text" id="sample4_detailAddress" name="add2" placeholder="상세주소" style="margin-left:97px; width:76%"/>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <span class="pull-right"><input type="submit" class="btn btn-success" value="회원가입"/></span>
            </div>
        </form>
        <form id="recoverform" action="#" class="form-vertical">
		<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>

                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lo"><i class="icon-envelope"></i></span>
                    </div>
                </div>
           
            <div class="form-actions">
                <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                <span class="pull-right"><a class="btn btn-info"/>Reecover</a></span>
            </div>
        </form>
    </div>
    
    <script src="resources/js/jquery.min.js"></script>  
    <script src="resources/js/matrix.login.js"></script> 
</body>

</html>
