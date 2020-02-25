<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>  

<c:set var = "project" value = "${pageContext.request.contextPath}/resources/" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
<%-- <link type = "text/css" rel = "stylesheet" href = "${project}css/style.css"> --%>

<%-- 기존 setting
<meta charset="utf-8" name = "viewport" content = "width=device-width, initial-scale = 1">
<link rel="stylesheet" href="${project}css/bootstrap.min.css" />
<link rel="stylesheet" href="${project}css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${project}css/fullcalendar.css" />
<link rel="stylesheet" href="${project}css/matrix-style.css" />
<link rel="stylesheet" href="${project}css/matrix-media.css" />
<link href="${project}font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="${project}css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'> 
--%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="${project}css/fontawesome.min.css">
<link rel="stylesheet" href="${project}css/bootstrap.min.css">
<link rel="stylesheet" href="${project}css/templatemo-style.css">

