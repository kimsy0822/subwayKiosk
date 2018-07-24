<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page session="false" %>
<html>
<head>
<title>SUBWAY</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="manager/css/subwayadmin.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2O/jquery.min.js"></script>-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<link href="manager/images/common/subway_favicon.ico?v=1" rel="shortcut icon" type="image/x-icon">
<style>
  nav{display:none;}
</style>
<script type="text/javascript">
	var res = ${res};
	function openCheck(res) {
		if(res==0){
			var con=confirm("영업을 시작하지 않으면 매출 등록이 불가능합니다. \n영업시작 페이지로 이동하시겠습니까?")
			if (con==true) {
				 location.href='/manager/salesTime.do';
			}else{
				location.href='/';
			}
		}else{
			location.href='/kiosk/main.do';
		}
	}
</script>
</head>
<body>

<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">
          <img alt="Brand" src="manager/images/logo_sub_header.png">
        </a>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class=" page-center">
          <img class="admainlogo" alt="Brand" src="manager/images/Subway-logo-2016.png">
          <div class="main-contents">
          	<P>The time on the server is ${serverTime}.</P>
          	<div class="btn-wrap">
          		<button type="button" onclick="location.href='/kiosk/main.do'" class="btn btn-success">키오스크</button>
          		<button type="button" onclick="location.href='/manager/manMain.do'" class="btn btn-success">관리자</button>
          	</div>
          
              
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<footer>
<%-- <c:redirect url = "/kiosk/main.do"/> --%>
</footer>
</body>
</html>
