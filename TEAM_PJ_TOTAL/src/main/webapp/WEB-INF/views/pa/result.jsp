<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
</head>
<body>
	<div class="widget-title"> 
      <h5 style="float:none; font-weight:900">건강검진 결과통보서</h5>
    </div>
	<div class="widget-content nopadding">
	<table class="table" style="text-align:center !important; v-align:middle !important">
	<thead>
		<tr>
          <th>성명</th>
		  <th colspan="2">김메디</th>
		  <th>주민등록번호</th>
		  <th colspan="3">930217-1000000</th>
        </tr>
        <tr>
          <th>사업장명</th>
		  <th colspan="2">코스모</th>
		  <th>건강진단장소</th>
		  <th colspan="3">코스모</th>
        </tr>
    </thead>
    	
    <tbody>
   		<tr>
          <th colspan="7"></th>
        </tr>
		<tr>
			<td rowspan="3">진찰</td>
			<td rowspan="2">과거병력</td>
			<td>진단여부</td>
			<td>123456</td>
			<td rowspan="2">외상및후유증</td>
			<td colspan="2" rowspan="2">456789</td>
		</tr>
		<tr>
			<td>약물치료여부</td>
			<td>7</td>
		</tr>
		<tr>
			<td colspan="2">생활습관</td>
			<td>조아요~</td>
			<td>일반상태</td>
			<td colspan="2">5</td>
		</tr>
		<tr>
			<td rowspan="2">구분</td>
			<td rowspan="2">목표질환</td>
			<td rowspan="2">검사항목</td>
			<td rowspan="2">결과</td>
			<td colspan="3">참고치</td>
		</tr>
		<tr>
			<td>정상A(건강양호)</td>
			<td colspan="2">간염</td>
		</tr>
		
	<!-- 계측검사 -->	
		<tr>
			<td rowspan="7">계측검사</td>
			<td rowspan="4">비만</td>
			<td>신장</td>
			<td>cm</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>체중</td>
			<td>kg</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>허리둘레</td>
			<td>cm</td>
			<td>남 90미만/여 85미만</td>
			<td colspan="2"> __ - __ </td>
		</tr>
		<tr>
			<td>체질량지수</td>
			<td>kg/㎡</td>
			<td>18.5 ~ 24.9</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td>시각이상</td>
			<td>시력 (좌/우)</td>
			<td>__/__</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>청각이상</td>
			<td>청력 (좌/우)</td>
			<td>__/__</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>고혈압</td>
			<td>혈압(최고/최저)</td>
			<td>mmHg</td>
			<td>120미만 / 80미만</td>
			<td colspan="2">고혈압 </td>
		</tr>
		
	<!-- 요검사  -->
		<tr>
			<td>요검사</td>
			<td>신장질환</td>
			<td>요단백</td>
			<td></td>
			<td>음성</td>
			<td colspan="2">약양성 ±</td>
		</tr>
		
	<!-- 혈액검사 -->
		<tr>
			<td rowspan="11">혈액검사</td>
			<td>빈혈 등</td>
			<td>혈색소</td>
			<td>g/dL</td>
			<td>남:13~16.5<br>
				여:12~15.5</td>
			<td colspan="2">남:13~16.5<br>
				여:12~15.5</td>
		</tr>
		<tr>
			<td>당뇨병</td>
			<td>식전혈당</td>
			<td>mg/dL</td>
			<td>100미만</td>
			<td colspan="2">100 - 125</td>
		</tr>
		
	<!-- 고혈압 -->
		<tr>
			<td rowspan="4">고혈압<br>이상지질혈증<br>동맥경화</td>
			<td>총콜레스테롤</td>
			<td>mg/dL</td>
			<td>200미만</td>
			<td colspan="2">200 - 239</td>
		</tr>
		<tr>
			<td>HDL-콜레스테롤</td>
			<td>mg/dL</td>
			<td>60이상</td>
			<td colspan="2">40 - 59</td>
		</tr>
		<tr>
			<td>트리글리세라이드</td>
			<td>mg/dL</td>
			<td>100-150미만</td>
			<td colspan="2">150 - 199</td>
		</tr>
		<tr>
			<td>(LDL-콜레스테롤)</td>
			<td>mg/dL</td>
			<td>100미만</td>
			<td colspan="2">100 - 159</td>
		</tr>
	
	<!-- 만성신장질환 -->
		<tr>
			<td>만성신장질환</td>
			<td>혈청크레아티닌</td>
			<td>mg/dL</td>
			<td>1.5 이하</td>
			<td colspan="2">-</td>
		</tr>
		
	<!-- 간장질환 -->
		<tr>
			<td rowspan="3">간장질환</td>
			<td>AST(SGOT)</td>
			<td>U/L</td>
			<td>40이하 </td>
			<td colspan="2">41 - 50 </td>
		</tr>
		<tr>
			<td>ALT(SGPT)</td>
			<td>U/L</td>
			<td>120미만 / 80미만</td>
			<td colspan="2">고혈압 </td>
		</tr>
		<tr>
			<td>감마지티피(γ-GTP)</td>
			<td>U/L</td>
			<td>남:11-63 여:8-35</td>
			<td colspan="2">남:64-77 여:36-45 </td>
		</tr>
		<!-- <tr>
			<td>간장질환</td>
			<td>mmHg</td>
			<td>120미만 / 80미만</td>
			<td colspan="2">고혈압 </td>
		</tr>
		<tr>
			<td>간장질환</td>
			<td>mmHg</td>
			<td>120미만 / 80미만</td>
			<td colspan="2">고혈압 </td>
		</tr>
		<tr>
			<td>간장질환</td>
			<td>mmHg</td>
			<td>120미만 / 80미만</td>
			<td colspan="2">고혈압 </td>
		</tr> -->
		
	<!-- 영상검사 -->
		<tr>
			<td>영상검사</td>
			<td>폐결핵 흉부질환</td>
			<td>흉부방사선검사</td>
			<td>정상, 비활동성</td>
			<td colspan="2">-</td>
		</tr>
	<!-- 소견 및 조치사항 -->
		<tr>
			<td>소견 및 조치사항</td>
			<td colspan="6">혈압, 이상지질혈증 관리 요함</td>
		</tr>
	<!-- 판정 -->
		<tr>
			<td rowspan="4">판정</td>
			<td>정상 B </td>
			<td colspan="2">혈압관리, 시력관리</td>
			<td rowspan="2">판정일</td>
			<td rowspan="2" colspan="2">yyyy-mm-dd</td>
		</tr>
		<tr>
			<td>건강주의(C)</td>
			<td colspan="2">4</td>
		</tr>
		<tr>
			<td>건강주의(R1)</td>
			<td colspan="2"> </td>
			<td rowspan="2">판정의사</td>
			<td>면허</td>
			<td>4</td>
		</tr>
		<tr>
			<td>건강주의(R2)</td>
			<td colspan="2"></td>
			<td>성명</td>
			<td>4</td>
		</tr>
		
		
	</tbody>
	</table>
	</div>
	
</body>
</html>
