<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
//중복확인 버튼을 클릭하지 않은 경우
function signInCheck() {
	var mag_confirmId="중복확인을 해주세요.";
	var msg_repwd_diff="비밀번호가 일치하지 않습니다.";
	
	if(document.loginform_dc.doctorPW.value != document.loginform_dc.doctorPWChk.value){
		alert(msg_repwd_diff);
		document.loginform_dc.doctorPWChk.focus();
		return false;
	}
	
	if(document.loginform_dc.hiddenId.value == 0){
		alert(mag_confirmId);
		document.loginform_dc.idChk.focus();
		return false;
	}
}

function confirmId(){
	// id값 미입력시
	if(!document.loginform_dc.doctorID.value){
		alert("아이디를 입력해주세요.");
		document.loginform_dc.doctorID.focus();
		return false;
	}
	var url = "confirmId_dc.lo?doctorID=" + document.loginform_dc.doctorID.value;
	window.open(url,"confirm","menubar=no ,width=300,height =200");
}
</script>   

 
<head>
	<title>login</title><meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="resources/css/matrix-login.css" />
	<link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>


<body>
    <div id="loginbox">            
        <form id="loginform" name = "loginform_dc" class="form-vertical" action="signUp_dc.lo" onSubmit="return signInCheck();">
        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
        <input type="hidden" name="hiddenId" value="0">
 		<div class="control-group normal_text"><a style="color:white; font-size:30px;">Doctor Sign In</a></div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px;">아이디</span><input type="text" name="doctorID" placeholder="doctorID" required autofocus style = "width : 50%"/>
                    	<input type="button" value="중복확인" name="idChk" class="add-on bg_ly" style="width:25%; height:38px;" onclick="confirmId();">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly" style="width:80px;">패스워드</span><input type="password" id="doctorPW" name="doctorPW" placeholder="Password" onchange="isSame()" required/>
                    </div>
                </div>
            </div>
              <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly" style="width:80px;">패스워드확인</span><input type="password" name="doctorPWChk" onkeyup="passwordCheckk()" placeholder="PasswordCheck" onchange="isSame()" required/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px;">이름</span><input type="text" name="doctorName" placeholder="UserName" required/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px;">면허번호</span><input type="text" name="licence" placeholder="Licence" required/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px;">전화번호</span><input type="text" name="tel" placeholder="Tel" required/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg" style="width:80px;">이메일</span><input type="email" name="email" placeholder="Email" required/>
                    </div>
                </div>
            </div>
            <div class="form-actions">
               <!--  <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">Lost password?</a></span> -->
                <span class="pull-right"><input type="submit" class="btn btn-success" value="SignIn"/></span>
            </div>
        </form>
        <form id="recoverform" action="#" class="form-vertical">
		<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>

                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
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
