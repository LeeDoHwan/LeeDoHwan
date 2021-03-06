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

<script type="text/javascript">
var today = new Date(); 
var date = new Date();

//이전 달 
function prevCalendar(){
	//이전 달 값을 today에저장   
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	//이전달 달력 
	buildCalendar();
}

//다음 달 
function nextCalendar(){
	//다음 달 값을 today에 저장
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	//다음달 달력
 	buildCalendar();
}

function getValue(day){
	var tbCalendarYM = document.getElementById("tbCalendarYM").innerHTML;
	var selectDate = document.getElementById("selectDate");
	var selectTime = document.getElementById("selectTime");
	selectTime.innerHTML = "";
	
	var ym = tbCalendarYM.split('.');
	var num = day.toString();
	
	if(ym[1].length < 2){
		if(num.length < 2){
			selectDate.innerHTML = ' ' + ym[0] + ' - 0' + ym[1] + ' - 0' + day;
		}else{
			selectDate.innerHTML = ' ' + ym[0] + ' - 0' + ym[1] + ' - ' + day;
		}
	}
	if(ym[1].length > 1){
		if(num.length <2){
			selectDate.innerHTML = ' ' + ym[0] + ' - ' + ym[1] + ' - 0' +day;
		}else{
			selectDate.innerHTML = ' ' + ym[0] + ' - ' + ym[1] + ' - ' +day;
		}
	}
	
	var urlName = "selectReservationTime.pa?date=" + ym[0] + "-" + ym[1] + "-" +day;
	//alert(urlName);
	
	/* $(document).ready(function(){
		$("button").click(function(){
			if(clicked){
				$(this).css('color', 'red');
				clicked = false;
			}else{
				$(this).css('color' 'blue');
				clicked = true; 
			}  
		}); 
	}); */
	
	$.ajax({
	      type : "GET",
	      url : urlName,
	      dataType : "text",
	      success : function(data) {
		          $('#getTime').html(data);
		        },
	      error : function() {
	        alert('통신실패!!');
	      }
	    });
	  
	/* window.location='getResvTime.pa'; */
}


//달력 생성
function buildCalendar(){
	//이번 달 첫째 날 
	var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	//이번 달 마지막 날
	var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
	//날짜 찍을 테이블 변수
	var tbCalendar = document.getElementById("calendar");
	var tbCalendarYM = document.getElementById("tbCalendarYM");
	
	tbCalendarYM.innerHTML = today.getFullYear() + "." + (today.getMonth() + 1);
	
	//이번달 -> 다음달
	while(tbCalendar.rows.length > 2) {
		tbCalendar.deleteRow(tbCalendar.rows.length-1);
	}
	
	var row = null; //초기화
	row = tbCalendar.insertRow();
	
	var cnt = 0; //셀의 갯수
	//1일이 시작되는 칸을 맞춤
	for(i=0; i<doMonth.getDay(); i++) {
		cell = row.insertCell();//칸만들기
		cnt = cnt + 1;
	}
	
	
	//달력출력
	for(i=1; i<=lastDate.getDate(); i++) {
		
		cell = row.insertCell();
		cell.style.fontSize = '1.2em';
		var calendarDate = new Date(today.getFullYear(), today.getMonth(), i);
		var todayDate = new Date(date.getFullYear(), date.getMonth(), date.getDate());
		if(calendarDate.getTime() < todayDate.getTime()){
			cell.style.color = 'lightgray';
			cell.innerHTML = "<font color=lightgray>" + i
			
		}else{
			
			cell.innerHTML = '<button style="color:gray; border:none; background:#F9F9F9;" onclick="getValue('+  i + ');">' + i + '</button>';
		}
		cnt = cnt + 1;
		
		//일요일 계산 
		if(cnt%7 == 1){
			cell.innerHTML = "<font color=lightgray>" + i
		}
		
		//토요일 계산 
		//셀 추가 
		if(cnt%7 == 0){
			cell.innerHTML = "<font color=#F79DC2>" + i
			//토요일 다음에 올 셀
			row = calendar.insertRow();
		}
		
		//오늘 날짜에 색주기 
		if(today.getFullYear() == date.getFullYear() 
				&& today.getMonth() == date.getMonth() 
				&& i == date.getDate()){
			cell.style.color = 'red';
			/* cell.bgColor = "red"  */
		}
	}
}

// 시간 클릭
function clickTime(){
	var time = $("input[name='apptTime']:checked").val();

	var selectTime = document.getElementById("selectTime");
	selectTime.innerHTML = time;
	
}

// 선택검사 클릭
function clickClinic(){
	var clinic = "";
	$("input[name='addCheckup']:checked").each(function(){
		var name;
		if($(this).val()==0){
			name = "유방암";
		}else if($(this).val()==1){
			name = "폐렴";
		}else if($(this).val()==2){
			name = "심장병";
		}else if($(this).val()==3){
			name = "뇌종양";
		}else if($(this).val()==4){
			name = "폐결핵";
		} 
		if(clinic == ""){
			
			clinic += name;
		
		}else{
			clinic += "," + name;
		}	
	});
	
	selectClinic.innerHTML = clinic;
}

