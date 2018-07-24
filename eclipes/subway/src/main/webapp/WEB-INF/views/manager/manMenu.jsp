<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SUBWAY 써브웨이 관리자</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/subwayadmin.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2O/jquery.min.js"></script>-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<link href="images/common/subway_favicon.ico?v=1" rel="shortcut icon" type="image/x-icon">
</head>
<body>

<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">
          <img alt="Brand" src="images/logo_sub_header.png">
        </a>
        <div class="nav-btn-wrap logout">

          <div class="logout-btn-wrap"><a href="/manager/manLogout.do"><span class="glyphicon glyphicon-off"></span>${user.name }님 로그아웃</a></div>
          <button onclick="location.href='/manager/manUpdateForm.do?id=${user.id }'" type="button" class="nav-homebtn btn btn-info"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></button>
        </div>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class="user-wrap">
        <c:if test="${Onsale>0}">
          <div class="talkbubble">
            <span class="glyphicon glyphicon-user"></span>영업중
          </div>
        </c:if>
        </div>
        <div class="menubtn-wrap">
          <ul>
            <li><button type="button" onclick="location.href='/manager/productList.do'" class="btn btn-success">상품관리</button></li>
            <li><button type="button" onclick="location.href='/manager/salesDaily.do'" class="btn btn-success">매출관리</button></li>
            <li><button type="button" onclick="location.href='/manager/salesTime.do'" class="btn btn-success">영업관리</button></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
<footer>

</footer>
</body>
</html>