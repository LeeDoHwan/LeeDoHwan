<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Admin - Dashboard HTML Template</title>
    
    <!-- 기존 부트스트랩 css 추가 부분 -->
	<link rel="stylesheet" href="resources/css/bootstrap2.min.css" />
	<link rel="stylesheet" href="resources/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="resources/css/uniform.css" />
	<link rel="stylesheet" href="resources/css/select2.css" />
	<link rel="stylesheet" href="resources/css/matrix-style.css" />
	<!-- 끝 -->
    
    <!-- setting : 현재 부트스트랩 css 추가. 순서대로 안하면 깨져서 우선 현재 부트스트랩만 추가해놓음.-->
    <%@ include file = "../include/setting.jsp" %> 
    
</head>

<script type="text/javascript">  
function ajaxCalendar(){
    $.ajax({
      type : "GET",
      url : "fullcalendar.lo",
      dataType : "text",
      success : function(data) {
	          $('#calendar').html(data);
	        },
      error : function() {
        alert('통신실패!!');
      }
    });
  }
  
  
  
function keyupName(){ 	
	var result = $('#name').val();	// 입력한 키워드
	
	if(result.length == 0){	// 글자수가 0인 경우
		$('#display').css("visibility","hidden");	// 숨김
	}else{
		$('#display').css("visibility","visible");	// 표시
		/* result -> 컨트롤러/search_next.jsp -> data -> 콜백함수 -> display */
		$.ajax({
			url : "searchPro", // {컨트롤러}/이동페이지
			type : 'POST',
			data : $("#searchForm").serialize(),
			success: function(data){
				$('#display').html(data);
			},
			error : function(){
				alert("오류");
			}
		});
	}	
}  

function searchPatient(patientName){ 
	$.ajax({
		url : "diagnosis?patientName=" + patientName, // {컨트롤러}/이동페이지
		success: function(data){
		},
		error : function(){
			alert("오류");
		}
	});
}
</script>


<body id="reportsPage">    
	<div class="" id="home">

<!-- header start -->
	<%@ include file="../include/dr-header-test.jsp" %>
<!-- header end -->

<!-- container -->
	<div class="container-dig">
<!-- msg start  -->
      	 <div class="row">
       	    <div class="col">
       	        <p class="text-white mt-5 mb-5"><b>diagnosis</b></p>
       	    </div>
     	 </div>
