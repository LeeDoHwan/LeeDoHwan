<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/setting.jsp" %> 
<html>
<body>
<form action = "confirmId_dc.lo" method = "post" name = "confirmform" class="form-vertical">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
<c:if test = "${selectCnt == 1}">
	<div class="control-group normal_text"> 
		<h3>아이디 중복확인</h3>
	</div>
    <div class="control-group">
        <div class="controls">
            <div class="main_input_box">
            	<span class="add-on bg_lg" style="width:200px">${doctorID}</span>는 사용할 수 없습니다.<br>
            </div>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="main_input_box">
            	<span class="add-on bg_lg"><i class="icon-user">아이디</i></span>
                <input type = "text" name = "patientID" maxlength ="30" autofocus required>
            </div>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="main_input_box">
            	<input class = "btn btn-success" type ="submit" value = "확인">
				<input class = "btn btn-success" type = "reset" value = "취소" onclick = "self.close();">
            </div>
        </div>
    </div>
</c:if>

<c:if test = "${selectCnt == 0}">
	<div class="control-group normal_text"> 
		<h3>아이디 중복확인</h3>
	</div>
    <div class="control-group">
        <div class="controls">
            <div class="main_input_box">
            	<span class="add-on bg_lg" style="width:80px">${doctorID}</span>는 사용할 수 있습니다.<br>
            	<input class = "btn btn-success" type = "button" value ="확인" onclick="setId('${doctorID}');">
            </div>
        </div>
    </div>
</c:if>
</form>

<script type="text/javascript">
//opener : window 객체의 open() 메소드로 열린 새창(=중복확인창)에서
// 열어준 부모창(=회원가입창)에 접근할 때 사용
// self.close(); 메세지 없이 현재창을 닫을 때 사용
function setId(id){
	opener.document.loginform_dc.doctorID.value = id;
	opener.document.loginform_dc.hiddenId.value = "1";
	self.close();
}
</script>
</body>
</html>