// 예약하기 체크여부
function apptChk(){
	if($('input:radio[name="apptTime"]:checked').length < 1){
		alert("건강검진 예약일정을 선택해주세요.");
		return false;
	}
}

</script>
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
       	        <p class="text-white mt-5 mb-5"><b>검진 예약</b></p>
       	    </div>
     	 </div>
<!-- msg close -->

<!-- contents start -->
		  <div class="container-fluid">
		  <div id="content-section">
		  
		
			  <div class="editWrap">
			  	<ul class="navbar-nav mx-auto h-100">
			  	<!-- msg start  -->
	       	        <p class="text-white"><b>검진 스케줄</b></p>
				<!-- msg close -->
			  		<li>
			  			<div class="clinicAppointment">
			  				<div class="clinicCalendar">
			  					
								<table id="calendar">
									<tr>
										<td colspan="2" align="right">
											<label onclick="prevCalendar()">
												<img src="resources/img/icons/park/preview.png">
											</label>
										</td>
										<td id="tbCalendarYM" colspan="3" align="center">
											yyyy.mm
										</td>
										<td colspan="2" align="left">
											<label onclick="nextCalendar()">
												<img src="resources/img/icons/park/nextview.png">
											</label>
										</td>
									</tr>
									<tr id="calendarDay">
										<td>일</td>
										<td>월</td>
										<td>화</td>
										<td>수</td>
										<td>목</td>
										<td>금</td>
										<td>토</td>
									</tr>
							
								
								<script type="text/javascript">
								    buildCalendar();
								</script>
								
								</table>
							</div>
							
							 <form action="appointmentPro.pa" method="post" name="apptmentform" onsubmit="return apptChk();">
								 <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
								 
							
			  				<div class="clinicTime">
			  					<div class="MiddleTitle">진료시간</div>
			  					<div id = "getTime">
			  						<br><br><br><br><br><br><br><br><br>
								    날짜를 선택하세요.
			  					</div>
			  				</div>
			  				
			  				
								
			  				<div class="checkupSelect">
			  					<table>
			  						<tr>
			  							<td>선택검사</td>
			  							<td>
			  								<label>
					  						<input type="checkbox" id="breast" name="addCheckup" value="0" onclick="clickClinic();">
					  						유방암</label>
					  					
			  								<label>
					  						<input type="checkbox" id="pneumonia" name="addCheckup" value="1" onclick="clickClinic();">
					  						폐렴</label>
					  					
			  								<label>
					  						<input type="checkbox" id="heart" name="addCheckup" value="2" onclick="clickClinic();">
					  						심장병</label>
					  					
			  								<label>
					  						<input type="checkbox" id="brain" name="addCheckup" value="3" onclick="clickClinic();">
					  						뇌종양</label>
					  					
			  								<label>
					  						<input type="checkbox" id="tuberculosis" name="addCheckup" value="4" onclick="clickClinic();">
					  						폐결핵</label>
					  					</td>
			  						</tr>
			  					</table>
			  				</div>
			  			</div>
			  		</li>
			  		<p class="text-white mt-5"><b>검진 스케줄</b></p>
			  		
			  		<li>
			  			<div class="clinicAppointment">
			  				<div class="checkupForm">
			  					<div>
									<div>검진날짜 :<span id="selectDate"></span></div>
		 						</div>
		 						<div>
									<div>검진시간 :<span id="selectTime"></span></div>
		  						</div>
		  						<div>
									<div>선택검진 :<span id="selectClinic"></span></div>
		  						</div>
		  						<div>
		  							<div>
									<input type="submit" class="btn btn-primary" value="예약하기">
									</div>
								</div>
					  			
			  				</div>
			  			</div>
			  		</li>
			  		
			  	</ul>
		  	</div>
		  	
		    </form>
			</div>
		</div>
<!-- contents end -->

	   </div>     
	</div>
<!-- container end -->

<!--Footer-part-->

	<%@ include file="../include/footer.jsp" %>
	
<!--end-Footer-part-->

<script src="resources/js/excanvas.min.js"></script> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/jquery.ui.custom.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.flot.min.js"></script> 
<script src="resources/js/jquery.flot.resize.min.js"></script> 
<script src="resources/js/jquery.peity.min.js"></script> 
<script src="resources/js/matrix.js"></script> 
<script src="resources/js/fullcalendar.min.js"></script> 
<script src="resources/js/matrix.calendar.js"></script> 
<script src="resources/js/matrix.chat.js"></script> 
<script src="resources/js/jquery.validate.js"></script> 
<script src="resources/js/matrix.form_validation.js"></script> 
<script src="resources/js/jquery.wizard.js"></script> 
<script src="resources/js/jquery.uniform.js"></script> 
<script src="resources/js/select2.min.js"></script> 
<script src="resources/js/matrix.popover.js"></script> 
<script src="resources/js/jquery.dataTables.min.js"></script> 
<script src="resources/js/matrix.tables.js"></script> 
<script src="resources/js/matrix.interface.js"></script> 

</body>
</html>