<!-- msg close -->

    <div class="container-fluid">
    <div class="row-fluid">
    <div class = "span12">
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>예약 환자 목록</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>환자이름</th>
                  <th>예약날짜</th>
                  <th>진료상태</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var = "dto" items = "${dtos}">
                <tr class="gradeX">
                  <td><a href = "diagnosis.dr?patientName=${dto.patientName}">${dto.patientName}</a></td>
                  <td>${dto.reservationTime}</td>
                  <td class="center">
					<c:if test = "${dto.reservationState == 0}">
						예약완료
					</c:if>
					<c:if test = "${dto.reservationState == 1}">
						검사완료
					</c:if>
				  </td>
                </tr>
                </c:forEach>
                <tr>
                  <td>이도환</td>
                  <td>배아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>박건형</td>
                  <td>머리아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>김동규</td>
                  <td>배아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>허성민</td>
                  <td>머리아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>한상진</td>
                  <td>배아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>김현수</td>
                  <td>머리아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>허소정</td>
                  <td>배아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>박미성</td>
                  <td>머리아픔</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>장진호</td>
                  <td>배아픔</td>
                  <td class="center">날짜</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
	</div>
	</div>
	</div>
  
  <div class="container-fluid">
    <div class="row-fluid">
    <div class="span4">
      <div class="widget-box">        
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>환자 정보</h5>
        </div>
        <div class="widget-content"> <!--  nopadding -->
        <form action="#" method="get" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">환자 이름 :</label>
              <div class="controls">
                <input type="text" class="span7" name = "patientName" placeholder="patientName" value = "${vo.patientName}" readonly/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">나이 :</label>
              <div class="controls">
                <input type="text" class="span7" name = "age" placeholder="age" value = "${vo.age}" readonly />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">주민번호 :</label>
              <div class="controls">
                <input type="text"  class="span5" name = "height" placeholder="jumin1" value = "${vo.jumin1}" readonly /> -
                <input type="text"  class="span6" name = "height" placeholder="jumin2" value = "${vo.jumin2}" readonly />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">성별 :</label>
              <div class="controls">
                <input type="text" class="span7" name = "gender" placeholder="gender" 
                <c:if test = "${vo.gender==0}"> value = "여성"</c:if> 
                <c:if test = "${vo.gender==1}"> value = "남성"</c:if>
                readonly />
              </div>
            </div>
            </form>
        </div>
      </div>
      <div class="widget-box">        
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>기초 검사</h5>          
        </div>
        <div class="widget-content"> <!--  nopadding -->
        <form action="#" method="get" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">신 장 :</label>
              <div class="controls">
                <input type="text" class="span5" placeholder="신 장" value = "185" readonly/>&nbsp;&nbsp;cm 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">체 중 :</label>
              <div class="controls">
                <input type="text" class="span5" placeholder="체 중" value = "80" readonly/>&nbsp;&nbsp;kg 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">허 리 둘 레 :</label>
              <div class="controls">
              	<!-- 남 90미만 / 여 85미만 -->
                <input type="text" class="span5" placeholder="허 리 둘 레" value = "80" readonly/>&nbsp;&nbsp;cm 
                <span class="help-block blue span12"> 남 90미만 / 여 85미만</span>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">체질량지수(BMI) :</label>
              <div class="controls">
              	<!-- 체중을 키의 제곱으로 나눈 체질량지수(BMI)를 기준으로 한다. 18.5~24.9까지가 정상이며 26부터는 과체중, 30부터는 고도비만으로 본다.
              	 -->
                <input type="text" class="span5" placeholder="체질량지수" value = "18.5" readonly/>&nbsp;&nbsp;kg/m2 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">시력 (좌/우) :</label>
              <div class="controls">
                <input type="text" class="span5" placeholder="시력 (좌/우)" value = "1.0 / 1.2" readonly/> 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">청력 (좌/우) :</label>
              <div class="controls">
              	<!-- 0~40dB 정상, 40~60dB 가벼운 난청, 60dB 고도의 난청 -->
                <input type="text" class="span5" placeholder="청력 (좌/우)" value = "20 / 30" readonly/>&nbsp;&nbsp;dB 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">혈압(최고/최저) :</label>
              <div class="controls">
              <!-- 혈압의 경우 정상수치는 이완기 80mmHg 미만, 수축기 120mmHg 미만이다. 이완기 혈압이 95mmHg 이상, 수축기 145mmHg 이상일 경우 2차 진단이 필요하다.
               -->
                <input type="text" class="span5" placeholder="혈압(최고/최저)" value = "150 / 100" readonly/>&nbsp;&nbsp;mmHg 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">요 단 백 :</label>
              <div class="controls">
              <!-- 요단백의 경우 수치가 아닌 ‘음성’과 ‘양성’으로 표기된다. 양성의 경우 소변 속에 단백질 검출 반응이 일어났다는 뜻으로, 마찬가지로 신장 기능이 좋지 않다는 것을 의미한다.
               -->
                <input type="text" class="span5" placeholder="요단백" value = "음성" readonly/>   
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">혈 색 소(Hb) :</label>
              <div class="controls">
              <!-- 혈색소는 혈액 속에서 산소를 몸 전체로 운반하는 역할을 하며 ‘헤모글로빈’이라고도 부른다. 
              		혈색소 수치가 높으면 혈당이 과다하는 것을 의미한다. 또 혈색소 수치가 기준보다 낮으면 빈혈·관절염·백혈병 등을 의심할 수 있다. 
              		남성의 경우 100mL당 13~16.6g/dL, 여성은 12~15.5g/dL가 정상이다.
               -->
                <input type="text" class="span5" placeholder="혈색소" value = "13" readonly/>&nbsp;&nbsp;g/dL  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">식전혈당 :</label>
              <div class="controls">
              <!-- 당뇨병 여부를 알 수 있는 혈당 수치의 경우 꼭 확인해야 한다. 
			              혈당은 8시간 금식한 후에 측정했을 때 70~120mg/dL사이가 나오면 정상이다. 
			              보통 126mg/dL이 넘으면 당뇨병으로 진단한다.
               -->
                <input type="text" class="span5" placeholder="혈당" value = "90" readonly/>&nbsp;&nbsp;mg/dL  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">총콜레스테롤 :</label>
              <div class="controls">
              	<!-- 정상 : 200미만 -->
                <input type="text" class="span5" placeholder="총콜레스테롤" value = "180" readonly/>&nbsp;&nbsp;mg/dL  
              </div>
            </div>
         	<div class="control-group">
              <label class="control-label">HDL-콜레스테롤 :</label>
              <div class="controls">
              <!-- 고밀도 콜레스테롤이라고도 불리는 HDL 콜레스테롤은 혈액 속 나쁜 지방 성분을 밖으로 배출시키는 역할을 한다. 
              		따라서 해당 수치가 높을수록 좋다. 
            	  	HDL 콜레스테롤 정상 수치는 60mg/dL 이상이다.
               -->
                <input type="text" class="span5" placeholder="HDL" value = "80" readonly/>&nbsp;&nbsp;mg/dL  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">트리글리세라이드 :</label>
              <div class="controls">
              <!-- 정상 : 100~150 미만
               -->
                <input type="text" class="span5" placeholder="트리글리세라이드" value = "120" readonly/>&nbsp;&nbsp;mg/dL  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">LDL-콜레스테롤 :</label>
              <div class="controls">
              <!-- 음식으로 섭취한 콜레스테롤이 혈관을 통해 세포로 전달될 때 LDL 콜레스테롤의 형태로 운반된다. 
			              그런데 혈관 속 LDL 콜레스테롤이 많으면 일부는 세포로 운반되지 못하고 혈관벽에 쌓여 혈액을 끈적하게 만들고 혈전을 형성한다. 
			              혈전이 생기면 혈관이 좁아지고, 심한 경우 혈관이 막혀 심근경색이나 뇌졸중 등이 발생한다. 
			       LDL 콜레스테롤 정상 수치는 100mg/dL 이하이다.
               -->
                <input type="text" class="span5" placeholder="LDL" value = "90" readonly/>&nbsp;&nbsp;mg/dL  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">혈청크레아티닌 :</label>
              <div class="controls">
              <!-- 혈청크레아티닌은 체내에서 에너지로 사용된 단백질의 노폐물이다. 
              		크레아티닌은 근육에 존재하는 성분으로 신장 사구체에서 걸러진다. 
              		그런데 신장이 손상된 사람은 크레아티닌이 걸러지지 못하기 때문에 수치가 높아진다. 
              		하지만 크레아티닌 수치가 높다고 모두 신장에 이상이 있는 것은 아니다. (만성신장질환)
              		노화, 공복 상태, 수분 부족, 영양 불균형 등이 수치의 이상을 유발하기 때문이다. 
              		일반적으로 남자 0.6~1.1mg/dL, 여자 0.4~0.8mg/dL이 정상 범위이다.
               -->
                <input type="text" class="span5" placeholder="혈청크레아티닌" value = "0.7" readonly/>&nbsp;&nbsp;mg/dL  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">AST(SGOT) :</label>
              <div class="controls">
              <!-- AST와 ALT는 간염의 정도를 보여주는 대표적인 지표다. 
              		간세포 안에 들어 있는 효소인 AST·ALT는 0~32U/L이 정상 수치다. 
              		AST의 경우 51 이상, ALT는 46 이상일 경우 질환 의심자로 판단된다.               -->
                <input type="text" class="span5" placeholder="AST(SGOT)" value = "25" readonly/>&nbsp;&nbsp;U/L  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">ALT(SGPT) :</label>
              <div class="controls">
              <!-- AST와 ALT는 간염의 정도를 보여주는 대표적인 지표다. 
              		간세포 안에 들어 있는 효소인 AST·ALT는 0~32U/L이 정상 수치다. 
              		AST의 경우 51 이상, ALT는 46 이상일 경우 질환 의심자로 판단된다.               -->
                <input type="text" class="span5" placeholder="ALT(SGPT)" value = "17" readonly/>&nbsp;&nbsp;U/L  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">감마지티피 :</label>
              <div class="controls">
              <!-- GGT는 술을 많이 마시면 간에서 갑자기 증식하는 효소이다. 
			              알코올성간기능장애가 있으면 수치가 올라간다. 
			       GGT로 비만·당뇨·동맥경화증을 예상하기도 한다. 
			              수치가 높으면 알코올성간염이나 지방간 가능성이 있다. 
			              남성은 11~63IU/L, 여성은 8~35IU/L 이내가 정상이다.
                -->
                <input type="text" class="span5" placeholder="감마지티피" value = "37" readonly/>&nbsp;&nbsp;U/L  
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">흉부방사선검사 :</label>
              <div class="controls">
              <!-- 정상 / 비활동성
                -->
                <input type="text" class="span5" placeholder="흉부방사선검사" value = "정상" readonly/>
              </div>
            </div>
            </form>
        </div>
      </div> 
	</div>
	
    <div class="span8">
      
      <div class="widget-box">
        <div class="widget-title">
          <h5>선택 검사</h5>
        </div>
        <div class="widget-title">
            <ul class="nav nav-tabs"><!--  class="active" -->
              <li><a data-toggle="tab" href="#tab1" class="active">MRI검사(폐)</a></li>
              <li><a data-toggle="tab" href="#tab2">유방암검사</a></li>
              <li><a data-toggle="tab" href="#tab3">폐렴검사</a></li>
              <li><a data-toggle="tab" href="#tab4">폐결핵검사</a></li>
              <li><a data-toggle="tab" href="#tab5">뇌종양검사</a></li>
            </ul>
          </div>
          <div class="widget-content tab-content">
            <div id="tab1" class="tab-pane active">
              <form action="#" method="get" class="form-horizontal">
	           <div class="control-group">
	             <label class="control-label">Select input</label>
	             <div class="controls">
	               <select >
	                 <option>First option</option>
	                 <option>Second option</option>
	                 <option>Third option</option>
	                 <option>Fourth option</option>
	                 <option>Fifth option</option>
	                 <option>Sixth option</option>
	                 <option>Seventh option</option>
	                 <option>Eighth option</option>
	               </select>
	             </div>
	           </div>
	           <div class="control-group">
	             <label class="control-label">Multiple Select input</label>
	             <div class="controls">
	               <select multiple >
	                 <option>First option</option>
	                 <option selected>Second option</option>
	                 <option>Third option</option>
	                 <option>Fourth option</option>
	                 <option>Fifth option</option>
	                 <option>Sixth option</option>
	                 <option>Seventh option</option>
	                 <option>Eighth option</option>
	               </select>
	             </div>
	           </div>
	           <div class="control-group">
	             <label class="control-label">Radio inputs</label>
	             <div class="controls">
	               <label>
	                 <input type="radio" name="radios" />
	                 First One</label>
	               <label>
	                 <input type="radio" name="radios" />
	                 Second One</label>
	               <label>
	                 <input type="radio" name="radios" />
	                 Third One</label>
	             </div>
	           </div>
	           <div class="control-group">
	             <label class="control-label">Checkboxes</label>
	             <div class="controls">
	               <label>
	                 <input type="checkbox" name="radios" />
	                 First One</label>
	               <label>
	                 <input type="checkbox" name="radios" />
	                 Second One</label>
	               <label>
	                 <input type="checkbox" name="radios" />
	                 Third One</label>
	             </div>
	           </div>
	           <div class="control-group">
	             <label for="checkboxes" class="control-label">Data Toggle checkbox</label>
	             <div class="controls">
	               <div data-toggle="buttons-checkbox" class="btn-group">
	                 <button class="btn btn-primary" type="button">Left</button>
	                 <button class="btn btn-primary" type="button">Middle</button>
	                 <button class="btn btn-primary" type="button">Right</button>
	               </div>
	             </div>
	           </div>
	           <div class="control-group">
	             <label for="checkboxes" class="control-label">Data Radio button</label>
	             <div class="controls">
	               <div data-toggle="buttons-radio" class="btn-group">
	                 <button class="btn btn-primary" type="button">Left</button>
	                 <button class="btn btn-primary" type="button">Middle</button>
	                 <button class="btn btn-primary" type="button">Right</button>
	               </div>
	             </div>
	           </div>
	           <div class="control-group">
	             <label class="control-label">File upload input</label>
	             <div class="controls">
	               <input type="file" />
	             </div>
	           </div>
	           <div class="control-group">
	             <label class="control-label">Disabled Input</label>
	             <div class="controls">
	               <input type="text" placeholder="You can't type anything…" disabled="" class="span11">
	             </div>
	           </div>
	         </form>
          </div>
            <div id="tab2" class="tab-pane">
              <p> waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end. </p>
            </div>
            <div id="tab3" class="tab-pane">
              <p>full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end. </p>
            </div>
            <div id="tab4" class="tab-pane">
              <p> waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end. </p>
            </div>
            <div id="tab5" class="tab-pane">
              <p>full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end. </p>
            </div>
          </div>
      </div>
    </div>
    
    <div class="span8">
      <div class="widget-box">
        <div class="widget-title">
          <h5>의사 작성</h5>
        </div>
        <div class="widget-content "> <!-- nopadding -->
          <form action="#" class="form-horizontal">
            <div class="control-group">
              <label for="normal" class="control-label">의사 소견</label>
              <div class="controls">
              	<textarea class="textarea_editor span10" rows="12" placeholder="Enter text ..."></textarea>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">과거 병력 여부</label>
              <div class="controls">
                <label>
                 <input type="radio" name="radios" value = "1"/>
                 	무</label>
                <label>
                 <input type="radio" name="radios" value = "2"/>
                 	유</label>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">약물 치료 여부</label>
              <div class="controls">
                <label>
                 <input type="radio" name="radios2" value = "1"/>
                 	무</label>
                <label>
                 <input type="radio" name="radios2" value = "2"/>
                 	유</label>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">생활 습관</label>
              <div class="controls">
                <label>
                 <input type="checkbox" name="checks" value = "1"/>
                 	금연 필요</label>
                <label>
                 <input type="checkbox" name="checks" value = "2"/>
                 	절주 필요</label>
                <label>
                 <input type="checkbox" name="checks" value = "3"/>
                 	신체활동 필요</label>
                <label> 
                 <input type="checkbox" name="checks" value = "4"/>
                 	근력운동 필요</label>
              </div>
            </div>
       
            <div class="form-actions">
              <input type="submit" class="btn btn-success" value = "Save" style = "float : right">
            </div>
          </form>
        </div>
       </div>
      </div>
      
      <div class="row-fluid">
      <div class="span12">
      <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>전 검사 내역</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>담당의</th>
                  <th>처방</th>
                  <th>주의사항</th>
                  <th>처방날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr class="gradeX">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0</td>
                  <td>Win 95+</td>
                  <td class="center">4</td>
                </tr>
                <tr class="gradeC">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 5.0</td>
                  <td>Win 95+</td>
                  <td class="center">5</td>
                </tr>
                <tr class="gradeA">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 5.5</td>
                  <td>Win 95+</td>
                  <td class="center">5.5</td>
                </tr>
                <tr class="gradeA">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 6</td>
                  <td>Win 98+</td>
                  <td class="center">6</td>
                </tr>
                <tr class="gradeA">
                  <td>Trident</td>
                  <td>Internet Explorer 7</td>
                  <td>Win XP SP2+</td>
                  <td class="center">7</td>
                </tr>
                <tr class="gradeA">
                  <td>Trident</td>
                  <td>AOL browser (AOL desktop)</td>
                  <td>Win XP</td>
                  <td class="center">6</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td class="center">1.7</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Firefox 1.5</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Firefox 2.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Firefox 3.0</td>
                  <td>Win 2k+ / OSX.3+</td>
                  <td class="center">1.9</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Camino 1.0</td>
                  <td>OSX.2+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Camino 1.5</td>
                  <td>OSX.3+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Netscape 7.2</td>
                  <td>Win 95+ / Mac OS 8.6-9.2</td>
                  <td class="center">1.7</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Netscape Browser 8</td>
                  <td>Win 98SE+</td>
                  <td class="center">1.7</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Netscape Navigator 9</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.0</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.1</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1.1</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.2</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1.2</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.3</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1.3</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.4</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1.4</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.5</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1.5</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.6</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">1.6</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.7</td>
                  <td>Win 98+ / OSX.1+</td>
                  <td class="center">1.7</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Mozilla 1.8</td>
                  <td>Win 98+ / OSX.1+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Seamonkey 1.1</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Gecko</td>
                  <td>Epiphany 2.20</td>
                  <td>Gnome</td>
                  <td class="center">1.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>Safari 1.2</td>
                  <td>OSX.3</td>
                  <td class="center">125.5</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>Safari 1.3</td>
                  <td>OSX.3</td>
                  <td class="center">312.8</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>Safari 2.0</td>
                  <td>OSX.4+</td>
                  <td class="center">419.3</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>Safari 3.0</td>
                  <td>OSX.4+</td>
                  <td class="center">522.1</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>OmniWeb 5.5</td>
                  <td>OSX.4+</td>
                  <td class="center">420</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>iPod Touch / iPhone</td>
                  <td>iPod</td>
                  <td class="center">420.1</td>
                </tr>
                <tr class="gradeA">
                  <td>Webkit</td>
                  <td>S60</td>
                  <td>S60</td>
                  <td class="center">413</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 7.0</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 7.5</td>
                  <td>Win 95+ / OSX.2+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 8.0</td>
                  <td>Win 95+ / OSX.2+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 8.5</td>
                  <td>Win 95+ / OSX.2+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 9.0</td>
                  <td>Win 95+ / OSX.3+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 9.2</td>
                  <td>Win 88+ / OSX.3+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera 9.5</td>
                  <td>Win 88+ / OSX.3+</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Opera for Wii</td>
                  <td>Wii</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Nokia N800</td>
                  <td>N800</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Presto</td>
                  <td>Nintendo DS browser</td>
                  <td>Nintendo DS</td>
                  <td class="center">8.5</td>
                </tr>
                <tr class="gradeC">
                  <td>KHTML</td>
                  <td>Konqureror 3.1</td>
                  <td>KDE 3.1</td>
                  <td class="center">3.1</td>
                </tr>
                <tr class="gradeA">
                  <td>KHTML</td>
                  <td>Konqureror 3.3</td>
                  <td>KDE 3.3</td>
                  <td class="center">3.3</td>
                </tr>
                <tr class="gradeA">
                  <td>KHTML</td>
                  <td>Konqureror 3.5</td>
                  <td>KDE 3.5</td>
                  <td class="center">3.5</td>
                </tr>
                <tr class="gradeX">
                  <td>Tasman</td>
                  <td>Internet Explorer 4.5</td>
                  <td>Mac OS 8-9</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeC">
                  <td>Tasman</td>
                  <td>Internet Explorer 5.1</td>
                  <td>Mac OS 7.6-9</td>
                  <td class="center">1</td>
                </tr>
                <tr class="gradeC">
                  <td>Tasman</td>
                  <td>Internet Explorer 5.2</td>
                  <td>Mac OS 8-X</td>
                  <td class="center">1</td>
                </tr>
                <tr class="gradeA">
                  <td>Misc</td>
                  <td>NetFront 3.1</td>
                  <td>Embedded devices</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeA">
                  <td>Misc</td>
                  <td>NetFront 3.4</td>
                  <td>Embedded devices</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeX">
                  <td>Misc</td>
                  <td>Dillo 0.8</td>
                  <td>Embedded devices</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeX">
                  <td>Misc</td>
                  <td>Links</td>
                  <td>Text only</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeX">
                  <td>Misc</td>
                  <td>Lynx</td>
                  <td>Text only</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeC">
                  <td>Misc</td>
                  <td>IE Mobile</td>
                  <td>Windows Mobile 6</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeC">
                  <td>Misc</td>
                  <td>PSP browser</td>
                  <td>PSP</td>
                  <td class="center">-</td>
                </tr>
                <tr class="gradeU">
                  <td>Other browsers</td>
                  <td>All others</td>
                  <td>-</td>
                  <td class="center">-</td>
                </tr>
                <tr>
                  <td>이도환</td>
                  <td>배아픔</td>
                  <td>약4일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>박건형</td>
                  <td>머리아픔</td>
                  <td>약5일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>김동규</td>
                  <td>배아픔</td>
                  <td>약4일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>허성민</td>
                  <td>머리아픔</td>
                  <td>약5일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>한상진</td>
                  <td>배아픔</td>
                  <td>약4일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>김현수</td>
                  <td>머리아픔</td>
                  <td>약5일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>허소정</td>
                  <td>배아픔</td>
                  <td>약4일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>박미성</td>
                  <td>머리아픔</td>
                  <td>약5일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>장진호</td>
                  <td>배아픔</td>
                  <td>약4일처방</td>
                  <td class="center">날짜</td>
                </tr>
                <tr>
                  <td>함정화</td>
                  <td>머리아픔</td>
                  <td>약5일처방</td>
                  <td class="center">날짜</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        </div>
        <div class="widget-box">
	      <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
	        <h5><span onclick = "ajaxCalendar();" style = "cursor : pointer;">스마트 캘린더</span></h5>
	      </div>
	      <div class="widget-content">
	        <div class="control-group">
	          <form>
	            <div class="controls" id = "calendar">
	       
	            </div>
	          </form>
	        </div>
	      </div>
	    </div>
        </div>
    </div>
  </div>
  
    
  </div>
</div>
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

<script src="resources/js/jquery.ui.custom.js"></script> 
<script src="resources/js/matrix.js"></script>
<!-- 끝 -->
</body>
</html>
