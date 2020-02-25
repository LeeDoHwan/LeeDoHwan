<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table id="appointmentTime">                  
      <tr>
         <c:forEach var = "dto" items = "${dtos}">
         <td>
            <label><input type="radio" name="apptTime" value="${dto}" onclick = "clickTime();"/>${dto}(남은 인원 : ${dtosNum[i]})</label>
            <c:set var = "i" value = "${i+1}" />
         </td>
         </c:forEach>         
      </tr>
   </table>
   
   <input type="hidden" name="date" value="${date}">
   
</body>
</html>