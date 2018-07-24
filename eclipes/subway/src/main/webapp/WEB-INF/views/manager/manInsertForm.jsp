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
<script src="js/subwayadmin.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<header>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">
          <img alt="Brand" src="images/logo_sub_header.png">
        </a>
      </div>
    </div>
  </nav>
</header>
<section>
  <div id="container" class="content-wrap">
    <div class="container">
      <div class="row">
        <div class="page-header">
          <h1>관리자등록</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="adminform" action="/manager/manInsert.do" method="get" role="form">
            <div class="form-group">
              <label for="InputID">아이디</label>
              <input type="text" class="form-control" id="InputID" name="id" value="" placeholder="아이디" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" name="pw" value="" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" name="pw2" value="" placeholder="비밀번호 확인" required>
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" name="name" value="" placeholder="이름을 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label for="phnum">휴대폰번호</label>
              <input type="text" class="form-control" id="phnum" name="hpnum" value="" maxlength="13" placeholder="휴대폰을 입력해 주세요" required>
            </div>
            <div class="form-group">
              <label for="address">주소</label>
              <input type="text" class="form-control" id="address" name="address" value="" placeholder="주소를 입력해 주세요" required>
            </div>
            <div class="form-group text-center">
              <button type="button" onclick="location.href='/manager/manMain.do'" class="btn btn-warning">취소<i class="fa fa-times spaceLeft"></i></button>
              <button type="submit" class="btn btn-info">등록<i class="fa fa-check spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<footer>

</footer>
</body>
</html>