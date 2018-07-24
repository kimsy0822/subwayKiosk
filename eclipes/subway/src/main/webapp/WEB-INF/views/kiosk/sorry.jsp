<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SUBWAY 써브웨이</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/subway.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="js/subway.js"></script>
<link href="images/common/subway_favicon.ico" rel="shortcut icon" type="image/x-icon">
<style>
.sorry-wrap {z-index: 10;}
.sorry-wrap .sorry-bg {position:fixed; top:0; left:0; width: 100%; height:100%; background: rgba(0,0,0,0.5); z-index: 10;}
.sorry-wrap .sorry-bg .sorry {position:sticky; top:50%; left:50%; transform: translateX(-50%) translateY(-50%); width:50%; height: 200px; background: #fff; border:1px solid #333;}
.sorry-wrap .sorry-bg .sorry .contents {position: absolute; top:40%; left:50%; transform: translateX(-50%) translateY(-40%); width:100%; text-align: center;}
.sorry-wrap .sorry-bg .sorry .contents span {color:#de0000; font-size: 2em;}
.sorry-wrap .sorry-bg .sorry .contents p { color: #292929; font-family: font_ns, sans-serif; font-size: 1.2em; font-weight: bold;}
.sorry-wrap .sorry-bg .sorry .contents p span {color: #000; font-size: 1.2em; }

</style>
<script>
function window_onload(){
   setTimeout('go_url()',2000)  // 4초후 go_url() 함수를 호출한다.
}
function go_url(){
  location.href="/kiosk/main.do"  // 페이지 이동...
}
</script>
</head>
<body onload="javascript:window_onload()">
<header>
  <div id="header" class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12">
        <h1 class="logo"><a href="/kiosk/main.do">SUBWAY</a></h1>
      </div>
    </div>
  </div>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
      	<div class="col-xs-12 sorry-wrap">
      	<div class="sorry-bg">
      	<div class="sorry">
	      	<div class="contents">
	           <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
	           <p><span class="miss-tit">죄송합니다 지금은 영업시간이 아닙니다.</span></p>
	         </div>
      	</div>
      	</div>
	      	 
      	</div>


      </div>
    </div>
  </div>
</section>
<footer>
  <div id="footer">
    <div class="content">
      <p class="copyright">SUBWAY® is a Registered Trademark of Subway IP Inc.© 2018 Subway IP Inc.All Rights Reserved.</p>
    </div>
  </div>
</footer>
</body>
</html>
