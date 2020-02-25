<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    
<head>
	<title>login</title><meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
	<link rel="stylesheet" href="resources/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="resources/css/matrix-login.css" />
	<link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>

<body>
    <div id="loginbox">            
        <form id="loginform" class="form-vertical" action="loginPro.lo" method = "post">
        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
        <input type = "hidden" name = "authority" value = "${param.authority}">
 		<div class="control-group normal_text"> <h3>Login</h3></div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lg"><i class="icon-user"> </i></span><input type="text" name = "id" placeholder="Username" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" name = "pwd" placeholder="Password" />
                    </div>
                </div>
         
         	<span class="pull-right" style="padding-right:25px">
         		<h5><a href="signin.lo?authority=${param.authority}">Sign In</a></h5>
         	</span>
         
            </div>
            
            <div class="form-actions">
                <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">Lost ID or password?</a></span>
                
                <span class="pull-right"><input type="submit" class="btn btn-success" value = "Login"/></span>
            </div>
        </form>
        
        <!-- 아이디, 비밀번호 찾기 -->
        <form id="recoverform" action="#" class="form-vertical">
        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
		<!-- <p class="normal_text"> 비밀번호 찾기 </p>

                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lo"><i class="icon-phone"></i></span><input type="text" placeholder="휴대전화번호 입력" />
                    </div>
                
         -->  
          <div class="widget-box">
          <div class="widget-title">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" href="#tab1">아이디 찾기</a></li>
              <li><a data-toggle="tab" href="#tab2">비밀번호 찾기</a></li>
            </ul>
          </div>
          <div class="widget-content tab-content">
            <div id="tab1" class="tab-pane active">
            	<h3 style="color : white !important;"> 아이디 찾기 </h3>
             	<div class="controls">
		           	<div class="main_input_box">
		            	<span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="이메일 입력" />
		            </div>
	            </div>
                        
            </div>
            <div id="tab2" class="tab-pane">
				<h3 style="color : white !important;"> 비밀번호 찾기 </h3>
             	<div class="controls">
		           	<div class="main_input_box">
		            	<span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="이메일 입력" />
		            </div>
	            </div>

            </div>
          </div>
        </div>
                                         
            <div class="form-actions">
                <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                <span class="pull-right"><a class="btn btn-info"/>Reecover</a></span>
            </div>
        </form>
        
    </div>
    
    <script src="resources/js/jquery2.min.js"></script>  
    <script src="resources/js/matrix.login.js"></script> 
    
</body>

</html>
