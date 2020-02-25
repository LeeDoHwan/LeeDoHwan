<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
    
<head>
	<title>start</title><meta charset="UTF-8" />
	
	<link type = "text/css" rel = "stylesheet" href = "resources/css/style.css">
</head>

<body>
  <c:if test = "${errMsg != null}">
	  <script type="text/javascript">
	  	alert("${errMsg}");
	  </script>
  </c:if>
  <section class="hero">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-12">
          <a class="hero-brand" href="index.html" title="Home"><img alt="Bell Logo" src="resources/img/logo2.png"></a>
        </div>
      </div>

      <div class="col-md-12">
        <h1>
            Unparalleled Expertise
          </h1>

        <p class="tagline">
          State-of-the-art features you may or may not notice, The nearest hospital to life
        </p>
        <a class="btn btn-full" href="login.lo?authority=0">관리자</a>
        <a class="btn btn-full" href="login.lo?authority=1">의사</a>
        <a class="btn btn-full" href="login.lo?authority=2">환자</a>
      </div>
    </div>
  </section>
</body>

</html>
