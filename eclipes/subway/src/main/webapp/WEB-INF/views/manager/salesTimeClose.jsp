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
<style>
  nav{display:none;}
</style>
<script>
	
  function salesclose(){
    
    var pw= ${pw};
    var inPw= document.getElementById("inputPassword").value;
    var saleing = document.getElementById('talkbubble');
    
    if (inPw==pw) {
    	var con = confirm('영업을 종료합니다');
    	if(con==true){
    		  //saleing.disabled = 'disabled';
    	      location.href="/manager/setTime.do?sales=영업종료";
    	    }
	}else{
		
		document.getElementById("result"). value = "비밀번호를 다시 확인 해 주세요";
	}
  }
 
</script>
<style type="text/css">
	#result{border: none; color: red;}
</style>
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
        <div class=" page-center">
          <img class="admainlogo" alt="Brand" src="images/Subway-logo-2016.png">
          <div class="main-contents">

            <form action="" class="form-horizontal">
              <div class="form-group">
                <div>영업종료확인</div>
              </div>
              <div class="form-group">
                <label for="inputPassword" class="col-xs-2 control-label">Password</label>
                <div class="col-xs-10">
                  <input type="password" class="form-control height55" id="inputPassword" name="inputPassword" placeholder="Password" onchange="salesclose();">
                </div>
              </div>
              <div class="form-group">
                <input id="result" value="" onclick="">
              </div>
              
              <div class="form-group">
                <button type="button" onclick="salesclose();"class="main-btn btn btn-success" >영업종료</button>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<footer>

</footer>
</body>
</html>