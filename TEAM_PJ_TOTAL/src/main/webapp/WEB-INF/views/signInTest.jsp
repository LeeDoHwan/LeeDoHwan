<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<div id="content">
	<form action="signUpTest.lo" onsubmit="return validate();" method="post">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
		<table width="600" height="400" border="1" align="center" cellspacing="0">
		   <tr>
		      <td>아이디 </td> 
		      <td><input type="text" id="id" name="patientID" autofocus placeholder="아이디"></td>
		   </tr>
		   <tr>
		      <td>비밀번호 : </td>
		      <td><input type="password" id="pw" name="patientPW" placeholder="비밀번호"></td>
		   </tr>
		   <tr>
		      <td>비밀번호 확인  : </td>
		      <td><input type="password" id="checkpw" name="re_patientPW" placeholder="비밀번호 확인"></td>
		   </tr>
		   <tr>
		      <td>이름  : </td>
		      <td><input type="text" name="patientName" placeholder="이름"></td>
		   </tr>
		   <tr>
		      <td>성별 : </td>
		      <td>
		      	<input id= "gd" type="radio" name="gender" value = "0" checked= "checked">남성
		      	<input id= "gd" type="radio" name="gender" value = "1">여성
		      </td>
		   </tr>
		   <tr>
		      <td>주민번호 : </td>
		      <td><input type="text" id="num1" name="jumin1" placeholder="주민1" size = "10"> - <input type="text" id="num2" name="jumin2" placeholder="주민2"></td>
		   </tr>
		   <tr>
		      <td>주소 : </td>
		      <td><input type="text" name="address1" placeholder="우편번호"></td>
		     
		   </tr>
		   <tr>
		      <td><input type="text" name="address2" placeholder="지번주소"></td>
		      <td><input type="text" name="address3" placeholder="도로명주소"></td>
		   </tr>
		   <tr>
		      <td>신장 : </td>
		      <td><input type="text" name="height" placeholder="신장"></td>
		   </tr>
		   <tr>
		      <td>체중 : </td>
		      <td><input type="text" name="weight" placeholder="체중"></td>
		   </tr>
		   <tr>
		   	  <td>전화번호 : </td>
		      <td><input type="text" name="tel1" maxlength="3">-
		      	<input type="text" name="tel2" maxlength="4">-
		      	<input type="text" name="tel2" maxlength="4">-
		      </td>
		   </tr>
		   <tr>
		      <td>이메일 : </td>
		      <td><input type="email" name="email" placeholder="이메일">ex)asd@naver.com</td>
		   </tr>
		   <tr>
		   	  <td colspan = "2" align = "center">
		   	  	<input type = "submit" value = "회원가입">
		   	  </td>
		   </tr>
		</table>
	</form>
</div>
</body>
</html>
