<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script>
  function salesstart(){
	var date = new Date();
	var now_date = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
	var now_time = date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
    var con = confirm(now_date+'  '+now_time+'\n영업을 시작하시겠습니까?')
    if(con==true){
      location.href='/manager/setTime.do?sales=영업시작';
      //var startbtn = document.getElementById('btn_sales');
      //startbtn.disabled = 'true';
    }
    
  }
</script>
</head>
<body>
<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">
          <img alt="Brand" src="images/logo_sub_header.png">
        </a>
        <div class="nav-btn-wrap">
          <button onclick="location.href='/manager/manMenu.do'" type="button" class="nav-homebtn btn btn-success"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></button>
        </div>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class="menubtn-wrap">
          <ul>
            <li><button type="button" onclick="salesstart();" id="btn_sales" class="btn btn-success" <c:if test="${Onsale!=0}">disabled</c:if> >영업시작</button></li>
            <li><button type="button" onclick="location.href='/manager/salesTimeClose.do'" class="btn btn-success" <c:if test="${Onsale==0}">disabled</c:if> >영업종료</button></li>
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